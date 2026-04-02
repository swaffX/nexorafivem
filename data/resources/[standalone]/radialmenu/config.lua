QBCore = exports['qb-core']:GetCoreObject()

PlayerData = {}
isDead = false
job = "unemployed"
onDuty = true
prop, yatak, animYatak = false, false, false

rootMenuConfig =  {
    {
        id = "genel",
        displayName = "Genel",
        icon = "#globe-europe",
        enableMenu = function()
            return not isDead
        end,
        subMenus = {"genel:anahtarver", "genel:yarali", "genel:normal", "genel:anim"}
    },
    {
        id = "mekan",
        displayName = "Mekanlar",
        icon = "#fa-map-marked-alt",
        enableMenu = function()
            return not isDead
        end,
        subMenus = {"mekan:garaj","mekan:redjob","mekan:kiyafet","mekan:dovme","mekan:gazist","mekan:silah","mekan:bank", "mekan:kuafor","mekan:market", "mekan:tumblipler"}
    },
    {
        id = "aracislemleri",
        displayName = "Araç İşlemleri",
        icon = "#fa-car-side",
        functionName = "aracislemleri",
        enableMenu = function()
            return IsPedInAnyVehicle(PlayerPedId()) and not isDead
        end
    },
    {
        id = "copicibak",
        displayName = "Çöpün İçine Bak",
        icon = "#fa-dumpster",
        functionName = "copicibak",
        enableMenu = function()
            return checkNearGarbage() and not isDead
        end
    },
    {
        id = "otomatacc",
        displayName = "Otomat Aç",
        icon = "#fa-shopping-basket",
        functionName = "otomatac",
        enableMenu = function()
            return checkNearVend() and not isDead
        end
    },
    {
        id = "oyuncu",
        displayName = "Oyuncu İşlemleri",
        icon = "#fa-user-circle",
        enableMenu = function()
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId()) and ClosestPlayer(3) )
        end,
        subMenus = {"oyuncu:omuzla","oyuncu:kucakla","oyuncu:ktasi","oyuncu:kbindir","oyuncu:ybindir"}
    },
    -- {
    --     id = "ev",
    --     displayName = "Ev İşlemleri",
    --     icon = "#fa-house",
    --     enableMenu = function()
    --         return (not isDead and exports["qb-houses"]:evegirf3() )
    --     end,
    --     subMenus = {"ev:dekor", "ev:gardolap", "ev:stash", "ev:anahtarsil"}
    -- },
    {
        id = "ems",
        displayName = "EMS İşlemleri",
        icon = "#fa-star-of-life",
        enableMenu = function()
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId()) and job == "ambulance" and onDuty)
        end,
        subMenus = {"ems:iyilestir","ems:igne","ems:tsandalye","mekanik:fatura"}
    },
    {
        id = "ifatura",
        displayName = "Fatura Kes",
        icon = "#fa-file-invoice-dollar",
        functionName = "fatura",
        enableMenu = function()
            return not isDead and job == "burger" or job == "hotdog"
        end
    },
    {
        id = "inaktifems",
        displayName = "EMS İşlemleri",
        icon = "#fa-star-of-life",
        enableMenu = function()
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId()) and job == "ambulance" and not onDuty)
        end,
        subMenus = {"ems:iyilestir","ems:igne"}
    },
    {
        id = "mekanik",
        displayName = "Mekanik İşlemleri",
        icon = "#fa-wrench",
        enableMenu = function()
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId()) and (job == "mechanic_bennys" or job == "mechanic_lscustom5" or job == "mechanic_wrench" or job == "mechanic_illegal" or  job == "mechanic_otto" or job == "mechanic_lscustom" or job == "mechanic_lscustom2"))
        end,
        subMenus = {"mekanik:tamir","mekanik:tamir2","mekanik:temizle","mekanik:yukleyici","mekanik:fatura","polisarac:aracicek",}
    },
    {
        id = "polis",
        displayName = "Polis İşlemleri",
        icon = "#fa-user",
        enableMenu = function()
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId()) and job == "police" )
        end,
        subMenus = {"polis:hapiscikar", "polis:cezakes", "polis:kamu", "polis:hapisat", "polis:cezalarinabak", "polis:lisanskontrol", "polis:obje"}
    },
    {
        id = "doj",
        displayName = "Savcılık İşlemleri",
        icon = "#fa-user",
        enableMenu = function()
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId()) and job == "doj" )
        end,
        subMenus = {"polis:kimlik","polis:rozet","polis:hapiscikar", "polis:cezakes", "polis:kamu", "polis:hapisat", "polis:cezalarinabak", "polis:iyilestirPolis", "polis:lisanskontrol", "polis:obje"}
    },
    {
        id = "tem",
        displayName = "Tem İşlemleri",
        icon = "#fa-user",
        enableMenu = function()
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId()) and job == "tem" )
        end,
        subMenus = {"polis:kimlik","polis:rozet","polis:hapiscikar", "polis:cezakes", "polis:kamu", "polis:hapisat", "polis:cezalarinabak", "polis:iyilestirPolis", "polis:lisanskontrol", "polis:obje"}
    },
    {
        id = "polisarac",
        displayName = "Polis Araç İşlemleri",
        icon = "#fa-taxi",
        enableMenu = function()
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId()) and ClosestVehicle(3) and job == "police" )
        end,
        subMenus = {"polisarac:imodifiye", "polisarac:tunner", "polisarac:aracicek", "polisarac:aracicekfull", "polisarac:neonsok", "polisarac:plakabak", "polisarac:kilitac", "polis:plaka"}
    },
    {
        id = "olu",
        displayName = "EMS Bildirim Gönder",
        icon = "#fa-satellite-dish",
        functionName = "emsbildirim",
        enableMenu = function()
            return isDead
        end
    },
    {
        id = "olu2",
        displayName = "Polise Bildirim Gönder",
        icon = "#fa-satellite-dish",
        functionName = "polisbildirim",
        enableMenu = function()
            return isDead
        end
    },
    {
        id = "yatak1",
        displayName = "Sırt Üstü Uzan",
        icon = "#fa-bed",
        functionName = "yatak1",
        enableMenu = function()
            return prop and yatak and not isDead
        end
    },
    {
        id = "yatak2",
        displayName = "Yüz Üstü Uzan",
        icon = "#fa-bed",
        functionName = "yatak2",
        enableMenu = function()
            return prop and yatak and not isDead
        end
    },
    {
        id = "yatak3",
        displayName = "Yatağa Otur",
        icon = "#fa-bed",
        functionName = "yatak3",
        enableMenu = function()
            return prop and yatak and not isDead
        end
    },
    {
        id = "koltuk",
        displayName = "Sandalyeye Otur",
        icon = "#fa-chair",
        functionName = "koltuk",
        enableMenu = function()
            return prop and not yatak and not isDead
        end
    },
    {
        id = "garaj",
        displayName = "Garaj",
        icon = "#fa-warehouse",
        functionName = "garajOpen",
        enableMenu = function()
            return not IsPedInAnyVehicle(PlayerPedId()) and exports["gr-garaj"]:checkgarage() and not isDead
        end
    },
    {
        id = "garaj-park",
        displayName = "Park Et",
        icon = "#fa-parking",
        functionName = "garajOpen",
        enableMenu = function()
            return IsPedInAnyVehicle(PlayerPedId()) and exports["gr-garaj"]:checkgarage() and not isDead
        end
    },
    {
        id = "giysi-dukkan",
        displayName = "Kıyafet Dukkanı",
        icon = "#fa-socks",
        functionName = "clotheOpen",
        enableMenu = function()
            local data = exports["qb-clothing"]:checkclothe()
            local clot, ber = data[1], data[2]
            return not IsPedInAnyVehicle(PlayerPedId()) and clot and not isDead
        end
    },
    {
        id = "berber-dukkan",
        displayName = "Berber Dukkanı",
        icon = "#fa-cut",
        functionName = "clotheOpen",
        enableMenu = function()
            local data = exports["qb-clothing"]:checkclothe()
            local clot, ber = data[1], data[2]
            return not IsPedInAnyVehicle(PlayerPedId()) and ber and not isDead
        end
    },
    {
        id = "direk-dansi",
        displayName = "Direk Dansı",
        icon = "#fa-disease",
        functionName = "poleDance",
        enableMenu = function()
            return exports["qy-dans"]:nightClubPole() and not isDead
        end
    },
}

newSubMenus = {
    -- Polis Araç İşlemleri
    ['polisarac:imodifiye'] = {
        title = "İllegal Modifiye Araştır",
        icon = "#fa-car-side",
        functionName = "imodifiye"
    },
    ['polisarac:tunner'] = {
        title = "Tuner Çipi Sök",
        icon = "#fa-microchip",
        functionName = "tunner"
    },
    ['polisarac:aracicek'] = {
        title = "Aracı Çek",
        icon = "#fa-car-crash",
        functionName = "aracicek"
    },
    ['polisarac:aracicekfull'] = {
        title = "Aracı Full Çek(FI)",
        icon = "#fa-car-crash",
        functionName = "aracicekfull"
    },
    ['polisarac:neonsok'] = {
        title = "Neon Sök",
        icon = "#fa-lightbulb",
        functionName = "neonsok"
    },
    ['polisarac:plakabak'] = {
        title = "Plaka Sorgula",
        icon = "#fa-vr-cardboard",
        functionName = "plakabak"
    },
    ['polisarac:kilitac'] = {
        title = "Kiliti Kır",
        icon = "#fa-plane",
        functionName = "kilitac"
    },

    -- Polis İşlemleri
    ['polis:rozet'] = {
        title = "Rozetini Göster",
        icon = "#fa-certificate",
        functionName = "polisrozet"
    },
    ['polis:kimlik'] = {
        title = "Polis Kimliğini Göster",
        icon = "#fa-id-badge",
        functionName = "poliskimlik"
    },
    ['polis:pilot'] = {
        title = "Uçuş Lisansı Ver",
        icon = "#fa-plane",
        functionName = "pilot"
    },
    ['polis:silah'] = {
        title = "Silah Taşıma L.Ver",
        icon = "#fa-fire-extinguisher",
        functionName = "silahduk"
    },
    ['polis:hapiscikar'] = {
        title = "Hapishaneden Çıkar",
        icon = "#fa-user-times",
        functionName = "hapiscikar"
    },
    ['polis:cezakes'] = {
        title = "Para Cezası Kes",
        icon = "#fa-money-bill-alt",
        functionName = "cezakes"
    },
    ['polis:kamu'] = {
        title = "Kamu Hizmeti Kes",
        icon = "#fa-broom",
        functionName = "kamu"
    },
    ['polis:hapisat'] = {
        title = "Hapishaneye At",
        icon = "#fa-user-lock",
        functionName = "hapisat"
    },
    ['polis:cezalarinabak'] = {
        title = "Ödenmemiş Cezalar",
        icon = "#fa-money-check",
        functionName = "cezalarinabak"
    },
    -- ['polis:iyilestirPolis'] = {
    --     title = "Yaralıyı İyileştir",
    --     icon = "#fa-first-aid",
    --     functionName = "iyilestirPolis"
    -- },
    ['polis:lisanskontrol'] = {
        title = "Lisansları Kontrol Et",
        icon = "#fa-digital-tachograph",
        functionName = "lisanskontrol"
    },
    ['polis:obje'] = {
        title = "Polis Objeleri",
        icon = "#fa-exclamation-triangle",
        functionName = "obje"
    },
    ['polis:plaka'] = {
        title = "Plaka Değiştir",
        icon = "#fa-address-card",
        functionName = "plakamenu"
    },

        -- Savcılık  İşlemleri

        ['doj:rozet'] = {
            title = "Rozetini Göster",
            icon = "#fa-certificate",
            functionName = "polisrozet"
        },
        ['doj:kimlik'] = {
            title = "Polis Kimliğini Göster",
            icon = "#fa-id-badge",
            functionName = "poliskimlik"
        },
        ['doj:pilot'] = {
            title = "Uçuş Lisansı Ver",
            icon = "#fa-plane",
            functionName = "pilot"
        },
        ['doj:silah'] = {
            title = "Silah Taşıma L.Ver",
            icon = "#fa-fire-extinguisher",
            functionName = "silahduk"
        },
        ['doj:hapiscikar'] = {
            title = "Hapishaneden Çıkar",
            icon = "#fa-user-times",
            functionName = "hapiscikar"
        },
        ['doj:cezakes'] = {
            title = "Para Cezası Kes",
            icon = "#fa-money-bill-alt",
            functionName = "cezakes"
        },
        ['doj:kamu'] = {
            title = "Kamu Hizmeti Kes",
            icon = "#fa-broom",
            functionName = "kamu"
        },
        ['doj:hapisat'] = {
            title = "Hapishaneye At",
            icon = "#fa-user-lock",
            functionName = "hapisat"
        },
        ['doj:cezalarinabak'] = {
            title = "Ödenmemiş Cezalar",
            icon = "#fa-money-check",
            functionName = "cezalarinabak"
        },
        ['doj:iyilestirPolis'] = {
            title = "Yaralıyı İyileştir",
            icon = "#fa-first-aid",
            functionName = "iyilestirPolis"
        },
        ['doj:lisanskontrol'] = {
            title = "Lisansları Kontrol Et",
            icon = "#fa-digital-tachograph",
            functionName = "lisanskontrol"
        },
        ['doj:obje'] = {
            title = "Polis Objeleri",
            icon = "#fa-exclamation-triangle",
            functionName = "obje"
        },
        ['doj:plaka'] = {
            title = "Plaka Değiştir",
            icon = "#fa-address-card",
            functionName = "plakamenu"
        },

    -- Tem İşlemleri
    ['tem:rozet'] = {
        title = "Rozetini Göster",
        icon = "#fa-certificate",
        functionName = "polisrozet"
    },
    ['tem:kimlik'] = {
        title = "Polis Kimliğini Göster",
        icon = "#fa-id-badge",
        functionName = "poliskimlik"
    },
    ['tem:pilot'] = {
        title = "Uçuş Lisansı Ver",
        icon = "#fa-plane",
        functionName = "pilot"
    },
    ['tem:silah'] = {
        title = "Silah Taşıma L.Ver",
        icon = "#fa-fire-extinguisher",
        functionName = "silahduk"
    },
    ['tem:hapiscikar'] = {
        title = "Hapishaneden Çıkar",
        icon = "#fa-user-times",
        functionName = "hapiscikar"
    },
    ['tem:cezakes'] = {
        title = "Para Cezası Kes",
        icon = "#fa-money-bill-alt",
        functionName = "cezakes"
    },
    ['tem:kamu'] = {
        title = "Kamu Hizmeti Kes",
        icon = "#fa-broom",
        functionName = "kamu"
    },
    ['tem:hapisat'] = {
        title = "Hapishaneye At",
        icon = "#fa-user-lock",
        functionName = "hapisat"
    },
    ['tem:cezalarinabak'] = {
        title = "Ödenmemiş Cezalar",
        icon = "#fa-money-check",
        functionName = "cezalarinabak"
    },
    ['tem:iyilestirPolis'] = {
        title = "Yaralıyı İyileştir",
        icon = "#fa-first-aid",
        functionName = "iyilestirPolis"
    },
    ['tem:lisanskontrol'] = {
        title = "Lisansları Kontrol Et",
        icon = "#fa-digital-tachograph",
        functionName = "lisanskontrol"
    },
    ['tem:obje'] = {
        title = "Polis Objeleri",
        icon = "#fa-exclamation-triangle",
        functionName = "obje"
    },
    ['tem:plaka'] = {
        title = "Plaka Değiştir",
        icon = "#fa-address-card",
        functionName = "plakamenu"
    },

    -- mekanik İşlemleri
    ['mekanik:fatura'] = {
        title = "Fatura Kes",
        icon = "#fa-file-invoice-dollar",
        functionName = "fatura"
    },
    ['mekanik:tamir'] = {
        title = "Aracı Tamir Et",
        icon = "#fa-tools",
        functionName = "tamir"
    },
    ['mekanik:tamir2'] = {
        title = "Aracı Krikoya Al",
        icon = "#fa-tools",
        functionName = "tamir2"
    },
    ['mekanik:temizle'] = {
        title = "Aracı Temizle",
        icon = "#fa-soap",
        functionName = "temizle"
    },
    ['mekanik:yukleyici'] = {
        title = "Çekiciye Bindir/İndir",
        icon = "#fa-truck-pickup",
        functionName = "yukleyici"
    },

    -- EMS İşlemleri
    ['ems:iyilestir'] = {
        title = "Yaralıyı İyileştir",
        icon = "#fa-first-aid",
        functionName = "iyilestir"
    },
    ['ems:igne'] = {
        title = "Uyuşturucu İğne",
        icon = "#fa-syringe",
        functionName = "igne"
    },
    ['ems:tsandalye'] = {
        title = "Tekerlekli Sandalye",
        icon = "#fa-wheelchair",
        functionName = "tsandalye"
    },
    
    -- Oyuncu İşlemleri
    ['oyuncu:kucakla'] = {
        title = "Kucakla/Bırak",
        icon = "#fa-people-carry",
        functionName = "kucakla"
    },
    ['oyuncu:omuzla'] = {
        title = "Omuzla/Bırak",
        icon = "#fa-people-carry",
        functionName = "omuzla"
    },
    ['oyuncu:rehinal'] = {
        title = "Rehin Al",
        icon = "#fa-users-slash",
        functionName = "rehinal"
    },
    ['oyuncu:ktasi'] = {
        title = "Kelepçeliyi Taşı/Bırak",
        icon = "#fa-people-carry",
        functionName = "ktasi"
    },
    ['oyuncu:kbindir'] = {
        title = "Kelepçeliyi Araca Bindir/İndir",
        icon = "#fa-crutch",
        functionName = "kbindir"
    },
    ['oyuncu:ybindir'] = {
        title = "Yaralıyı Araca Bindir/İndir",
        icon = "#fa-user-injured",
        functionName = "ybindir"
    },

    -- Ev İşlemleri
    ['ev:dekor'] = {
        title = "Evini Dekore Et",
        icon = "#fa-hammer",
        functionName = "evdekor"
    },
    ['ev:stash'] = {
        title = "Depo Yerleştir",
        icon = "#fa-box",
        functionName = "dolapkoy"
    },
    ['ev:gardolap'] = {
        title = "Gardolap Yerleştir",
        icon = "#fa-socks",
        functionName = "gardolapkoy"
    },
    ['ev:anahtarsil'] = {
        title = "Anahtarları Görüntüle",
        icon = "#fa-key",
        functionName = "anahtarsil"
    },

    --Araç Koltuk menu
    ['mekan:garaj'] = {
        title = "Garajlar",
        icon = "#fa-warehouse",
        functionName = "garaj"
    },
    ['mekan:redjob'] = {
        title = "Meslekler",
        icon = "#fa-globe",
        functionName = "redjob"
    },
    ['mekan:kiyafet'] = {
        title = "Kiyafet Dukkanları",
        icon = "#fa-tshirt",
        functionName = "kiyafet"
    },
    ['mekan:kuafor'] = {
        title = "Kuaförler",
        icon = "#fa-cut",
        functionName = "kuafor"
    },
    ['mekan:dovme'] = {
        title = "Dövme Dukkanları",
        icon = "#fa-pen-nib",
        functionName = "dovme"
    },
    ['mekan:gazist'] = {
        title = "Gaz İstasyonları",
        icon = "#fa-gas-pump",
        functionName = "gazist"
    },
    ['mekan:silah'] = {
        title = "Silah Dukkanları",
        icon = "#fa-fire-extinguisher",
        functionName = "silahduk"
    },
    ['mekan:bank'] = {
        title = "Bankalar",
        icon = "#fa-university",
        functionName = "bank"
    },
    ['mekan:market'] = {
        title = "Marketler",
        icon = "#fa-shopping-basket",
        functionName = "market"
    },
    ['mekan:tumblipler'] = {
        title = "Tüm Blipleri Aç",
        icon = "#fa-map",
        functionName = "tumblipler"
    },
    -- Kıyafet Menu
    ['kiyafet:sapka'] = {
        title = "Şapka Çıkar/Tak",
        icon = "#fa-hat-cowboy-side",
        functionName = "sapka"
    },
    ['kiyafet:gozluk'] = {
        title = "Gözlük Çıkar/Tak",
        icon = "#fa-glasses",
        functionName = "gozluk"
    },
    ['kiyafet:maske'] = {
        title = "Maske Çıkar/Tak",
        icon = "#fa-head-side-mask",
        functionName = "maske"
    },
    ['kiyafet:tisort'] = {
        title = "Tişörtü Çıkar/Giy",
        icon = "#fa-tshirt",
        functionName = "tisort"
    },
    ['kiyafet:pantalon'] = {
        title = "Pantolonu Çıkar/Giy",
        icon = "#fa-male",
        functionName = "pantalon"
    },
    ['kiyafet:canta'] = {
        title = "Çanta Çıkar/Tak",
        icon = "#fa-shopping-bag",
        functionName = "canta"
    },
    ['kiyafet:eldiven'] = {
        title = "Eldiveni Çıkar/Giy",
        icon = "#fa-mitten",
        functionName = "eldiven"
    },
    ['kiyafet:ayakkabi'] = {
        title = "Ayakkabıları Çıkar/Giy",
        icon = "#fa-shoe-prints",
        functionName = "ayakkabi"
    },
    
    -- Ehliyet Menüsü
    ['ehliyet:ehliyetbak'] = {
        title = "Ehliyet Bak",
        icon = "#fa-id-card",
        functionName = "ehliyetbak"
    },
    ['ehliyet:ehliyetver'] = {
        title = "Ehliyet Ver",
        icon = "#fa-id-card",
        functionName = "ehliyetver"
    },
    ['ehliyet:kimlik'] = {
        title = "Kimlik Bak",
        icon = "#fa-address-card",
        functionName = "kimlik"
    },
    ['ehliyet:kimlikver'] = {
        title = "Kimlik Ver",
        icon = "#fa-address-card",
        functionName = "kimlikver"
    },
    ['ehliyet:silahruhsat'] = {
        title = "Silah Ruhsatı Bak",
        icon = "#fa-file-contract",
        functionName = "silahruhsat"
    },
    ['ehliyet:silahruhsativer'] = {
        title = "Silah Ruhsatını Ver",
        icon = "#fa-file-contract",
        functionName = "silahruhsativer"
    },

    -- Genel
    ['genel:anahtarver'] = {
        title = "Arac Anahtarı Ver",
        icon = "#fa-key",
        functionName = "anahtarver"
    },
    ['genel:yarali'] = {
        title = "Yaralı",
        icon = "#fa-user-injured",
        functionName = "yarali"
    },
    ['genel:normal'] = {
        title = "Normal Yürüyüş",
        icon = "#fa-running",
        functionName = "normal"
    },
    ['genel:anim'] = {
        title = "Animasyonlar",
        icon = "#fa-play",
        functionName = "anim"
    },
  --[[   ["expressions:dumb"] = {
        title="Dumb",
        icon="#expressions-dumb",
        functionName = "expressions",
        functionParameters =  { "pose_injured_1" }
    }, ]]
}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    job = PlayerData.job.name
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(newJob)
    PlayerData.job = newJob
    job = PlayerData.job.name
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

AddEventHandler('gr:playerdead', function(dead)
    isDead = dead
end)

function ClosestVehicle(dist)
    local vehicle, distance = QBCore.Functions.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
    if distance <= dist then
        return true
    end
    return false
end

function ClosestPlayer(dist)
    local closestPlayer, distance = QBCore.Functions.GetClosestPlayer()
    if distance <= dist then
        return true
    end
    return false
end