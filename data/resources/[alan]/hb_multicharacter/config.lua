Config = {}

Config.EnableDeleteButton = false --Karakter silmeyi açar veya kapatı close character dell button false enable close button true
Config.UseAppearance = "illenium-appearance" -- bunlardan birini kullanabilirsiniz "illenium-appearance", "fivem-appearance", "qb-clothing" 

Config.Blur = false
Config.CameraFoV = 70.0 -- CameraFoV adında bir değişken oluşturur ve bunu kameranın görüş alanına ayarlar
Config.CameraNearDof = 0.2 -- CameraNearDof adında bir değişken oluşturur ve bunu kameranın yakın görüş açısına ayarlar
Config.CameraFarDof = 2.5 -- CameraFarDof adında bir değişken oluşturur ve bunu kameranın en uzak noktasına ayarlar
Config.CameraDofStrength = 1000.0 -- CameraDofStrength adında bir değişken oluşturur ve bunu kameranın etki alanı gücüne ayarlar
Config.ShakeType = "HAND_SHAKE" -- ShakeType adında bir değişken oluşturur ve onu kameranın sallanma türüne ayarlar
Config.CameraShake = 0.2 -- CameraShake adında bir değişken oluşturur ve bunu kameranın sallanmasına göre ayarlar


--[[
 .----------------.  .----------------.  .----------------.  .----------------. 
 | .--------------. || .--------------. || .--------------. || .--------------. |
 | |    _______   | || |   _____      | || |     ____     | || |  _________   | |
 | |   /  ___  |  | || |  |_   _|     | || |   .'    `.   | || | |  _   _  |  | |
 | |  |  (__ \_|  | || |    | |       | || |  /  .--.  \  | || | |_/ | | \_|  | |
 | |   '.___`-.   | || |    | |   _   | || |  | |    | |  | || |     | |      | |
 | |  |`\____) |  | || |   _| |__/ |  | || |  \  `--'  /  | || |    _| |_     | |
 | |  |_______.'  | || |  |________|  | || |   `.____.'   | || |   |_____|    | |
 | |              | || |              | || |              | || |              | |
 | '--------------' || '--------------' || '--------------' || '--------------' |
  '----------------'  '----------------'  '----------------'  '----------------' 
]]

Config.customNationality = false -- Uyruk girişinin tanımları, Ülke listesine özel olarak engellenmiştirs
Config.DefaultNumberOfCharacters = 1 -- Maksimum miktarda varsayılan karakter sayısı (varsayılan olarak maksimum 5 karakter tanımlanır)
Config.PlayersNumberOfCharacters = { -- Maksimum oyuncu karakteri miktarını rockstar lisansına göre tanımlayın (bu lisansı sunucunuzun veritabanında oyuncu tablosunda bulabilirsiniz)
    { license = "license:d91243c901cd9d58c601cee7c6e6deddb54d616c", numberOfChars = 3 },
    { license = "license:0b9812927335c6414f17b0e41b7373339da73943", numberOfChars = 3 },
}


Config.Interior = vector3(-814.89, 181.95, 76.85) -- Karakterlerin önizlendiği yerin yükleneceği iç mekan
Config.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86) -- Başlangıç ​​dairelerini devre dışı bıraktıysanız varsayılan ortaya çıkma kodları
-- Karakter seçme ekranı için ped pozisyonları ve animasyonları
Config.PedSlots = {
    [1] = { coords = vector4(163.06, 7032.38, 2.15, 337.1), anim = "WORLD_HUMAN_HANG_OUT_STREET" },
    [2] = { coords = vector4(163.3, 7034.18, 2.04, 281.48), anim = "WORLD_HUMAN_STAND_IMPATIENT" },
    [3] = { coords = vector4(163.75, 7035.85, 2.0, 225.08), anim = "WORLD_HUMAN_SMOKING_POT" },
}
Config.HiddenCoords = vector4(170.8, 7030.49, 2.27, 57.18) --Seçimdeyken gerçek ped'inizi gizler
Config.CamCoords = vector4(166.43, 7035.0, 1.64, 90.19) -- Karakter önizleme ekranı vektörü için kamera koordinatları


--animasyonlar
Config.RandomAnims = {     
    "WORLD_HUMAN_HANG_OUT_STREET",
    "WORLD_HUMAN_STAND_IMPATIENT",
    "WORLD_HUMAN_STAND_MOBILE",
    "WORLD_HUMAN_SMOKING_POT",
    "WORLD_HUMAN_LEANING",
    "WORLD_HUMAN_DRUG_DEALER_HARD",
    "WORLD_HUMAN_SUPERHERO",
    "WORLD_HUMAN_TOURIST_MAP",
    "WORLD_HUMAN_BINOCULARS",
    "WORLD_HUMAN_MUSCLE_FLEX",
    "WORLD_HUMAN_MUSICIAN",
    "WORLD_HUMAN_PAPARAZZI",
    "WORLD_HUMAN_PARTYING",
}
