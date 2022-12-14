if (MK_SHIP_TYPES == nil) then

	if (modkit == nil) then
		dofilepath("data:scripts/modkit/table_util.lua");
	end

	-- generated by `modkit-tools/ship-types.js`
	modkit.ship_types = {
		[0] = 'ben_bentusiexchange',
		[1] = 'ben_bentusiexchange_hold00',
		[2] = 'ben_bentusiexchange_hold01',
		[3] = 'ben_bentusiexchange_hold02',
		[4] = 'ben_bentusiexchange_hold03',
		[5] = 'ben_bentusiexchange_hold04',
		[6] = 'ben_bentusiexchange_hold05',
		[7] = 'ben_cargobarge',
		[8] = 'der_carrier',
		[9] = 'der_carriernew',
		[10] = 'der_crate',
		[11] = 'der_dddfrigate',
		[12] = 'der_dddfrigatenew',
		[13] = 'der_fragmentpanel0a',
		[14] = 'der_fragmentpanel0b',
		[15] = 'der_fragmentpanel0c',
		[16] = 'der_fragmentpanel1',
		[17] = 'der_fragmentpanel2',
		[18] = 'der_fragmentpanel3',
		[19] = 'der_fragmentpanel3_hw2',
		[20] = 'der_fragmentstrut',
		[21] = 'der_ghostship',
		[22] = 'der_heavycorvette',
		[23] = 'der_heavycruiser',
		[24] = 'der_junk0_antenna',
		[25] = 'der_junk0_antenna_hw2',
		[26] = 'der_junk0_fin1',
		[27] = 'der_junk0_fin1_hw2',
		[28] = 'der_junk0_fin2',
		[29] = 'der_junk0_fin2_hw2',
		[30] = 'der_junk0_gunammo',
		[31] = 'der_junk0_panel',
		[32] = 'der_junk0_panel_hw2',
		[33] = 'der_junk0_sensors',
		[34] = 'der_junk0_sensors_hw2',
		[35] = 'der_junk1_parta',
		[36] = 'der_junk1_parta_hw2',
		[37] = 'der_junk1_partb',
		[38] = 'der_junk1_partb_hw2',
		[39] = 'der_junk1_shell',
		[40] = 'der_junk1_shell_hw2',
		[41] = 'der_junk1_strut',
		[42] = 'der_junk1_strut_hw2',
		[43] = 'der_junk2_panela',
		[44] = 'der_junk2_panela_hw2',
		[45] = 'der_junk2_panelb',
		[46] = 'der_junk2_panelb_hw2',
		[47] = 'der_junk2_panelc',
		[48] = 'der_junk2_panelc_hw2',
		[49] = 'der_junk2_paneld',
		[50] = 'der_junk2_paneld_hw2',
		[51] = 'der_junk2_shipwreck',
		[52] = 'der_junk3_boiler',
		[53] = 'der_junk3_boilercasing',
		[54] = 'der_lifeboat',
		[55] = 'der_lightcorvette',
		[56] = 'der_lightcorvettenew',
		[57] = 'der_minelayercorvette',
		[58] = 'der_multiguncorvette',
		[59] = 'der_multiguncorvettenew',
		[60] = 'der_prisonshipnew',
		[61] = 'der_prisonshipold',
		[62] = 'der_repaircorvette',
		[63] = 'der_scaffold',
		[64] = 'der_scaffoldfingera_scarred',
		[65] = 'der_scaffoldfingerb_scarred',
		[66] = 'der_scaffold_scarred',
		[67] = 'der_shipwreck',
		[68] = 'der_supportfrigate',
		[69] = 'der_supportfrigatenew',
		[70] = 'hgn_assaultcorvette',
		[71] = 'hgn_assaultcorvetteelite',
		[72] = 'hgn_assaultfrigate',
		[73] = 'hgn_attackbomber',
		[74] = 'hgn_attackbomberelite',
		[75] = 'hgn_battlecruiser',
		[76] = 'hgn_carrier',
		[77] = 'hgn_defensefieldfrigate',
		[78] = 'hgn_destroyer',
		[79] = 'hgn_dreadnaught',
		[80] = 'hgn_drone_frigate',
		[81] = 'hgn_drone_frigate_2',
		[82] = 'hgn_drone_frigate_3',
		[83] = 'hgn_ecmprobe',
		[84] = 'hgn_gunturret',
		[85] = 'hgn_hscore',
		[86] = 'hgn_interceptor',
		[87] = 'hgn_ioncannonfrigate',
		[88] = 'hgn_ionturret',
		[89] = 'hgn_marinefrigate',
		[90] = 'hgn_marinefrigate_soban',
		[91] = 'hgn_minelayercorvette',
		[92] = 'hgn_mothership',
		[93] = 'hgn_probe',
		[94] = 'hgn_proximitysensor',
		[95] = 'hgn_pulsarcorvette',
		[96] = 'hgn_resourcecollector',
		[97] = 'hgn_resourcecontroller',
		[98] = 'hgn_scout',
		[99] = 'hgn_shipyard',
		[100] = 'hgn_shipyard_elohim',
		[101] = 'hgn_shipyard_spg',
		[102] = 'hgn_targetdrone',
		[103] = 'hgn_torpedofrigate',
		[104] = 'junk_autogunl',
		[105] = 'junk_autoguns',
		[106] = 'junk_hyperspacegate',
		[107] = 'junk_junkyarddog',
		[108] = 'junk_junkyardoffice',
		[109] = 'kad_advancedswarmer',
		[110] = 'kad_fuelpod',
		[111] = 'kad_multibeamfrigate',
		[112] = 'kad_p2mothership',
		[113] = 'kad_swarmer',
		[114] = 'kpr_attackdroid',
		[115] = 'kpr_destroyer',
		[116] = 'kpr_destroyerm10',
		[117] = 'kpr_mover',
		[118] = 'kpr_mover_capture',
		[119] = 'kpr_mover_salvage',
		[120] = 'kpr_sajuuk',
		[121] = 'kpr_sajuuk_nosensors',
		[122] = 'kus_ambassador',
		[123] = 'kus_assaultfrigate',
		[124] = 'kus_attackbomber',
		[125] = 'kus_carrier',
		[126] = 'kus_cloakedfighter',
		[127] = 'kus_cloakgenerator',
		[128] = 'kus_cryotray',
		[129] = 'kus_cryotray_m03',
		[130] = 'kus_defender',
		[131] = 'kus_destroyer',
		[132] = 'kus_drone0',
		[133] = 'kus_drone1',
		[134] = 'kus_drone10',
		[135] = 'kus_drone11',
		[136] = 'kus_drone12',
		[137] = 'kus_drone13',
		[138] = 'kus_drone2',
		[139] = 'kus_drone3',
		[140] = 'kus_drone4',
		[141] = 'kus_drone5',
		[142] = 'kus_drone6',
		[143] = 'kus_drone7',
		[144] = 'kus_drone8',
		[145] = 'kus_drone9',
		[146] = 'kus_dronefrigate',
		[147] = 'kus_gravwellgenerator',
		[148] = 'kus_headshotasteroid',
		[149] = 'kus_heavycorvette',
		[150] = 'kus_heavycruiser',
		[151] = 'kus_interceptor',
		[152] = 'kus_ioncannonfrigate',
		[153] = 'kus_lightcorvette',
		[154] = 'kus_minelayercorvette',
		[155] = 'kus_missiledestroyer',
		[156] = 'kus_mothership',
		[157] = 'kus_multiguncorvette',
		[158] = 'kus_probe',
		[159] = 'kus_proximitysensor',
		[160] = 'kus_repaircorvette',
		[161] = 'kus_researchship',
		[162] = 'kus_researchship_1',
		[163] = 'kus_researchship_2',
		[164] = 'kus_researchship_3',
		[165] = 'kus_researchship_4',
		[166] = 'kus_researchship_5',
		[167] = 'kus_resourcecollector',
		[168] = 'kus_resourcecontroller',
		[169] = 'kus_salvagecorvette',
		[170] = 'kus_scout',
		[171] = 'kus_sensorarray',
		[172] = 'kus_supportfrigate',
		[173] = 'kus_targetdrone',
		[174] = 'meg_asteroid',
		[175] = 'meg_asteroidmp',
		[176] = 'meg_asteroid_nosubs',
		[177] = 'meg_balcoragate',
		[178] = 'meg_bentus',
		[179] = 'meg_bentus_ruined',
		[180] = 'meg_bentus_ruins_core_1',
		[181] = 'meg_bentus_ruins_core_2',
		[182] = 'meg_bentus_ruin_1',
		[183] = 'meg_bentus_ruins_core_3',
		[184] = 'meg_bentus_ruin_10',
		[185] = 'meg_bentus_ruin_11',
		[186] = 'meg_bentus_ruin_2',
		[187] = 'meg_bentus_ruin_3',
		[188] = 'meg_bentus_ruin_4',
		[189] = 'meg_bentus_ruin_5',
		[190] = 'meg_bentus_ruin_6',
		[191] = 'meg_bentus_ruin_7',
		[192] = 'meg_bentus_ruin_8',
		[193] = 'meg_bentus_ruin_9',
		[194] = 'meg_bigred',
		[195] = 'meg_chimera',
		[196] = 'meg_crate_hw1container',
		[197] = 'meg_crate_hw2container',
		[198] = 'meg_dreadnaughtberth',
		[199] = 'meg_foundry',
		[200] = 'meg_foundrydebris_chunk1',
		[201] = 'meg_foundrydebris_chunk2',
		[202] = 'meg_foundrydebris_chunk3',
		[203] = 'meg_foundrydebris_chunk4',
		[204] = 'meg_foundrydebris_flake1',
		[205] = 'meg_foundrydebris_flake2',
		[206] = 'meg_foundrydebris_flake3',
		[207] = 'meg_foundrydebris_flake4',
		[208] = 'meg_gehenna_1',
		[209] = 'meg_gehenna_2',
		[210] = 'meg_gehenna_3',
		[211] = 'meg_gehenna_4',
		[212] = 'meg_gehenna_5',
		[213] = 'meg_gehenna_6',
		[214] = 'meg_gehenna_7',
		[215] = 'meg_misslefrigate',
		[216] = 'meg_progenitorpowermodule',
		[217] = 'meg_progenitorpowertrigger',
		[218] = 'meg_progenitorpowertrigger_noui',
		[219] = 'meg_relic_rugenerator',
		[220] = 'meg_sajhulknose',
		[221] = 'meg_sajhulknose_ui',
		[222] = 'meg_sajhulkpanels',
		[223] = 'meg_sajhulkpanels_ui',
		[224] = 'meg_sajhulkturret',
		[225] = 'meg_salvagecollector',
		[226] = 'meg_tanis',
		[227] = 'meg_tanisstructure_medium',
		[228] = 'meg_tanisstructure_medium2',
		[229] = 'meg_veildebris_bit1',
		[230] = 'meg_veildebris_bit10',
		[231] = 'meg_veildebris_bit11',
		[232] = 'meg_veildebris_bit12',
		[233] = 'meg_veildebris_bit13',
		[234] = 'meg_veildebris_bit14',
		[235] = 'meg_veildebris_bit15',
		[236] = 'meg_veildebris_bit2',
		[237] = 'meg_veildebris_bit3',
		[238] = 'meg_veildebris_bit4',
		[239] = 'meg_veildebris_bit5',
		[240] = 'meg_veildebris_bit6',
		[241] = 'meg_veildebris_bit7',
		[242] = 'meg_veildebris_bit8',
		[243] = 'meg_veildebris_bit9',
		[244] = 'meg_veildebris_chunk1',
		[245] = 'meg_veildebris_chunk1_nd',
		[246] = 'meg_veildebris_chunk2',
		[247] = 'meg_veildebris_chunk2_nd',
		[248] = 'meg_veildebris_chunk3',
		[249] = 'meg_veildebris_chunk3_nd',
		[250] = 'meg_veildebris_chunk4',
		[251] = 'meg_veildebris_chunk4_nd',
		[252] = 'meg_veildebris_chunk5',
		[253] = 'meg_veildebris_chunk5_nd',
		[254] = 'meg_veildebris_chunk_lighthouse',
		[255] = 'meg_veildebris_flake1',
		[256] = 'meg_veildebris_flake10',
		[257] = 'meg_veildebris_flake2',
		[258] = 'meg_veildebris_flake3',
		[259] = 'meg_veildebris_flake4',
		[260] = 'meg_veildebris_flake5',
		[261] = 'meg_veildebris_flake6',
		[262] = 'meg_veildebris_flake7',
		[263] = 'meg_veildebris_flake8',
		[264] = 'meg_veildebris_flake9',
		[265] = 'misc_t-matmegaship',
		[266] = 'misc_t-matmegaship_hold',
		[267] = 'modkit_scheduler',
		[268] = 'neu_soundtest',
		[269] = 'neu_transport',
		[270] = 'nis_galaxymap',
		[271] = 'special_eventsimulator',
		[272] = 'special_splitter',
		[273] = 'special_unittestmap',
		[274] = 'sp_tanker',
		[275] = 'sp_tanker2',
		[276] = 'sp_tanker3',
		[277] = 'sp_tanker4',
		[278] = 'sp_tanker5',
		[279] = 'sp_tanker6',
		[280] = 'tai_assaultfrigate',
		[281] = 'tai_attackbomber',
		[282] = 'tai_carrier',
		[283] = 'tai_cloakgenerator',
		[284] = 'tai_defender',
		[285] = 'tai_defensefighter',
		[286] = 'tai_destroyer',
		[287] = 'tai_fieldfrigate',
		[288] = 'tai_fieldgenerator',
		[289] = 'tai_fieldgeneratordummy',
		[290] = 'tai_fieldgeneratorsegment1',
		[291] = 'tai_fieldgeneratorsegment2',
		[292] = 'tai_fieldgeneratorsegment3',
		[293] = 'tai_fieldgeneratorsegment4',
		[294] = 'tai_fieldgeneratorsegment5',
		[295] = 'tai_fieldgeneratorsegment6',
		[296] = 'tai_fieldgeneratorsegment7',
		[297] = 'tai_fieldgeneratorsegment8',
		[298] = 'tai_gravwellgenerator',
		[299] = 'tai_headshotasteroid',
		[300] = 'tai_heavycorvette',
		[301] = 'tai_heavycruiser',
		[302] = 'tai_interceptor',
		[303] = 'tai_ioncannonfrigate',
		[304] = 'tai_lightcorvette',
		[305] = 'tai_minelayercorvette',
		[306] = 'tai_missiledestroyer',
		[307] = 'tai_mothership',
		[308] = 'tai_multiguncorvette',
		[309] = 'tai_probe',
		[310] = 'tai_proximitysensor',
		[311] = 'tai_repaircorvette',
		[312] = 'tai_researchship',
		[313] = 'tai_researchship_1',
		[314] = 'tai_researchship_2',
		[315] = 'tai_researchship_3',
		[316] = 'tai_researchship_4',
		[317] = 'tai_researchship_5',
		[318] = 'tai_researchstation',
		[319] = 'tai_resourcecollector',
		[320] = 'tai_resourcecontroller',
		[321] = 'tai_salvagecorvette',
		[322] = 'tai_scout',
		[323] = 'tai_sensorarray',
		[324] = 'tai_supportfrigate',
		[325] = 'tai_targetdrone',
		[326] = 'test_mesh',
		[327] = 'tes_twosidetest',
		[328] = 'tur_fighter',
		[329] = 'tur_ionarrayfrigate',
		[330] = 'tur_missilecorvette',
		[331] = 'tur_p1mothership',
		[332] = 'tur_standardcorvette',
		[333] = 'vgr_assaultfrigate',
		[334] = 'vgr_battlecruiser',
		[335] = 'vgr_bomber',
		[336] = 'vgr_carrier',
		[337] = 'vgr_commandcorvette',
		[338] = 'vgr_commstation',
		[339] = 'vgr_destroyer',
		[340] = 'vgr_heavymissilefrigate',
		[341] = 'vgr_hyperspace_platform',
		[342] = 'vgr_infiltratorfrigate',
		[343] = 'vgr_interceptor',
		[344] = 'vgr_lancefighter',
		[345] = 'vgr_lasercorvette',
		[346] = 'vgr_minelayercorvette',
		[347] = 'vgr_missilecorvette',
		[348] = 'vgr_mothership',
		[349] = 'vgr_mothership_makaan',
		[350] = 'vgr_planetkiller',
		[351] = 'vgr_planetkillermissile',
		[352] = 'vgr_prisonstation',
		[353] = 'vgr_probe',
		[354] = 'vgr_probe_ecm',
		[355] = 'vgr_probe_prox',
		[356] = 'vgr_resourcecollector',
		[357] = 'vgr_resourcecontroller',
		[358] = 'vgr_scout',
		[359] = 'vgr_shipyard',
		[360] = 'vgr_weaponplatform_gun',
		[361] = 'vgr_weaponplatform_missile',
	};

	MK_SHIP_TYPES = 1;
end
