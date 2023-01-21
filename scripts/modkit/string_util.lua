--- Returns a table containing string fragments produced by breaking `str` on every `delimeter`.
--- If the string contains no delimeters, the whole string is returned in one entry.
---@param str string
---@param delimeter string
---@return table
function strsplit(str, delimeter, return_words_only)
	delimeter = delimeter or "%s";

	local i = 1;
	local s, f;
	local matches = {};
	while(i < strlen(str)) do
		s, f = strfind(str, "([^"..delimeter.."]+)", i);
		if (s) then
			local part = strsub(str, s, f);
			local payload;
			if (return_words_only) then
				payload = part;
			else
				payload = {
					start = s,
					finish = f,
					str = part
				};
			end
			modkit.table.push(
				matches,
				payload
			);
			i = f + 1;
		else
			break;
		end
	end
	if (modkit.table.length(matches) == 0) then
		if (return_words_only) then
			matches[1] = str;
		else
			matches[1] = {
				start = 1,
				finish = strlen(str),
				str = str
			};
		end
	end
	return matches;
end

function strrepeat(str, repetitions)
	local out_str = "";
	for i = 0, repetitions do
		out_str = out_str .. str;
	end

	return out_str;
end

function strcharset(str, index, replacement)
	local pre = strsub(str, 1, index - 1);
	local post = strsub(str, index + 1, strlen(str));

	return pre .. replacement .. post;
end

function strimplode(arr, delimeter)
	delimeter = delimeter or "";

	local str = "";
	for i, word in arr do
		local delim = delimeter;
		if (i == modkit.table.length(arr)) then -- dont append anything on last entry
			delim = '';
		end
		str = str .. word .. delim;
	end

	return str;
end

function strtrim(str, dir)
	local chars = strsplit(str, '', 1);

	if (dir) then
		dir = tonumber(dir);
		if (dir > 0) then -- trim the end
			for i = tbl_length(chars), 1, -1 do
				if (not strfind(chars[i], "(%s+)")) then
					return strsub(str, 1, i);
				end
			end
		elseif (dir < 0) then -- trim the beginning
			for i = 1, tbl_length(chars) do
				if (not strfind(chars[i], '(%s+)')) then
					return strsub(str, i, strlen(str));
				end
			end
		end
	end

	return strtrim(strtrim(str, 1), -1); -- trim both
end