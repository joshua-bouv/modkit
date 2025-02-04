-- sobgroup.lua: populates the global scope with extra custom SobGroup_ functions.
-- By: Fear (Novaras)

if (H_SOBGROUP ~= 1) then
	if (makeStateHandle == nil) then
		dofilepath("data:scripts/modkit/scope_state.lua");
	end
	local state = makeStateHandle();
	local freshGroupIndex = function ()
		local current = %state().__group_fresh_index or 1;
		%state({
			__group_fresh_index = current + 1
		});

		return current;
	end

	--- Creates a new sobgroup if one doesn't exist, then clears the group to ensure the group referenced by the return string is clear.
	---@param name string | nil The name of the SobGroup to create/clear. If `nil`, a unique name is generated
	---@return string
	function SobGroup_Fresh(name)
		if (name == nil) then
			name = ("_SobGroup_Fresh_" .. %freshGroupIndex());
		end
		SobGroup_CreateIfNotExist(name);
		SobGroup_Clear(name);
		return name;
	end

	--- Returns `1` if the given groups are _identical_ (same ships exactly), else `nil`.
	---
	---@param group_a string
	---@param group_b string
	---@return bool
	function SobGroup_AreEqual(group_a, group_b)
		-- print("count: " .. SobGroup_Count(group_a) .. " vs " .. SobGroup_Count(group_b));
		-- print("ainb: " .. (SobGroup_GroupInGroup(group_a, group_b) or "nil"));
		-- print("bina: " .. (SobGroup_GroupInGroup(group_b, group_a) or "nil"));
		if (
			SobGroup_Count(group_a) == SobGroup_Count(group_b) and
			SobGroup_GroupInGroup(group_a, group_b) == 1 and
			SobGroup_GroupInGroup(group_b, group_a) == 1
		) then
			return 1;
		end
	end

	--- Overwrites `target_group` with the content of `incoming_group`.
	---@param target_group string The name of the group to overwrite
	---@param incoming_group string The name of the group which will overwrite `target_group`
	---@return string
	function SobGroup_Overwrite(target_group, incoming_group)
		SobGroup_Clear(target_group)
		SobGroup_SobGroupAdd(target_group, incoming_group)
		return target_group;
	end

	--- Creates a new SobGroup, named with `new_name`, or '<original-name>-clone', if a new name is not provided for the group.
	---@param original string The original group
	---@param new_name string? The name of the new SobGroup created
	---@return string
	function SobGroup_Clone(original, new_name)
		new_name = new_name or (original .. "-clone");
		SobGroup_Fresh(new_name);
		SobGroup_SobGroupAdd(new_name, original);
		return new_name;
	end

	--- Disable scuttle while a captured unit is being dropped off by salvage corvettes.
	-- Actually polls whether the group is performing AB_Dock to perform this check.
	---@param group string The group which will have its AB_Scuttle ability disabled
	function SobGroup_NoSalvageScuttle(group)
		SobGroup_AbilityActivate(group, AB_Scuttle, 1 - SobGroup_IsDoingAbility(group, AB_Dock));
		return group;
	end

	--- When a docking squadron is under attack, they sometimes glitch and stop. This issues another dock order to dock with the closest ship.
	---@param group string The group which will be polled, and then issued a new dock command under certain conditions
	---@return string
	function SobGroup_UnderAttackReissueDock(group)
		if (SobGroup_GetCurrentOrder(group) == COMMAND_Dock) then -- en route to dock
			if (SobGroup_UnderAttack(group)) then -- under attack
				if (SobGroup_Count(group) < SobGroup_GetStaticF(group, "buildBatch")) then -- lost one or more members
					if (SobGroup_IsDocked(group) == 0) then -- no member of this squad is docked
						if (SobGroup_GetActualSpeed(group) < 50) then -- probably bugged into stopping - could get unlucky here and catch a pivoting squad
							SobGroup_DockSobGroupWithAny(group)
						end
					end
				end
			end
		end
		return group;
	end

	--- Checks to see if any ship in `group` is being captured.
	---@param group string The group to check
	---@return bool
	function SobGroup_AnyBeingCaptured(group)
		local group_being_captured = group .. "_being_captured";
		SobGroup_Fresh(group_being_captured);
		SobGroup_GetSobGroupBeingCapturedGroup(group, group_being_captured);
		return SobGroup_Count(group_being_captured) > 0;
	end

	--- Checks to see if any ship in `group` has attack targets.
	---@param group string The group to check
	---@return bool
	function SobGroup_AnyAreAttacking(group)
		local group_attacking = group .. "_attacking";
		SobGroup_Fresh(group_attacking);
		SobGroup_GetCommandTargets(group_attacking, group, COMMAND_Attack);
		return SobGroup_Count(group_attacking) > 0;
	end

	--- Returns a group of all active ships for all players.
	---@param target_group string | nil A group which will be filled with all the Universe ships. If not provided, is ignored and a new group is used.
	---@return string
	function Universe_GetAllActiveShips(target_group)
		local all_ships = SobGroup_Fresh("all-ships");
		for i = 0, Universe_PlayerCount() - 1 do
			if (Player_IsAlive(i)) then
				SobGroup_SobGroupAdd(all_ships, "Player_Ships" .. i);
			end
		end
		if (target_group ~= nil) then
			SobGroup_CreateIfNotExist(target_group);
			SobGroup_Clear(target_group);
			SobGroup_SobGroupAdd(target_group, all_ships);
			return target_group;
		end
		return all_ships;
	end

	--- Multiplies the group's max-speed multiplier by 'mult'.
	---@param target_group string The group to modify
	---@param mult number A factor which is multiplied with the *current* speed multiplier, then applied with `SobGroup_SetSpeed`.
	---@return string
	function SobGroup_AlterSpeedMult(target_group, mult)
		if (mult == nil) then
			mult = 1/2;
		end
		local speed_mult = SobGroup_GetSpeed(target_group) * mult;
		if (speed_mult < 0.05) then
			speed_mult = 0;
		end
		SobGroup_SetSpeed(target_group, speed_mult);

		return target_group;
	end

	STUN_EFFECT_ABILITIES = {
		-- AB_Cloak,
		-- AB_AcceptDocking,
		-- AB_Builder,
		AB_Hyperspace,
		AB_FormHyperspaceGate,
		AB_HyperspaceViaGate,
		AB_SpecialAttack,
		AB_DefenseField,
		AB_DefenseFieldShield,
		AB_Steering,
		AB_Targeting,
		AB_Lights,
		AB_Move,
		AB_Mine,
		AB_Custom,
		AB_Dock,
		AB_Parade,
		AB_Retire,
		-- AB_Repair
	}
	STUN_EFFECT_EVENT = "PowerOff"

	--- Sets whether the given group should be 'stunned' or not (AB_Move/AB_Steering/AB_Attack/AB_Targeting).
	-- See globals `STUN_EFFECT_ABILITIES` and `STUN_EFFECT_EVENT`.
	---@param target_group string The group to stun/unstun
	---@param stunned number Whether or not to stun the group (1 = stun, 0 = free)
	---@return string
	function SobGroup_SetGroupStunned(target_group, stunned)
		if (SobGroup_Count(target_group) > 0) then
			if (stunned == 1) then
				FX_StartEvent(target_group, STUN_EFFECT_EVENT)
				SobGroup_Disable(target_group, 1)
			else
				FX_StopEvent(target_group, STUN_EFFECT_EVENT)
				SobGroup_Disable(target_group, 0)
			end
			local ability_status = mod(stunned + 1, 2) -- 0 -> 1, 1 -> 0, 2 -> 1, ...
			for _, ability in STUN_EFFECT_ABILITIES do
				SobGroup_AbilityActivate(target_group, ability, ability_status)
			end
		end
		return target_group
	end

	--- Gets the distance (as an integer) between two SobGroups.
	-- (Presumable) Credits to SunTzu: https://github.com/HWRM/KarosGraveyard/wiki/UserFunction;-SobGroup_GetDistanceToSobGroup
	---@param group_a string A SobGroup in real space
	---@param group_b string A SobGroup in real space
	---@return number?
	function SobGroup_GetDistanceToSobGroup(group_a, group_b)
		if SobGroup_Empty(group_a) == 0 and SobGroup_Empty(group_b) == 0 then
			local t_position1 = SobGroup_GetPosition(group_a)
			local t_position2 = SobGroup_GetPosition(group_b)
			local li_distance = floor(sqrt((t_position1[1] - t_position2[1])*(t_position1[1] - t_position2[1]) + (t_position1[2] - t_position2[2])*(t_position1[2] - t_position2[2]) + (t_position1[3] - t_position2[3])*(t_position1[3] - t_position2[3])))
			return li_distance
		else
			return nil
		end
	end

	--- Gets the current HP of the group (as a fraction, ala SobGroup_SetHealth).
	---@param group string The SobGroup who's health to check
	---@return number
	function SobGroup_GetHealth(group)
		local max_health = SobGroup_MaxHealthTotal(group);
		local current_health = SobGroup_CurrentHealthTotal(group);
		return (current_health / max_health);
	end

	--- Creates a new volume of type `vol_type` ("sphere", "cube") named `name` with radius `radius` at position `position`.
	--- Only a `name` is required. By default, `position` is `{ 0, 0, 0 }`, `radius` is `10` and `vol_type` is `"sphere"`.
	--- Returns the supplied `name`.
	---
	---@param name any
	---@param position? table
	---@param radius? integer
	---@param vol_type? string
	---@return string
	function Volume_Fresh(name, position, radius, vol_type)
		name = name or ("_Volume_Fresh_" .. %freshGroupIndex());
		position = position or { 0, 0, 0 };
		radius = radius or 10;
		vol_type = vol_type or "sphere";
		Volume_Delete(name);
		local vol_type_calls = {
			sphere = function() return Volume_AddSphere(%name, %position, %radius); end,
			cube = function () return Volume_AddCube(%name, %position, %radius); end
		};
		vol_type_calls[vol_type]();
		return name;
	end

	function SobGroup_GetFirstAttackFamily(group)
		if (attackFamily == nil) then
			dofilepath("data:scripts/familylist.lua");
		end
		for i, family in attackFamily do
			if (SobGroup_AreAnyFromTheseAttackFamilies(group, family.name) == 1) then
				return strlower(family.name);
			end
		end
	end

	function SobGroup_HasAnyFamilyOf(group, families)
		for k, v in families do
			if (SobGroup_GetFirstAttackFamily(group) == v) then
				return 1;
			end
		end
	end

	function SobGroup_HasFighters(group)
		return SobGroup_HasAnyFamilyOf(group, {
			"fighter",
			"fighter_hw1"
		});
	end

	function SobGroup_HasCorvettes(group)
		return SobGroup_HasAnyFamilyOf(group, {
			"corvette",
			"corvette_hw1"
		});
	end

	function SobGroup_HasFrigates(group)
		return SobGroup_HasAnyFamilyOf(group, {
			"frigate"
		});
	end

	function SobGroup_HasCapitals(group)
		return SobGroup_HasAnyFamilyOf(group, {
			"smallcapitalship",
			"bigcapitalship",
			"mothership"
		});
	end

	--- _Splits_ a given `group` into a table of subgroups. The size of the subgroups is given by `granularity`.
	---
	---@param group string
	---@param granularity? integer
	---@return string[]
	function SobGroup_Split(group, granularity)
		granularity = granularity or 1;

		if (SobGroup_Count(group) <= granularity) then
			local subgroup = SobGroup_Clone(group);
			return { [1] = subgroup };
		end

		---@type string[]
		local subgroups = {};

		for i = 0, SobGroup_Count(group), granularity do
			local subgroup = SobGroup_Fresh();
			SobGroup_FillShipsByIndexRange(subgroup, group, i, granularity);
			subgroups[i + 1] = subgroup;
		end

		return subgroups;
	end

	--- Returns whether or not the supplies groups are exactly equal.
	---
	---@param group_a string
	---@param group_b string
	---@return bool
	function SobGroup_GroupsAreEqual(group_a, group_b)
		if (SobGroup_Count(group_a) ~= SobGroup_Count(group_b)) then
			return nil;
		end

		local difference = SobGroup_Fresh();
		SobGroup_FillSubstract(difference, group_a, group_b);

		return SobGroup_Count(difference) == 0;
	end

	--- Returns a table who's keys are the ship types found, with values indicating the number of each type found.
	---
	--- **THIS IS AN EXPENSIVE CALL!**
	---
	---@param group string
	---@return table<string, integer>
	function SobGroup_ShipTypes(group)
		local types = {};

		for _, subgroup in SobGroup_Split(group) do
			if (SobGroup_Count(subgroup) > 0) then
				local type = strtrim(SobGroup_GetShipType(subgroup));
				if (strlen(type) > 0) then
					types[type] = (types[type] or 0) + 1;
				end
			end
		end

		return types;
	end

	DEFAULT_SOBGROUP = SobGroup_Fresh("__")

	print("executed: sobgroup.lua")
	H_SOBGROUP = 1
end