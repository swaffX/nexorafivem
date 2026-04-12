-- ak4y dev.

-- IF YOU HAVE ANY PROBLEM OR DO YOU NEED HELP PLS COME TO MY DISCORD SERVER AND CREATE A TICKET
-- IF YOU DONT HAVE ANY PROBLEM YET AGAIN COME TO MY DISCORD :)
-- https://discord.gg/kWwM3Bx

AK4Y = {}

AK4Y.Framework = "qb" -- qb / oldqb | qb = export system | oldqb = triggerevent system
AK4Y.Mysql = "oxmysql" -- Check fxmanifest.lua when you change it! | ghmattimysql / oxmysql / mysql-async

AK4Y.CustomFrameWork = false
AK4Y.CustomFrameWorkExport = "qb-core"

AK4Y.TebexLink = "https://discord.com/invite/qdev"
AK4Y.Translate = {
    title = "NEXORA ROLEPLAY",
    character = "RP",
    selector = "",
    firstDesc = "",
    createCharacter = "KARAKTER YAp",
    buySlot = "KİLİTLİ SLOT",
    play = "OYNA",
    delete = "SİL",
    male = "ERKEK",
    female = "KADIN",
    dateOfBirth = "DOĞUM TARİHİ",
    nationality = "UYRUK",
    job = "MESLEK",
    cash = "CÜZDAN",
    bank = "BANKA",
    phoneNumber = "TELEFON NUMARASI",
    accountNumber = "HESAP NUMARASI",
    rightTitle1 = "KARAKTER",
    rightTitle2 = "YARAT",
    rightDescription = "Maceraya girmeye hazırmısın",
    name = "AD",
    surname = "SOYAD",
    create = "OLUŞTUR",
    slot = "KARAKTER İZNİ İÇİN",
    redeemCode = "TİCKET OLUŞTUR",
    buyCode = "TIKLA DİSCORDA GEL",
    cancel = "HAYIR",
    accept = "EVET",
    characterInfo = "KARAKTER BİLGİLERİ",
    loading = "YÜKLENİYOR!",
    plsWait = "Karakter bilgileriniz yüklenirken lütfen bekleyiniz.!",  
    doYouAgreeDelete = "İSİMLİ KARAKTERİN SİLİNMESİNE KABUL EDİYOR MUSUNUZ?",
}

AK4Y.MaxCharSlot = 4
AK4Y.DefaultOpenCharSlot = 1

AK4Y.UseQbApartments = false

AK4Y.Interior = vector3(406.74, -953.56, -99.0) -- Interior to load where characters are previewed
AK4Y.DefaultSpawn = vector3(-1037.9, -2738.03, 20.17)-- Default spawn coords if you have start apartments disabled
AK4Y.PedCoords = vector4(-811.18, 175.4, 76.75, 108.63) -- Create preview ped at these coordinates
AK4Y.HiddenCoords = vector4(-812.23, 182.54, 76.74, 156.5) -- Hides your actual ped while you are in selection
AK4Y.CamCoords = vector4(-814.0, 174.34, 76.74, 291.05) -- Camera coordinates for character preview screen
AK4Y.EnableDeleteButton = false -- doesnt work now, i will release an update

AK4Y.DefaultNumberOfCharacters = 1 -- Define maximum amount of default characters (maximum 5 characters defined by default)
AK4Y.PlayersNumberOfCharacters = {} -- Admin slot kontrolü server-side yapılacak

AK4Y.StarterItems = {
    {item = "id_card", amount = 1},
    {item = "driver_license", amount = 1},
    {item = "white_phone", amount = 1},
    {item = "sandwich", amount = 2},
    {item = "kurkakola", amount = 2},
    -- {item = "burger", amount = 3},
    -- {item = "phone", amount = 1},
}

AK4Y.PlayerLoaded = function(citizenId)

end

