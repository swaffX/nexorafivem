Config = {}


Config.keyprice = 50 -- yedek anahtarın fiyatı


Config.Motels = {
    ["pinkcage"] = {
        label = "Pinkcage Motel",
        coords = vector3(324.88, -229.86, 54.22),
        pedModel = "a_m_y_stwhi_01",
        rentPrice = 200,
        rentFee = 20,
        rooms = {
    [1] = {door = vector3(307.57, -213.29, 54.22), h = 68.9096, doortext = vector3(307.318, -213.26, 54.2199), stash = vector3(306.71, -208.50, 54.22), obj = nil, clothe = vector3(302.58, -207.35, 54.22), locked = true},
    [2] = {door = vector3(311.36, -203.46, 54.22), h = 68.9096, doortext = vector3(311.108, -203.39, 54.2199), stash = vector3(310.51, -198.61, 54.22), obj = nil, clothe = vector3(306.32, -197.45, 54.22), locked = true},
    [3] = {door = vector3(315.79, -194.79, 54.22), h = 338.946, doortext = vector3(315.829, -194.65, 54.2267), stash = vector3(320.45, -194.13, 54.22), obj = nil, clothe = vector3(321.79, -189.81, 54.22), locked = true},
    [4] = {door = vector3(315.84, -219.66, 58.02), h = 158.0, doortext = vector3(314.827, -219.78, 58.0220), stash = vector3(310.17, -220.36, 58.02), obj = nil, clothe = vector3(308.85, -224.63, 58.02), locked = true},
    [5] = {door = vector3(307.35, -213.24, 58.02), h = 68.0, doortext = vector3(307.322, -213.25, 58.0151), stash = vector3(306.78, -208.53, 58.02), obj = nil, clothe = vector3(302.52, -207.23, 58.02), locked = true},
    [6] = {door = vector3(311.22, -203.35, 58.02), h = 68.0, doortext = vector3(311.107, -203.40, 58.0151), stash = vector3(310.64, -198.74, 58.02), obj = nil, clothe = vector3(306.33, -197.41, 58.02), locked = true},
    [7] = {door = vector3(315.78, -194.62, 58.02), h = 338.0, doortext = vector3(315.817, -194.64, 58.0151), stash = vector3(320.51, -194.11, 58.02), obj = nil, clothe = vector3(321.73, -189.70, 58.02), locked = true},
    [8] = {door = vector3(339.20, -219.47, 54.22), h = 248.0, doortext = vector3(339.316, -219.52, 54.2199), stash = vector3(339.93, -224.19, 54.22), obj = nil, clothe = vector3(344.24, -225.47, 54.22), locked = true},
    [9] = {door = vector3(342.93, -209.50, 54.22), h = 248.0, doortext = vector3(343.130, -209.61, 54.2199), stash = vector3(343.61, -214.35, 54.22), obj = nil, clothe = vector3(348.01, -215.56, 54.22), locked = true},
    [10]= {door = vector3(346.78, -199.66, 54.22), h = 248.0, doortext = vector3(346.927, -199.74, 54.2199), stash = vector3(347.34, -204.44, 54.22), obj = nil, clothe = vector3(351.86, -205.67, 54.22), locked = true},
    [11]= {door = vector3(335.00, -227.38, 58.02), h = 158.0, doortext = vector3(334.916, -227.47, 58.0150), stash = vector3(330.27, -228.04, 58.02), obj = nil, clothe = vector3(328.99, -232.40, 58.02), locked = true},
    [12]= {door = vector3(339.27, -219.49, 58.02), h = 248.0, doortext = vector3(339.301, -219.53, 58.0150), stash = vector3(339.85, -224.16, 58.02), obj = nil, clothe = vector3(344.21, -225.51, 58.02), locked = true},
    [13]= {door = vector3(343.08, -209.54, 58.02), h = 248.0, doortext = vector3(343.094, -209.64, 58.0150), stash = vector3(343.63, -214.27, 58.02), obj = nil, clothe = vector3(347.95, -215.52, 58.02), locked = true},
    [14]= {door = vector3(346.69, -199.66, 58.02), h = 248.0, doortext = vector3(346.924, -199.73, 58.0150), stash = vector3(347.49, -204.41, 58.02), obj = nil, clothe = vector3(351.77, -205.64, 58.02), locked = true},
        }
    },

    
    -- Perrera Beach Motel
    ["perrera"] = {
        label = "Perrera Beach Motel",
        coords = vector3(-1477.04, -672.02, 29.04),
        pedModel = "a_m_y_stwhi_01",
        rentPrice = 200,
        rentFee = 20,
        rooms = {
            [1] = {door = vector3(-1471.34, -668.52, 29.58), h = 43.42, doortext = vector3(-1471.34, -668.52, 29.58), stash = vector3(-1468.32, -671.99, 29.12), obj = nil, clothe = vector3(-1469.42, -670.69, 29.58), locked = true},
            [2] = {door = vector3(-1477.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1477.68, -671.58, 29.04), stash = vector3(-1479.35, -671.58, 29.04), obj = nil, clothe = vector3(-1481.35, -671.58, 29.04), locked = true},
            [3] = {door = vector3(-1473.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1473.68, -671.58, 29.04), stash = vector3(-1475.35, -671.58, 29.04), obj = nil, clothe = vector3(-1477.35, -671.58, 29.04), locked = true},
            [4] = {door = vector3(-1469.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1469.68, -671.58, 29.04), stash = vector3(-1471.35, -671.58, 29.04), obj = nil, clothe = vector3(-1473.35, -671.58, 29.04), locked = true},
            [5] = {door = vector3(-1465.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1465.68, -671.58, 29.04), stash = vector3(-1467.35, -671.58, 29.04), obj = nil, clothe = vector3(-1469.35, -671.58, 29.04), locked = true},
            [6] = {door = vector3(-1461.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1461.68, -671.58, 29.04), stash = vector3(-1463.35, -671.58, 29.04), obj = nil, clothe = vector3(-1465.35, -671.58, 29.04), locked = true},
            [7] = {door = vector3(-1457.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1457.68, -671.58, 29.04), stash = vector3(-1459.35, -671.58, 29.04), obj = nil, clothe = vector3(-1461.35, -671.58, 29.04), locked = true},
            [8] = {door = vector3(-1453.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1453.68, -671.58, 29.04), stash = vector3(-1455.35, -671.58, 29.04), obj = nil, clothe = vector3(-1457.35, -671.58, 29.04), locked = true},
            [9] = {door = vector3(-1449.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1449.68, -671.58, 29.04), stash = vector3(-1451.35, -671.58, 29.04), obj = nil, clothe = vector3(-1453.35, -671.58, 29.04), locked = true},
            [10] = {door = vector3(-1445.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1445.68, -671.58, 29.04), stash = vector3(-1447.35, -671.58, 29.04), obj = nil, clothe = vector3(-1449.35, -671.58, 29.04), locked = true},
            [11] = {door = vector3(-1441.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1441.68, -671.58, 29.04), stash = vector3(-1443.35, -671.58, 29.04), obj = nil, clothe = vector3(-1445.35, -671.58, 29.04), locked = true},
            [12] = {door = vector3(-1437.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1437.68, -671.58, 29.04), stash = vector3(-1439.35, -671.58, 29.04), obj = nil, clothe = vector3(-1441.35, -671.58, 29.04), locked = true},
            [13] = {door = vector3(-1433.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1433.68, -671.58, 29.04), stash = vector3(-1435.35, -671.58, 29.04), obj = nil, clothe = vector3(-1437.35, -671.58, 29.04), locked = true},
            [14] = {door = vector3(-1429.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1429.68, -671.58, 29.04), stash = vector3(-1431.35, -671.58, 29.04), obj = nil, clothe = vector3(-1433.35, -671.58, 29.04), locked = true},
            [15] = {door = vector3(-1425.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1425.68, -671.58, 29.04), stash = vector3(-1427.35, -671.58, 29.04), obj = nil, clothe = vector3(-1429.35, -671.58, 29.04), locked = true},
            [16] = {door = vector3(-1421.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1421.68, -671.58, 29.04), stash = vector3(-1423.35, -671.58, 29.04), obj = nil, clothe = vector3(-1425.35, -671.58, 29.04), locked = true},
            [17] = {door = vector3(-1417.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1417.68, -671.58, 29.04), stash = vector3(-1419.35, -671.58, 29.04), obj = nil, clothe = vector3(-1421.35, -671.58, 29.04), locked = true},
            [18] = {door = vector3(-1413.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1413.68, -671.58, 29.04), stash = vector3(-1415.35, -671.58, 29.04), obj = nil, clothe = vector3(-1417.35, -671.58, 29.04), locked = true},
            [19] = {door = vector3(-1409.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1409.68, -671.58, 29.04), stash = vector3(-1411.35, -671.58, 29.04), obj = nil, clothe = vector3(-1413.35, -671.58, 29.04), locked = true},
            [20] = {door = vector3(-1405.68, -671.58, 29.04), h = 43.42, doortext = vector3(-1405.68, -671.58, 29.04), stash = vector3(-1407.35, -671.58, 29.04), obj = nil, clothe = vector3(-1409.35, -671.58, 29.04), locked = true},
        }
    },
}