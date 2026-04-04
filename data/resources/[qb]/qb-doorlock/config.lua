Config = {}

Config.CommandPermission = 'god' -- permission level for creating new doors
Config.AdminAccess = false -- Enable admins to unlock any door
Config.AdminPermission = 'god' -- The permission needed to get AdminAccess if it is enabled
Config.Warnings = false -- if true it will show warnings in the console when certain requirements aren't met
Config.FallbackDistance = 3.0 -- Distance to fall back on when it is not set
Config.EnableSounds = true -- Enable sounds when unlocking/locking doors (doors triggered by scripts can have the sound manually disabled)
Config.EnableAnimation = true -- Enable the animation when unlocking/locking doors (doors triggered by scripts can have the animation manually disabled)
Config.SaveDoorDialog = true -- Saves the door dialogue popup between door saves
Config.PersistentDoorStates = false -- Persists the door state between server restarts
Config.PersistentSaveInternal = 60000 -- How often door states are saved to the file system, in miliseconds. 

Config.ChangeColor = false -- Change the color of the box of the popup text based on if it is locked or not
Config.DefaultColor = 'rgb(0, 0, 0)' -- The default color of the box of the popup text if Config.ChangeColor is false
Config.LockedColor = 'rgb(219 58 58)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is locked
Config.UnlockedColor = 'rgb(27 195 63)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is unlocked
Config.UseDoorLabelText = false -- Will use the LABEL field as the nui text instead of locked/unlocked
Config.DoorDebug = false -- Enable DRAWTEXT in the world at the coords where the door 'center' is
Config.RemoteTriggerDistance = 15.0 -- This is how far from your camera the raycast will go to try to hit something solid
Config.RemoteTriggerMinDistance = 5.0 -- This is the minimum distance required for the raycast hit to count near a door. It will take the larger two between this and 'distance' option

Config.Consumables = { ['ticket'] = 1, ['paperclip'] = 1 } -- The items will get removed once used on a door that has the item on it

--[[ -- Configuration Options
Config.DoorList['configname-identifier'] = {
	fixText = false, -- Adjusts guess of center of door
	textCoords = vector3(x, y, z) -- Set the text coordinates to a specific location
	setText = true -- Use with above setting
		distance = 2.0, -- Max interact distance
		lockpick = true, -- Alows for lockpicking
	allAuthorized = true, -- Anyone can use door
	authorizedJobs = { ['police']=0, ['bcso']=0, ['sasp]=0 } -- Authorize door access based on job grade
	authorizedGangs = { ['vagos']=0, ['ballas']=0 } -- Authorize door access based on gang grade
	authorizedCitizenIDs = { 'ABC123', 'DEF456' } -- Authorize door access based on citizenid
	items = {'item_1','item_2'} -- Authorize based on items. Must have all items in this list.
		doorLabel = 'Cloakroom', -- Label of room that shows up when nearby
		locked = true, -- Default lock state
		audioRemote = true, -- Play sound from the player instead of the door
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6}, -- Play sound on door lock
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}, -- Play sound on door unlock
		autoLock = 1000, -- Auto lock after this many miliseconds
		doorRate = 1.0,  -- Time till auto closes? Needs more testing
	cantUnlock = true -- Set to true to not allow the player to unlock the door, only lock it. This means a script will have to trigger the unlock.
	pickable = true, -- Can use a lockpick to unlock, only need if true
	hideLabel = true, -- Set to true to hide the popup label, for hiding doors ;)
		remoteTrigger = true, -- If you want to be able to remote trigger a door with H, put this here 
} 
]]

Config.DoorStates = {}
Config.DoorList = {
	--- door1 for pacific opened with security card B
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		objHash = -2023754432,
		objHeading = 135.00006103516,
		objCoords = vector3(-446.3145, 6001.389, 31.83744),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		objHash = -2023754432,
		objHeading = 225.01422119141,
		objCoords = vector3(-435.0605, 6009.784, 24.85843),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		objHash = -2023754432,
		objHeading = 134.9815826416,
		objCoords = vector3(-451.0211, 6006.034, 31.99549),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		objHash = -2023754432,
		objHeading = 45.000080108643,
		objCoords = vector3(-440.6023, 6013.479, 24.8007),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		objHash = 631614199,
		objHeading = 44.927597045898,
		objCoords = vector3(-449.1, 6015.742, 24.82108),
		locked = true,
		maxDistance = 2.0,
		fixText = false
	
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		objHash = 631614199,
		objHeading = 315.00006103516,
		objCoords = vector3(-455.5055, 6015.458, 24.82108),
		locked = true,
		maxDistance = 2.0,
		fixText = false
	
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		objHash = 631614199,
		objHeading = 315.00006103516,
		objCoords = vector3(-453.333, 6013.285, 24.82108),
		locked = true,
		maxDistance = 2.0,
		fixText = false
	
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		objHash = 631614199,
		objHeading = 315.00006103516,
		objCoords = vector3(-451.1761, 6011.128, 24.82108),
		locked = true,
		maxDistance = 2.0,
		fixText = false
	
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		objHash = 631614199,
		objHeading = 315.00006103516,
		objCoords = vector3(-448.9944, 6008.946, 24.82108),
		locked = true,
		maxDistance = 2.0,
		fixText = false
	
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		objHash = -2023754432,
		objHeading = 225.14221191406,
		objCoords = vector3(-437.8179, 6012.475, 24.8007),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		objHash = -2023754432,
		objHeading = 225.00004577637,
		objCoords = vector3(-443.7829, 6001.062, 24.84448),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},
	
	-- 	ŞERİF ÇİFT KAPILILAR
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -2023754432, objHeading = 224.92175292969, objCoords = vector3(-443.5417, 6002.614, 31.86633)},
			{objHash = -2023754432, objHeading = 44.986377716064, objCoords = vector3(-445.3718, 6000.777, 31.86633)}
		},
		
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = false,
		maxDistance = 2.0,
		doors = {
			{objHash = -1501157055, objHeading = 135.00006103516, objCoords = vector3(-444.4985, 6017.06, 31.86633)},
			{objHash = -1501157055, objHeading = 315.04901123047, objCoords = vector3(-442.66, 6015.222, 31.86633)}
		},
		
	},
	
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -2023754432, objHeading = 314.95138549805, objCoords = vector3(-449.5486, 6008.556, 31.86633)},
			{objHash = -2023754432, objHeading = 134.84490966797, objCoords = vector3(-447.7093, 6006.717, 31.86633)}
		},
		
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -2023754432, objHeading = 225.07875061035, objCoords = vector3(-452.5156, 6011.426, 31.87728)},
			{objHash = -2023754432, objHeading = 45.112838745117, objCoords = vector3(-454.3589, 6009.582, 31.87728)}
		},
		
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -2023754432, objHeading = 44.901054382324, objCoords = vector3(-440.9697, 6003.875, 24.8748)},
			{objHash = -2023754432, objHeading = 225.06289672852, objCoords = vector3(-439.1431, 6005.702, 24.86486)}
		},
		
	},



	-- gabz_mrpd	
--	{
--		authorizedJobs = { ['cardealer']=0, ['offcardealer']=0},
--		locked = true,
--		maxDistance = 2.0,
--		doors = {
--			{objHash = 1375546106, objHeading = 315.19674682617, objCoords = vector3(-246.574, 6213.167, 32.24504)},
			
	--	},
		
--	},




--HASTANE
{
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },
	objHash = -770740285,
	objHeading = 44.3,
	objCoords = vector3(-256.52, 6314.24, 32.47),
	locked = false,
	maxDistance = 2.0,
	fixText = true

},


---SANDY SHORES SHERİFF
{
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	objHash = -1927754726,
	objHeading = 300.0,
	objCoords = vector3(1859.0, 3694.94, 30.41),
	locked = false,
	maxDistance = 2.0,
	fixText = true

},
{
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	objHash = -1927754726,
	objHeading = 300.0,
	objCoords = vector3(1860.9, 3691.64, 30.41),
	locked = false,
	maxDistance = 2.0,
	fixText = true

},
{
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	objHash = -1927754726,
	objHeading = 300.0,
	objCoords = vector3(1862.76, 3688.41, 30.41),
	locked = false,
	maxDistance = 2.0,
	fixText = true

},
{
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	objHash = -1927754726,
	objHeading = 300.08,
	objCoords = vector3(1859.7, 3686.64, 30.41),
	locked = false,
	maxDistance = 2.0,
	fixText = true

},
{
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	objHash = -2023754432,
	objHeading = 209.2,
	objCoords = vector3(1857.25, 3690.3, 34.42),
	locked = true,
	maxDistance = 2.0,
	fixText = true

},
{
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	locked = true,
	maxDistance = 2.0,
	doors = {
		{objHash = -2023754432, objHeading = 209.1, objCoords = vector3(1849.4, 3691.21, 34.42)},
		{objHash = -2023754432, objHeading = 28.92, objCoords = vector3(1847.13, 3689.95, 34.42)}
	},
	
},


	-- gabz_mrpd	LOBBY RIGHT
	{
		objHash = -96679321,
		objHeading = 180.0,
		objCoords = vector3(440.5201, -986.2335, 30.82319),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
	},
	{
		objHash = -1406685646,
		objHeading = 359.98,
		objCoords = vector3(440.52, -977.6, 30.82),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
	},
	{
		objHash = -1406685646,
		objHeading = 0.03,
		objCoords = vector3(440.52, -986.17, 30.82),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
	},


	-- gabz_mrpd	GARAGE ENTRANCE 1
	{
		objHash = 1830360419,
		objHeading = 269.78,
		objCoords = vector3(464.1591, -974.6656, 26.3707),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	GARAGE ENTRANCE 2
	{
		objHash = 1830360419,
		objHeading = 89.87,
		objCoords = vector3(464.1566, -997.5093, 26.3707),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},
	
	-- gabz_mrpd	GARAGE ROLLER DOOR 1
	{
		objHash = 2130672747,
		objHeading = 0.0,
		objCoords = vector3(431.4119, -1000.772, 26.69661),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 6,
		garage = true,
		slides = true,
		audioRemote = true
	},
	
	-- gabz_mrpd	GARAGE ROLLER DOOR 2
	{
		objHash = 2130672747,
		objHeading = 0.0,
		objCoords = vector3(452.3005, -1000.772, 26.69661),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 6,
		garage = true,
		slides = true,
		audioRemote = true
	},
	{
		objHash = 149284793,
		objHeading = 225.14,
		objCoords = vector3(458.09, -995.52, 30.82),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2,
		garage = true,
		slides = true,
		audioRemote = true
	},
	
	-- gabz_mrpd	BACK GATE
	{
		objHash = -1603817716,
		objHeading = 90.0,
		objCoords = vector3(488.8948, -1017.212, 27.14935),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 6,
		slides = true,
		audioRemote = true
	},

	-- gabz_mrpd	BACK DOORS
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -692649124, objHeading = 0.0, objCoords = vector3(467.3686, -1014.406, 26.48382)},
			{objHash = -692649124, objHeading = 180.0, objCoords = vector3(469.7743, -1014.406, 26.48382)}
		},
		
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -288803980, objHeading = 90.08, objCoords = vector3(469.44, -987.44, 30.82)},
			{objHash = -288803980, objHeading = 270.04, objCoords = vector3(469.44, -985.03, 30.82)}
		},
		
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -1547307588, objHeading = 180.05, objCoords = vector3(443.06, -998.75, 30.82)},
			{objHash = -1547307588, objHeading = 359.91, objCoords = vector3(440.74, -998.75, 30.82)}
		},
		
	},
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -1547307588, objHeading = 359.86, objCoords = vector3(455.89, -972.25, 30.82)},
			{objHash = -1547307588, objHeading = 180.2, objCoords = vector3(458.21, -972.25, 30.82)}
		},
		
	},


	-- gabz_mrpd	MUGSHOT
	{
		objHash = -1406685646,
		objHeading = 180.0,
		objCoords = vector3(475.9539, -1010.819, 26.40639),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	CELL ENTRANCE 1
	{
		objHash = -53345114,
		objHeading = 270.0,
		objCoords = vector3(476.6157, -1008.875, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL ENTRANCE 2
	{
		objHash = -53345114,
		objHeading = 180.0,
		objCoords = vector3(481.0084, -1004.118, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 1
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(477.9126, -1012.189, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 2
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(480.9128, -1012.189, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 3
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(483.9127, -1012.189, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 4
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(486.9131, -1012.189, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 5
	{
		objHash = -53345114,
		objHeading = 180.0,
		objCoords = vector3(484.1764, -1007.734, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	LINEUP
	{
		objHash = -288803980,
		objHeading = 90.0,
		objCoords = vector3(479.06, -1003.173, 26.4065),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	OBSERVATION I
	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6694, -983.9868, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	INTERROGATION I
	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6701, -987.5792, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	OBSERVATION II
	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6699, -992.2991, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	INTERROGATION II
	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6703, -995.7285, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	STASH
	{
		objHash = -692649124,
		objHeading = 134.7,
		objCoords = vector3(475.8323, -990.4839, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	ARMOURY 1
	{
		objHash = -692649124,
		objHeading = 90.0,
		objCoords = vector3(479.7507, -999.629, 30.78927),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	ARMOURY 2
	{
		objHash = -692649124,
		objHeading = 181.28,
		objCoords = vector3(487.4378, -1000.189, 30.78697),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	SHOOTING RANGE
	{
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -692649124, objHeading = 0.0, objCoords = vector3(485.6133, -1002.902, 30.78697)},
			{objHash = -692649124, objHeading = 180.0, objCoords = vector3(488.0184, -1002.902, 30.78697)}
		},
		
	},

	-- gabz_mrpd	ROOFTOP
	{
		objCoords = vector3(464.3086, -984.5284, 43.77124),
		authorizedJobs = { ['police']=0 },
		objHeading = 90.000465393066,
		slides = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = -692649124,
		locked = true,
		fixText = true,
	}

}

-- gabz_mrpd Evidence
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	locked = true,
	lockpick = false,
	audioRemote = false,
	slides = false,
	fixText = false,		
	doors = {
		{objHash = -96679321, objHeading = 270.00003051758, objCoords = vector3(479.7534, -988.6204, 30.82319)},
		{objHash = -1406685646, objHeading = 270.00003051758, objCoords = vector3(479.7534, -986.2151, 30.82319)}
 },
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- gabz_mrpd OUT GARAGE DOOR
table.insert(Config.DoorList, {
	fixText = false,
	maxDistance = 7.0,
	doors = {
		{objHash = -1635161509, objHeading = 270.01773071289, objCoords = vector3(410.0258, -1024.22, 29.2202)},
		{objHash = -1868050792, objHeading = 270.0, objCoords = vector3(410.0258, -1024.226, 29.22022)}
 },
	authorizedJobs = { ['police']=0 },
	audioRemote = true,
	locked = true,
	slides = true,
	garage = true,
})

-- Prison Gate 1
table.insert(Config.DoorList, {
	objHeading = 90.000305175781,
	locked = true,
	authorizedJobs = { ['police']=0, ['police']=0 },
	maxDistance = 6.0,
	fixText = true,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(1844.998, 2604.812, 44.63978),
	slides = true,
	objHash = 741314661,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Prison Gate 2 
table.insert(Config.DoorList, {
	objCoords = vector3(1818.543, 2604.812, 44.611),
	authorizedJobs = { ['police']=0, ['police']=0 },
	slides = true,
	audioRemote = false,
	lockpick = false,
	objHash = 741314661,
	locked = true,
	objHeading = 90.0,
	fixText = true,
	maxDistance = 6.0,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Prison visitor halway steel doors 1
table.insert(Config.DoorList, {
	objHeading = 179.99987792969,
	garage = false,
	locked = true,
	authorizedJobs = { ['police']=0, ['police']=0 },
	lockpick = false,
	audioRemote = false,
	objHash = -1156020871,
	fixText = true,
	maxDistance = 2.0,
	slides = false,
	objCoords = vector3(1797.761, 2596.565, 46.38731),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Prison visitor halway steel doors 2
table.insert(Config.DoorList, {
	slides = false,
	authorizedJobs = { ['police']=0, ['police']=0 },
	maxDistance = 2.0,
	lockpick = false,
	objHash = -1156020871,
	audioRemote = false,
	locked = true,
	objHeading = 179.99987792969,
	objCoords = vector3(1798.09, 2591.687, 46.41784),
	fixText = true,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Prison visitor slide steel doors 1
table.insert(Config.DoorList, {
	locked = true,
	slides = true,
	objHash = -1612152164,
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['police']=0 },
	objCoords = vector3(1831.514, 2594.452, 44.95518),
	lockpick = false,
	objHeading = 90.080513000488,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Prison visitor lobby slide steel doors 
table.insert(Config.DoorList, {
	locked = true,
	slides = true,
	objHash = -1612152164,
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['police']=0 },
	objCoords = vector3(1836.558, 2594.45, 44.95518),
	lockpick = false,
	objHeading = 90.080513000488,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Prison door
table.insert(Config.DoorList, {
	objHeading = 179.95936584473,
	garage = false,
	maxDistance = 2.0,
	fixText = true,
	lockpick = false,
	authorizedJobs = { ['police']=0, ['police']=0 },
	slides = false,
	audioRemote = false,
	locked = true,
	objCoords = vector3(1786.369, 2600.218, 45.99691),
	objHash = -1033001619,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Prison door
table.insert(Config.DoorList, {
	objHeading = 359.95935058594,
	objHash = -688867873,
	objCoords = vector3(1780.898, 2597.126, 45.83871),
	maxDistance = 2.0,
	slides = false,
	lockpick = false,
	authorizedJobs = { ['police']=0, ['police']=0 },
	audioRemote = false,
	fixText = false,
	locked = true,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Prison door
table.insert(Config.DoorList, {
	objHeading = 359.95935058594,
	objHash = -688867873,
	objCoords = vector3(1777.96, 2597.123, 45.83838),
	maxDistance = 2.0,
	slides = false,
	lockpick = false,
	authorizedJobs = { ['police']=0, ['police']=0 },
	audioRemote = false,
	fixText = false,
	locked = true,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Prison door
table.insert(Config.DoorList, {
	objHeading = 359.95935058594,
	objHash = -688867873,
	objCoords = vector3(1775.008, 2597.116, 45.83894),
	maxDistance = 2.0,
	slides = false,
	lockpick = false,
	authorizedJobs = { ['police']=0, ['police']=0 },
	audioRemote = false,
	fixText = false,
	locked = true,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Prison door
table.insert(Config.DoorList, {
	objHeading = 269.95935058594,
	objHash = -688867873,
	objCoords = vector3(1772.604, 2597.686, 45.8366),
	maxDistance = 2.0,
	slides = false,
	lockpick = false,
	authorizedJobs = { ['police']=0, ['police']=0 },
	audioRemote = false,
	fixText = false,
	locked = true,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Prison door
table.insert(Config.DoorList, {
	objHeading = 359.95935058594,
	objHash = -1033001619,
	objCoords = vector3(1770.347, 2566.62, 45.876),
	maxDistance = 2.0,
	slides = false,
	lockpick = false,
	authorizedJobs = { ['police']=0, ['police']=0 },
	audioRemote = false,
	fixText = true,
	locked = true,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- LSSD CELL 1
table.insert(Config.DoorList, {
	objHash = 631614199,
	maxDistance = 2.0,
	garage = false,
	fixText = false,
	slides = false,
	lockpick = false,
	objHeading = 315.51544189453,
	objCoords = vector3(-432.1754, 5992.122, 31.87312),
	audioRemote = false,
	locked = true,
	authorizedJobs = { ['police']=0 },		
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
})

-- LSSD CELL 2
table.insert(Config.DoorList, {
	objHash = 631614199,
	maxDistance = 2.0,
	garage = false,
	fixText = false,
	slides = false,
	lockpick = false,
	objHeading = 315.51544189453,
	objCoords = vector3(-428.0646, 5996.672, 31.87312),
	audioRemote = false,
	locked = true,
	authorizedJobs = { ['police']=0 },		
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
})

-- LSSD CELL 3
table.insert(Config.DoorList, {
	objHash = 631614199,
	maxDistance = 2.0,
	garage = false,
	fixText = false,
	slides = false,
	lockpick = false,
	objHeading = 315.51544189453,
	objCoords = vector3(-431.1921, 5999.742, 31.87312),
	audioRemote = false,
	locked = true,
	authorizedJobs = { ['police']=0 },		
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
})

-- LSSD ARMORY
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	fixText = true,
	audioRemote = false,
	objHeading = 314.74157714844,
	authorizedJobs = { ['police']=0 },
	maxDistance = 2.0,
	locked = true,
	objHash = -1011692606,
	slides = false,
	objCoords = vector3(-437.6144, 5992.819, 31.93606),		
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
})

-- LSSD BACK DOOR 1
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	objHeading = 134.83694458008,
	garage = false,
	slides = false,
	objCoords = vector3(-447.2263, 6002.329, 31.83943),
	audioRemote = false,
	objHash = 452874391,
	fixText = false,
	lockpick = false,
	locked = true,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- LSSD BACK DOOR 2
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	objHeading = 315.33602905273,
	garage = false,
	slides = false,
	objCoords = vector3(-450.9787, 6006.075, 31.99417),
	audioRemote = false,
	objHash = 452874391,
	fixText = false,
	lockpick = false,
	locked = true,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- LSSD BLUE DOOR
table.insert(Config.DoorList, {
	fixText = true,
	garage = false,
	objCoords = vector3(-454.536, 6011.258, 31.86982),
	maxDistance = 2.0,
	locked = true,
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	objHeading = 10.008575439453,
	objHash = -519068795,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- LSSD DOUBLE DOOR 1
table.insert(Config.DoorList, {
	doors = {
		{objHash = 964838196, objHeading = 225.00004577637, objCoords = vector3(-442.8215, 6010.931, 31.86633)},
		{objHash = 964838196, objHeading = 45.000091552734, objCoords = vector3(-440.9807, 6012.771, 31.86633)}
 },
	maxDistance = 2.5,
	lockpick = false,
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- LSSD DOUBLE DOOR 2
table.insert(Config.DoorList, {
	doors = {
		{objHash = -681066206, objHeading = 135.00007629395, objCoords = vector3(-449.55, 6008.558, 31.80887)},
		{objHash = 245182344, objHeading = 315.00006103516, objCoords = vector3(-447.7092, 6006.717, 31.80887)}
 },
	maxDistance = 2.5,
	lockpick = false,
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	locked = true,
	fixText = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})




















