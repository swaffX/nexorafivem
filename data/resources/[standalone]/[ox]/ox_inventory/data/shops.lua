return {
	Megamall = {
		name = 'Megamall',
		blip = {
			id = 408, colour = 67, scale = 0.7
		}, inventory = {
			{ name = 'radio', price = 10 },
			{ name = 'acetone', price = 10 },
			{ name = 'lithium', price = 10 },
			{ name = 'lockpick', price = 10 },
			{ name = 'advancedlockpick', price = 10 },
			{ name = 'repairkit', price = 10 },
			{ name = 'advancedrepairkit', price = 10 },
			{ name = 'clothing_bag', price = 10 },

		}, locations = {
			vec3(46.64, -1749.55, 29.63),
		}, targets = {
		{ loc = vec3(25.06, -1347.32, 29.5),  length = 0.7, width = 0.5, heading = 0.0, minZ = 29.5, maxZ = 29.9, distance = 1.5 },
		}
	},
	--Telefoncu = {
		--name = 'Telefoncu',
		--blip = {
			--id = 817, colour = 37, scale = 0.6
		--}, inventory = {
			--{ name = 'phone', price = 5000 },
			--{ name = 'radio', price = 10000 },

		--}, locations = {
			--vector3(149.5710144043, -233.02137756348, 54.423999786377),
		--}, targets = {
		--{ loc = vector3(149.5710144043, -233.02137756348, 54.423999786377),  length = 0.7, width = 0.5, heading = 0.0, minZ = 29.5, maxZ = 29.9, distance = 1.5 },
		--}
	--},

	-- Liquor = {
	-- 	name = 'Liquor Store',
	-- 	 inventory = {
	-- 		{ name = 'water', price = 10 },
			
	-- 		{ name = 'burger', price = 15 },
	-- 	}, locations = {
	-- 		-- vec3(1135.808, -982.281, 46.415),
	-- 		-- vec3(-1222.915, -906.983, 12.326),
	-- 		-- vec3(-1487.553, -379.107, 40.163),
	-- 		-- vec3(-2968.243, 390.910, 15.043),
	-- 		-- vec3(1166.024, 2708.930, 38.157),
	-- 		-- vec3(1392.562, 3604.684, 34.980),
	-- 		-- vec3(-1393.409, -606.624, 30.319)
	-- 	}, targets = {
	-- 		{ loc = vec3(1134.9, -982.34, 46.41), length = 0.5, width = 0.5, heading = 96.0, minZ = 46.4, maxZ = 46.8, distance = 1.5 },
	-- 		{ loc = vec3(-1222.33, -907.82, 12.43), length = 0.6, width = 0.5, heading = 32.7, minZ = 12.3, maxZ = 12.7, distance = 1.5 },
	-- 		{ loc = vec3(-1486.67, -378.46, 40.26), length = 0.6, width = 0.5, heading = 133.77, minZ = 40.1, maxZ = 40.5, distance = 1.5 },
	-- 		{ loc = vec3(-2967.0, 390.9, 15.14), length = 0.7, width = 0.5, heading = 85.23, minZ = 15.0, maxZ = 15.4, distance = 1.5 },
	-- 		{ loc = vec3(1165.95, 2710.20, 38.26), length = 0.6, width = 0.5, heading = 178.84, minZ = 38.1, maxZ = 38.5, distance = 1.5 },
	-- 		{ loc = vec3(1393.0, 3605.95, 35.11), length = 0.6, width = 0.6, heading = 200.0, minZ = 35.0, maxZ = 35.4, distance = 1.5 }
	-- 	}
	-- },
------------------------------------------------------------SİLAHÇI---------------------------------------------------------------------------------------------------
	Ammunation1 = {
		name = 'Ammunation1',
		groups = {
			['ammunation1'] = 0
		}, inventory = {
			{ name = 'weapon_golfclub', price = 1 },
			{ name = 'WEAPON_BAT', price = 1 },
			{ name = 'weapon_crowbar', price = 1 },
			{ name = 'weapon_knuckle', price = 1 },
			{ name = 'weapon_battleaxe', price = 1 },
			{ name = 'weapon_switchblade', price = 1 },
            { name = 'weapon_machete', price = 1 },
			{ name = 'WEAPON_KNIFE', price = 200 },
			{ name = 'WEAPON_PISTOL', price = 1000 },
			{ name = 'ammo-9', price = 5, },	
		}, locations = {
			vector3(19.152614593506, -1107.3684082031, 29.797212600708),
		}, targets = {
			 { loc = vector3(19.152614593506, -1107.3684082031, 29.797212600708), length = 0.6, width = 0.5, heading = 180.0, minZ = 21.8, maxZ = 22.2, distance = 2.0 },
		}
	},

	Ammunation2 = {
		name = 'Ammunation2',
		groups = {
			['ammunation2'] = 0
		}, inventory = {
			{ name = 'weapon_golfclub', price = 1 },
			{ name = 'WEAPON_BAT', price = 1 },
			{ name = 'weapon_crowbar', price = 1 },
			{ name = 'weapon_knuckle', price = 1 },
			{ name = 'weapon_battleaxe', price = 1 },
			{ name = 'weapon_switchblade', price = 1 },
            { name = 'weapon_machete', price = 1 },
			{ name = 'WEAPON_KNIFE', price = 200 },
			{ name = 'WEAPON_PISTOL', price = 1000 },
			{ name = 'ammo-9', price = 5, },	
		}, locations = {
			vector3(247.25917053223, -52.883670806885, 69.941276550293),
		}, targets = {
			 { loc = vector3(247.25917053223, -52.883670806885, 69.941276550293), length = 0.6, width = 0.5, heading = 360.0, minZ = 29.6, maxZ = 30.0, distance = 2.0 },
		}
	},

	Ammunation3 = {
		name = 'Ammunation3',
		groups = {
			['ammunation3'] = 0
		}, inventory = {
			{ name = 'weapon_golfclub', price = 1 },
			{ name = 'WEAPON_BAT', price = 1 },
			{ name = 'weapon_crowbar', price = 1 },
			{ name = 'weapon_knuckle', price = 1 },
			{ name = 'weapon_battleaxe', price = 1 },
			{ name = 'weapon_switchblade', price = 1 },
            { name = 'weapon_machete', price = 1 },
			{ name = 'WEAPON_KNIFE', price = 200 },
			{ name = 'WEAPON_PISTOL', price = 1000 },
			{ name = 'ammo-9', price = 5, },	
		}, locations = {
			vector3(839.93853759766, -1029.3015136719, 28.194850921631),
		}, targets = {
			 { loc = vector3(839.93853759766, -1029.3015136719, 28.194850921631), length = 0.6, width = 0.5, heading = 227.39, minZ = 34.7, maxZ = 35.1, distance = 2.0 },
		}
	},

	Ammunation4 = {
		name = 'Ammunation4',
		groups = {
			['ammunation4'] = 0
		}, inventory = {
			{ name = 'weapon_golfclub', price = 1 },
			{ name = 'WEAPON_BAT', price = 1 },
			{ name = 'weapon_crowbar', price = 1 },
			{ name = 'weapon_knuckle', price = 1 },
			{ name = 'weapon_battleaxe', price = 1 },
			{ name = 'weapon_switchblade', price = 1 },
            { name = 'weapon_machete', price = 1 },
			{ name = 'WEAPON_KNIFE', price = 200 },
			{ name = 'WEAPON_PISTOL', price = 1000 },
			{ name = 'ammo-9', price = 5, },	
		}, locations = {
			vector3(-1310.6007080078, -395.54364013672, 36.69580078125),
		}, targets = {
			 { loc = vector3(-1310.6007080078, -395.54364013672, 36.69580078125), length = 0.6, width = 0.5, heading = 225.0, minZ = 31.4, maxZ = 31.8, distance = 2.0 },
		}
	},
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	PoliceArmoury = {
		name = 'Mühimmat Deposu',
		groups = shared.police,
		blip = {
			id = 110, colour = 84, scale = 0.5
		}, inventory = {
			{ name = 'WEAPON_GLOCK', price = 1, metadata = { registered = true, serial = 'police' }, grade = 1 },
			{ name = 'weapon_stungun', price = 1, metadata = { registered = true, serial = 'police'} },
			{ name = 'pistol_ammo2', price = 0, },
			{ name = 'weapon_nightstick', price = 1 },
			{ name = 'weapon_flashlight', price = 1, },
			{ name = 'radio', price = 1, },
			{ name = 'gps', price = 1, },
			{ name = 'pkelepce', price = 1, },
			{ name = 'pkelepceanahtar', price = 1, },
			{ name = 'armor', price = 1, },
			{ name = 'parachute', price = 100, },
			{ name = 'diving_gear', price = 50, },
			{ name = 'diving_fill', price = 10, },
			{ name = 'drone_flyer_7', price = 100 },
			{ name = 'medikit', price = 1 },
			{ name = 'bandage', price = 1 },
			{ name = 'advancedrepairkit', price = 1 },
			{ name = 'enerji_icecegi', price = 1 },
			{ name = 'water_bottle', price = 1 },
			{ name = 'bodycam', price = 1 },
			{ name = 'aspirin', price = 1 },
			{ name = 'megaphone', price = 1 },
			{ name = 'firstaid', price = 100 },
			{ name = 'phone', price = 50 },
			{ name = 'ammo-laser', price = 1 },
			{ name = 'WEAPON_BEANBAGSHOTGUN', price = 1000, metadata = { registered = true, serial = 'police' }, grade = 7 },
			{ name = 'ammo-smglrg', price = 1 },
			{ name = 'weapon_combatpdw', price = 1000, metadata = { registered = true, serial = 'police' }, grade = 7 },
			{ name = 'ammo-shotgunlrg', price = 1 },
			{ name = 'weapon_pumpshotgun_mk2', price = 500, metadata = { registered = true, serial = 'police' }, grade = 8 },
			{ name = 'ammo-rifle', price = 1 },
			{ name = 'weapon_specialcarbine_mk2', price = 1000, metadata = { registered = true, serial = 'police' }, grade = 8 },
		}, locations = {
			vec3(482.55145263672, -995.16821289062, 30.689649581909),
			
		}, targets = {
			{ loc = vec3(605.43, 1.59, 87.81), length = 1.0, width = 4.0, heading = 161.0, minZ = 86.5, maxZ = 90.0, distance = 1.5 },  -- WİNEWOOD POLİCE 
			{ loc = vec3(387.07, 799.8, 190.49), length = 1.0, width = 1.0, heading = 161.0, minZ = 189.5, maxZ = 191.0, distance = 1.5 },  -- PARK RANGER
			{ loc = vec3(-449.52, 6015.15, 36.99), length = 1.0, width = 1.0, heading = 161.0, minZ = 36.99-1, maxZ = 36.99+1, distance = 1.5 }, -- PALETO SHERİFF                                                            
			{ loc = vec3(1550.68, 842.06, 77.65), length = 1.0, width = 1.0, heading = 161.0, minZ = 77.65-1, maxZ = 77.65+1, distance = 1.5 },  -- highwaypatrol 
			{ loc = vec3(453.38,-979.96,29.95), length = 1.0, width = 1.0, heading = 161.0, minZ = 29.95-1, maxZ = 29.95+1, distance = 1.5 },   -- BASİC MRPD
			{ loc = vec3(364.62,-1599.35,25.19), length = 1.0, width = 1.0, heading = 161.0, minZ = 25.19-1, maxZ = 25.19+1, distance = 1.5 }   -- SOUTHSİDE SHERİFF
		}
	},

	Medicine = {
		name = 'EMS Marketi',
		groups = {
			['ambulance'] = 0
		}, inventory = {
			{ name = 'weapon_flashlight', price = 5 },
			{ name = 'weapon_stungun', price = 5 },
			{ name = 'bandage', price = 5 },
			{ name = 'radio', price = 5 },
			{ name = 'medikit', price = 5 },
			{ name = 'painkillers', price = 5 },
			{ name = 'gps', price = 5 },
			{ name = 'diving_fill', price = 5 },
			{ name = 'diving_gear', price = 5 },
			{ name = 'parachute', price = 5 },
			{ name = 'kitap', price = 5 },
		}, locations = {
			vec3(-820.41790771484, -1242.7447509766, 7.3374271392822)
		}, targets = {
			{ loc = vec3(-820.41790771484, -1242.7447509766, 7.3374271392822), length = 2.0, width = 4.0, heading = 142.077392578125, minZ = 7.3374271392822-1, maxZ = 7.3374271392822+1, distance = 1.5 }
		}
	},


	 LSSDMarket = {
	 	name = 'LSSD Mühimmat Deposu',
	 	groups = {
	 		['sheriff2'] = 0,
	 		['sheriff'] = 0,
	 		['state'] = 0,
	 		['police'] = 0,
	 		['marshall'] = 0
	 	},
			 
	 		inventory = {
	 		{ name = 'pistol_ammo2', price = 0, },
	 		{ name = 'WEAPON_FLASHLIGHT', price = 0 },
	 		{ name = 'WEAPON_NIGHTSTICK', price = 0 },
	 		{ name = 'handcuffs', price = 0 },
	 		{ name = 'pkelepceanahtar', price = 0 },
	 		{ name = 'radio', price = 0 },
	 		{ name = 'heavyarmor2', price = 0 },
	 		{ name = 'parachute', price = 0 },
	        { name = 'bodycam', price = 0 },
	 		{ name = 'bandage', price = 0 },
	 		{ name = 'pdkit', price = 0 },
	 		{ name = 'gps', price = 0 },
	 		{ name = 'WEAPON_GLOCK', price = 0, metadata = { registered = true, serial = 'sheriff' } },
	 		{ name = 'WEAPON_STUNGUN', price = 0, metadata = { registered = true, serial = 'sheriff'} }
	 	}, locations = {
			vector3(-428.36364746094, 5994.91796875, 31.71654510498)
	 	}, targets = {
	 		{ loc = vector3(-428.36364746094, 5994.91796875, 31.71654510498), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
	 	}
     },

	 SASPMarket = {
		name = 'SASP Mühimmat Deposu',
		groups = {
			['sheriff2'] = 0,
			['sheriff'] = 0,
			['sasp'] = 0,
			['police'] = 0,
			['marshall'] = 0
		},
			
			inventory = {
			{ name = 'pistol_ammo2', price = 0, },
			{ name = 'WEAPON_FLASHLIGHT', price = 0 },
			{ name = 'WEAPON_NIGHTSTICK', price = 0 },
			{ name = 'handcuffs', price = 0 },
			{ name = 'pkelepceanahtar', price = 0 },
			{ name = 'radio', price = 0 },
			{ name = 'heavyarmor2', price = 0 },
			{ name = 'parachute', price = 0 },
		   { name = 'bodycam', price = 0 },
			{ name = 'bandage', price = 0 },
			{ name = 'pdkit', price = 0 },
			{ name = 'gps', price = 0 },
			{ name = 'WEAPON_GLOCK', price = 0, metadata = { registered = true, serial = 'sasp' } },
			{ name = 'WEAPON_STUNGUN', price = 0, metadata = { registered = true, serial = 'sasp'} }
		}, locations = {
			vector3(1550.6813964844, 842.04577636719, 77.655906677246)
		}, targets = {
			{ loc = vector3(1550.6813964844, 842.04577636719, 77.655906677246), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
		}
	},

	-- BCSO = {
	-- 	name = 'BCSO Marketi',
	-- 	groups = {
	-- 		['sheriff2'] = 0,
	-- 		['sheriff'] = 0,
	-- 		['state'] = 0,
	-- 		['police'] = 0,
	-- 		['marshall'] = 0
	-- 	},
			 
	-- 		inventory = {
	-- 		{ name = 'pistol_ammo2', price = 0, },
	-- 		{ name = 'WEAPON_FLASHLIGHT', price = 0 },
	-- 		{ name = 'WEAPON_NIGHTSTICK', price = 0 },
	-- 		{ name = 'handcuffs', price = 0 },
	-- 		{ name = 'pkelepceanahtar', price = 0 },
	-- 		{ name = 'radio', price = 0 },
	-- 		{ name = 'heavyarmor2', price = 0 },
	-- 		{ name = 'parachute', price = 0 },
	-- 		{ name = 'bodycam', price = 0 },
	-- 		{ name = 'bandage', price = 0 },
	-- 		{ name = 'pdkit', price = 0 },
	-- 		{ name = 'gps', price = 0 },
	-- 		{ name = 'WEAPON_GLOCK', price = 0, metadata = { registered = true, serial = 'POL' } },
	-- 		{ name = 'WEAPON_STUNGUN', price = 0, metadata = { registered = true, serial = 'POL'} }
	-- 	}, locations = {
	-- 		vec3(1862.1, 3691.33, 34.22),
	-- 		vec3(-449.43, 6015.25, 37.0)
	-- 	}, targets = {
	-- 		{ loc = vec3(484.21, -994.75, 30.73), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
	-- 	}
	-- },

	illegalmechanic = {
		name = 'İllegalMechanic',
		groups = {
			['illegalmechanic'] = 0
		}, inventory = {
			{ name = 'stancerkit', price = 1, },
			{ name = 'chameleonpaint_161', price = 1, },
			{ name = 'chameleonpaint_162', price = 1 },
			{ name = 'chameleonpaint_163', price = 1 },
			{ name = 'chameleonpaint_164', price = 1 },
			{ name = 'chameleonpaint_165', price = 1 },
			{ name = 'chameleonpaint_166', price = 1 },
			{ name = 'chameleonpaint_167', price = 1 },
			{ name = 'chameleonpaint_168', price = 1 },
			{ name = 'chameleonpaint_169', price = 1 },
			{ name = 'chameleonpaint_170', price = 1 },
			{ name = 'chameleonpaint_171', price = 1 },
			{ name = 'chameleonpaint_172', price = 1 },
			{ name = 'chameleonpaint_173', price = 1 },
			{ name = 'chameleonpaint_174', price = 1 },
			{ name = 'chameleonpaint_175', price = 1 },
			{ name = 'chameleonpaint_176', price = 1 },


		}, locations = {
			vec3(-1603.12, -838.99, 10.27)
		}, targets = {
			{ loc = vec3(484.21, -994.75, 30.73), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
		}
	},

	Lojistik = {
		name = 'Lojistik',
		groups = {
			['lojistik'] = 0
		}, inventory = {
			-- { name = 'g195', price = 446500, },
			-- { name = 'g17a10', price = 630000, },
			-- { name = 'dp910', price = 370000 },
			{ name = 'p22610', price = 550000 },
			{ name = 'poolcue10', price = 20000 },
			{ name = 'wrench10', price = 20000 },
			{ name = 'switchblade10', price = 5000000 },
			{ name = 'machete10', price = 80000 },
			{ name = 'knife10', price = 80000 },
			{ name = 'knuckle10', price = 80000 },
			{ name = 'mermi30', price = 24000 },
			{ name = 'zirh30', price = 36000 },
			{ name = 'susturucu10', price = 1700000 },


		}, locations = {
			vec3(-414.06, -2799.94, 6.0)
		}, targets = {
			{ loc = vec3(484.21, -994.75, 30.73), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
		}
	},

	illegal_mechanic2 = {
		name = 'illegal_mechanic2',
		groups = {
			['illegal_mechanic2'] = 0
		}, inventory = {
			{ name = 'stancerkit', price = 1, },
			{ name = 'chameleonpaint_161', price = 1, },
			{ name = 'chameleonpaint_162', price = 1 },
			{ name = 'chameleonpaint_163', price = 1 },
			{ name = 'chameleonpaint_164', price = 1 },
			{ name = 'chameleonpaint_165', price = 1 },
			{ name = 'chameleonpaint_166', price = 1 },
			{ name = 'chameleonpaint_167', price = 1 },
			{ name = 'chameleonpaint_168', price = 1 },
			{ name = 'chameleonpaint_169', price = 1 },
			{ name = 'chameleonpaint_170', price = 1 },
			{ name = 'chameleonpaint_171', price = 1 },
			{ name = 'chameleonpaint_172', price = 1 },
			{ name = 'chameleonpaint_173', price = 1 },
			{ name = 'chameleonpaint_174', price = 1 },
			{ name = 'chameleonpaint_175', price = 1 },
			{ name = 'chameleonpaint_176', price = 1 },


		}, locations = {
			vec3(540.58, -204.94, 54.26)
		}, targets = {
			{ loc = vec3(484.21, -994.75, 30.73), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
		}
	},

	illegal_mechanic3 = {
		name = 'illegal_mechanic3',
		groups = {
			['illegal_mechanic3'] = 0
		}, inventory = {
			{ name = 'stancerkit', price = 1, },
			{ name = 'chameleonpaint_161', price = 1, },
			{ name = 'chameleonpaint_162', price = 1 },
			{ name = 'chameleonpaint_163', price = 1 },
			{ name = 'chameleonpaint_164', price = 1 },
			{ name = 'chameleonpaint_165', price = 1 },
			{ name = 'chameleonpaint_166', price = 1 },
			{ name = 'chameleonpaint_167', price = 1 },
			{ name = 'chameleonpaint_168', price = 1 },
			{ name = 'chameleonpaint_169', price = 1 },
			{ name = 'chameleonpaint_170', price = 1 },
			{ name = 'chameleonpaint_171', price = 1 },
			{ name = 'chameleonpaint_172', price = 1 },
			{ name = 'chameleonpaint_173', price = 1 },
			{ name = 'chameleonpaint_174', price = 1 },
			{ name = 'chameleonpaint_175', price = 1 },
			{ name = 'chameleonpaint_176', price = 1 },


		}, locations = {
			vec3(941.37, -934.28, 42.95)
		}, targets = {
			{ loc = vec3(484.21, -994.75, 30.73), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
		}
	},



	iskelebar = {
		name = 'İskele Bar',
		groups = {
			['iskelebar'] = 0
		}, inventory = {
			{ name = 'belinikokteyl', price = 1, },
			{ name = 'cintonik', price = 1, },
			{ name = 'dondurma', price = 1 },
			{ name = 'kahve', price = 1 },
			{ name = 'loreccakokteyl', price = 1 },
			{ name = 'loriturkkahve', price = 1 },
			{ name = 'margaritakokteyl', price = 1 },
			{ name = 'martinikokteyl', price = 1 },
			{ name = 'sogukkahve', price = 1 },
			{ name = 'yesilperi', price = 1 },
			{ name = 'cay', price = 1 },
			{ name = 'cereztabagi', price = 1 },
			{ name = 'citirtavuk', price = 1 },
			{ name = 'kebap', price = 1 },
			{ name = 'lahmacun', price = 1 },
			{ name = 'lorecca', price = 1 },
			{ name = 'muffin', price = 1 },
			{ name = 'pizza', price = 1 },
			{ name = 'kurkakola', price = 1 },
			{ name = 'pizzalori', price = 1 },
			{ name = 'salatabecca', price = 1 },
			{ name = 'tiramisumus', price = 1 },
			{ name = 'water', price = 1 },
			{ name = 'tosti', price = 1 },
			{ name = 'uwububbleteamint', price = 1 },
			{ name = 'beer', price = 1 },
			{ name = 'whiskey', price = 1 },
			{ name = 'vodka', price = 1 },
			{ name = 'uwububbleteamint', price = 1 },
			{ name = 'twerks_candy', price = 1 },
			{ name = 'snikkel_candy', price = 1 },
		}, locations = {
			vector3(-1846.72, -1183.07, 13.07)
		}, targets = {
			{ loc = vec3(484.21, -994.75, 30.73), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
		}
	},

	Bahama = {
		name = 'Bahama Cafe',
		groups = {
			['bahama'] = 0
		}, inventory = {
			{ name = 'sandwich', price = 1, },
			{ name = 'tosti', price = 1, },
			{ name = 'twerks_candy', price = 1 },
			{ name = 'snikkel_candy', price = 1 },
			{ name = 'uwupancake', price = 1 },
			{ name = 'beer', price = 1 },
			{ name = 'whiskey', price = 1 },
			{ name = 'vodka', price = 1 },
			{ name = 'boombox', price = 1 },
			{ name = 'pondburrito', price = 1 },
			{ name = 'pondcileklidondurma', price = 1 },
		}, locations = {
			vec3(-1387.36, -609.31, 30.32)
		}, targets = {
			{ loc = vec3(484.21, -994.75, 30.73), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
		}
	},

	fadil = {
		name = 'Fadıl Kıraathanesi',
		groups = {
			['fadil'] = 0
		}, inventory = {
			{ name = 'sandwich', price = 1, },
			{ name = 'tosti', price = 1, },
			{ name = 'twerks_candy', price = 1 },
			{ name = 'snikkel_candy', price = 1 },
			{ name = 'uwupancake', price = 1 },
			{ name = 'beer', price = 1 },
			{ name = 'whiskey', price = 1 },
			{ name = 'vodka', price = 1 },
			{ name = 'boombox', price = 1 },
			{ name = 'pondburrito', price = 1 },
			{ name = 'pondcileklidondurma', price = 1 },
		}, locations = {
			vec3(95.49, 201.67, 108.37)
		}, targets = {
			{ loc = vec3(484.21, -994.75, 30.73), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
		}
	},

	Luxbar = {
		name = 'Luxbar Cafe',
		groups = {
			['luxbar'] = 0
		}, inventory = {
			{ name = 'sandwich', price = 1, },
			{ name = 'tosti', price = 1, },
			{ name = 'twerks_candy', price = 1 },
			{ name = 'snikkel_candy', price = 1 },
			{ name = 'uwupancake', price = 1 },
			{ name = 'beer', price = 1 },
			{ name = 'whiskey', price = 1 },
			{ name = 'vodka', price = 1 },
			{ name = 'boombox', price = 1 },
			{ name = 'pondburrito', price = 1 },
			{ name = 'pondcileklidondurma', price = 1 },
		}, locations = {
			vec3(-286.67, 235.52, 78.83)
		}, targets = {
			{ loc = vec3(484.21, -994.75, 30.73), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
		}
	},

	Teuqila = {
		name = 'Teuqila Cafe',
		groups = {
			['teuqila'] = 0
		}, inventory = {
			{ name = 'sandwich', price = 1, },
			{ name = 'tosti', price = 1, },
			{ name = 'twerks_candy', price = 1 },
			{ name = 'snikkel_candy', price = 1 },
			{ name = 'uwupancake', price = 1 },
			{ name = 'beer', price = 1 },
			{ name = 'whiskey', price = 1 },
			{ name = 'vodka', price = 1 },
			{ name = 'boombox', price = 1 },
			{ name = 'pondburrito', price = 1 },
			{ name = 'pondcileklidondurma', price = 1 },
		}, locations = {
			vec3(-562.22, 287.31, 82.18)
		}, targets = {
			{ loc = vec3(484.21, -994.75, 30.73), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
		}
	},

	

	Unicornbar = {
		name = 'Unicorn Cafe',
		groups = {
			['unicorn'] = 0
		}, inventory = {
			{ name = 'sandwich', price = 1, },
			{ name = 'tosti', price = 1, },
			{ name = 'twerks_candy', price = 1 },
			{ name = 'snikkel_candy', price = 1 },
			{ name = 'uwupancake', price = 1 },
			{ name = 'beer', price = 1 },
			{ name = 'whiskey', price = 1 },
			{ name = 'vodka', price = 1 },
			{ name = 'boombox', price = 1 },
			{ name = 'pondburrito', price = 1 },
			{ name = 'pondcileklidondurma', price = 1 },
		}, locations = {
			vec3(95.16, -1273.32, 21.11)
		}, targets = {
			{ loc = vec3(484.21, -994.75, 30.73), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
		}
	},

	UwuCafe = {
		name = 'Uwu Cafe',
		groups = {
			['kahve'] = 0
		}, inventory = {
			{ name = 'sandwich', price = 1, },
			{ name = 'tosti', price = 1, },
			{ name = 'twerks_candy', price = 0 },
			{ name = 'snikkel_candy', price = 1 },
			{ name = 'uwupancake', price = 1 },
			{ name = 'uwucupcake', price = 1 },
			{ name = 'uwuvanillasandy', price = 1 },
			{ name = 'uwubudhabowl', price = 1 },
			{ name = 'uwusushi', price = 1 },
			{ name = 'pondburrito', price = 1 },
			{ name = 'pizza', price = 1 },
			{ name = 'kurkakola', price = 1 },
			{ name = 'manti', price = 1 },
			{ name = 'pondcileklidondurma', price = 1 },
			{ name = 'pondhavuclukek', price = 1 },
			{ name = 'pondlimonlutart', price = 1 },
			{ name = 'pondmidye', price = 1 },
			{ name = 'pondnugget', price = 1 },
			{ name = 'pondpamuksefer', price = 1 },
			{ name = 'pondtavuklusebzelimakarna', price = 1 },
			{ name = 'pondtonbaliklisalata', price = 1 },
			{ name = 'miso', price = 1 },
			{ name = 'cake', price = 1 },
			{ name = 'nekocookie', price = 1 },
			{ name = 'nekodonut', price = 1 },

			--// İÇECEKLER
			{ name = 'uwububbleteablueberry', price = 1 },
			{ name = 'uwububbletearose', price = 1 },
			{ name = 'uwububbleteamint', price = 1 },
			{ name = 'uwumisosoup', price = 1 },
			{ name = 'pondcileklilimonata', price = 1 },
			{ name = 'pondsogukcay', price = 1 },
			{ name = 'pondturkkahvesi', price = 1 },
			{ name = 'pondyabanmersinisuyu', price = 1 },
			{ name = 'pondhibiskuscayi', price = 1 },
			{ name = 'bobatea', price = 1 },
			{ name = 'gbobatea', price = 1 },
			{ name = 'pbobatea', price = 1 },
			{ name = 'bbobatea', price = 1 },
			{ name = 'obobatea', price = 1 },
			{ name = 'cay', price = 1 },
			{ name = 'mocha', price = 1 },
			{ name = 'nekolatte', price = 1 },
			{ name = 'sake', price = 1 },
			{ name = 'americano', price = 1 },
			{ name = 'papatya_cay', price = 1 },
			{ name = 'bitki_cay', price = 1 },
		}, locations = {
			vec3(-588.59, -1059.69, 22.36)
		}, targets = {
			{ loc = vec3(484.21, -994.75, 30.73), length = 3.5, width = 3.0, heading = 177.0, minZ = 28.5, maxZ = 32.0, distance = 3 }
		}
	},

	Medicine = {
		name = 'Doktor Marketi',
		groups = {
			['ambulance'] = 0
		}, inventory = {
			{ name = 'firstaid', price = 0 },
			{ name = 'bandage', price = 0 },
			{ name = 'weapon_stungun', price = 0 },
			{ name = 'gps', price = 0 },
			{ name = 'radio', price = 0 },
		}, locations = {
			vec3(-819.95, -1243.02, 7.34)
		}, targets = {

		}
	},

	Blackmarket = {
		name = 'Blackmarket',
		inventory = {
			{ name = 'weapon_bats', price = 250000 },
 			{ name = 'weapon_crowbar', price = 250000 },
			{ name = 'weapon_hammer', price = 350000 },
			{ name = 'weapon_golfclub', price = 350000 },
			{ name = 'weapon_poolcue', price = 350000 },
			{ name = 'weapon_katanas', price = 500000 },
			{ name = 'weapon_knuckle', price = 500000 },
			{ name = 'weapon_battleaxe', price = 500000 }, 
			{ name = 'weapon_machete', price = 500000 }, 
			{ name = 'weapon_switchblade', price = 600000 },
			{ name = 'weapon_dagger', price = 650000 },
			{ name = 'drone_flyer_1', price = 100000 },
			{ name = 'drone_flyer_3', price = 120000 },
			{ name = 'drone_flyer_4', price = 170000 }, 
			{ name = 'drone_flyer_5', price = 200000 },
			{ name = 'drone_flyer_6', price = 250000 },
			{ name = 'lockpick', price = 10000 },
			{ name = 'drill', price = 75000 },
			{ name = 'cutter', price = 75000 },
			{ name = 'gasmask', price = 200000 },
			{ name = 'laptop', price = 100000 },
			{ name = 'trojan_usb', price = 100000 },
			{ name = 'thermite', price = 250000 },
			{ name = 'thermitec', price = 250000 },
			{ name = 'methlab', price = 20000 },
			{ name = 'ammonia', price = 500 },
			{ name = 'sacid', price = 500 },

		

		}, locations = {
			vector3(-330.39529418945, -2779.0559082031, 5.3273239135742)
		}, targets = {
			{ loc = { x = -330.39529418945, y = -2779.0559082031, z = 5.3273239135742, h = 267.71435546875}, length = 0.6, width = 3.0, heading = 267.71435546875, minZ = -4.2210-1, maxZ = -4.2210+1, distance = 3.0, pedaq = true },
			-- { loc = vector3(-163.92, 6334.4, 31.58), length = 0.6, width = 3.0, heading = 315.0, minZ = 31.0, maxZ = 33.0, distance = 3.0, pedaq = true }
		}
	}, -- CTRL + Ö

	-- BlackMarketArms = {
	-- 	name = 'Black Market (Arms)',
	-- 	inventory = {
	-- 		{ name = 'WEAPON_DAGGER', price = 5000, metadata = { registered = false	}, currency = 'black_money' },
	-- 		{ name = 'WEAPON_CERAMICPISTOL', price = 50000, metadata = { registered = false }, currency = 'black_money' },
	-- 		{ name = 'at_suppressor_light', price = 50000, currency = 'black_money' },
	-- 		{ name = 'ammo-rifle', price = 1000, currency = 'black_money' },
	-- 		{ name = 'ammo-rifle2', price = 1000, currency = 'black_money' }
	-- 	}, locations = {
	-- 		vec3(309.09, -913.75, 56.46)
	-- 	}, targets = {

	-- 	}
	-- },

	VendingMachineDrinks = {
		name = 'Vending Machine',
		inventory = {
			{ name = 'water', price = 10 },
			
		},
		model = {
			`prop_vend_soda_02`, `prop_vend_fridge01`, `prop_vend_water_01`, `prop_vend_soda_01`
		}
	}
}
