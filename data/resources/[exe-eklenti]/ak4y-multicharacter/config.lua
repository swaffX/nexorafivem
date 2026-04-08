-- ak4y dev.

-- IF YOU HAVE ANY PROBLEM OR DO YOU NEED HELP PLS COME TO MY DISCORD SERVER AND CREATE A TICKET
-- IF YOU DONT HAVE ANY PROBLEM YET AGAIN COME TO MY DISCORD :)
-- https://discord.gg/kWwM3Bx

AK4Y = {}

AK4Y.Framework = "qb" -- qb / oldqb | qb = export system | oldqb = triggerevent system
AK4Y.Mysql = "oxmysql" -- Check fxmanifest.lua when you change it! | ghmattimysql / oxmysql / mysql-async

AK4Y.CustomFrameWork = false
AK4Y.CustomFrameWorkExport = "qb-core"

AK4Y.TebexLink = "https://ak4y.tebex.io/package/5378984/"
AK4Y.Translate = {
    title = "AK4Y",
    character = "KARAKTER",
    selector = "SEÇİCİ",
    firstDesc = "Müşteri çok önemlidir, müşteri müşteri tarafından takip edilecektir. Yarın elefend her zaman zehirli bir boğaza ihtiyacın var.",
    createCharacter = "BİR KARAKTER OLUŞTUR",
    buySlot = "SLOT SATIN AL",
    play = "OYNA",
    delete = "SİL",
    male = "ERKEK",
    female = "KADIN",
    dateOfBirth = "DOĞUM TARİHİ",
    nationality = "MİLLİYET",
    job = "GÖREV",
    cash = "NAKİT",
    bank = "BANKA",
    phoneNumber = "TELEFON NUMARASI",
    accountNumber = "HESAP NUMARASI",
    rightTitle1 = "KARAKTER",
    rightTitle2 = "YARATICI",
    rightDescription = "Sabırlı olmak çok önemli.",
    name = "İSİM",
    surname = "SOYAD",
    create = "OLUŞTUR",
    slot = "SLOT",
    redeemCode = "TEKRAR KODLA",
    buyCode = "KOD SATIN AL",
    cancel = "İPTAL ETMEK",
    accept = "KABUL",
    characterInfo = "KARAKTER BİLGİLERİ",
    loading = "YÜKLENİYOR!",
    plsWait = "Karakter bilgileriniz yüklenirken lütfen bekleyiniz!",  
    doYouAgreeDelete = "İSİMLİ KARAKTERİN SİLİNMESİNE KABUL EDİYOR MUSUNUZ?",
}

AK4Y.MaxCharSlot = 4
AK4Y.DefaultOpenCharSlot = 2

AK4Y.UseQbApartments = false

AK4Y.Interior = vector3(406.74, -953.56, -99.0) -- Interior to load where characters are previewed
AK4Y.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86) -- Default spawn coords if you have start apartments disabled
AK4Y.PedCoords = vector4(406.68, -953.71, -100.0, 334.91) -- Create preview ped at these coordinates
AK4Y.HiddenCoords = vector4(-812.23, 182.54, 76.74, 156.5) -- Hides your actual ped while you are in selection
AK4Y.CamCoords = vector4(407.59, -951.7, -99.0, 155.91) -- Camera coordinates for character preview screen
AK4Y.EnableDeleteButton = true -- doesnt work now, i will release an update

AK4Y.DefaultNumberOfCharacters = 5 -- Define maximum amount of default characters (maximum 5 characters defined by default)
AK4Y.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", numberOfChars = 2 },
}

AK4Y.StarterItems = {
    {item = "id_card", amount = 1},
    {item = "driver_license", amount = 1},
    {item = "phone", amount = 1},
    {item = "tosti", amount = 2},
    {item = "water_bottle", amount = 2},
}

AK4Y.PlayerLoaded = function(citizenId)

end

