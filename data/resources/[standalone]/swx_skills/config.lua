Config = {}

-- Skill tanımları
Config.Skills = {
    ["stamina"] = {
        label = "Dayanıklılık",
        icon = "fas fa-heartbeat",
        color = "#ff4757",
        maxLevel = 50,
        baseXP = 100,
        xpMultiplier = 1.2,
        statBonus = {
            type = "stamina",
            amountPerLevel = 0.5 -- Her levelda +0.5 stamina
        }
    },
    ["driving"] = {
        label = "Sürüş",
        icon = "fas fa-car",
        color = "#2ed573",
        maxLevel = 50,
        baseXP = 100,
        xpMultiplier = 1.2,
        statBonus = {
            type = "driving_skill",
            amountPerLevel = 1.0 -- Her levelda +1.0 sürüş becerisi
        }
    },
    ["strength"] = {
        label = "Güç",
        icon = "fas fa-dumbbell",
        color = "#ffa502",
        maxLevel = 50,
        baseXP = 100,
        xpMultiplier = 1.2,
        statBonus = {
            type = "strength",
            amountPerLevel = 0.5 -- Her levelda +0.5 güç
        }
    },
    ["shooting"] = {
        label = "Nişancılık",
        icon = "fas fa-crosshairs",
        color = "#5352ed",
        maxLevel = 50,
        baseXP = 100,
        xpMultiplier = 1.2,
        statBonus = {
            type = "shooting_accuracy",
            amountPerLevel = 0.8 -- Her levelda +0.8 nişan
        }
    },
    ["luck"] = {
        label = "Şans",
        icon = "fas fa-clover",
        color = "#a55eea",
        maxLevel = 50,
        baseXP = 100,
        xpMultiplier = 1.2,
        statBonus = {
            type = "luck",
            amountPerLevel = 0.3 -- Her levelda +0.3 şans
        }
    },
    ["fishing"] = {
        label = "Balıkçılık",
        icon = "fas fa-fish",
        color = "#0fb9b1",
        maxLevel = 50,
        baseXP = 100,
        xpMultiplier = 1.2,
        statBonus = {
            type = "fishing_skill",
            amountPerLevel = 1.0 -- Her levelda +1.0 balıkçılık
        }
    }
}

-- XP kazanma etkinlikleri
Config.XPActivities = {
    ["stamina"] = {
        running = 1, -- Koşarken saniyede kazanılan XP
        swimming = 2,
        fighting = 3
    },
    ["driving"] = {
        driving = 0.5, -- Sürerken saniyede kazanılan XP
        drifting = 2,
        racing = 3
    },
    ["strength"] = {
        lifting = 2,
        fighting = 3,
        carrying = 1
    },
    ["shooting"] = {
        target_hit = 5, -- Hedefe isabet ettiğinde
        kill = 10, -- Öldürdüğünde
        headshot = 15
    },
    ["luck"] = {
        gambling_win = 10,
        rare_find = 5
    },
    ["fishing"] = {
        fish_caught = 5,
        rare_fish = 15
    }
}

-- Skill bar görünürlük ayarları
Config.ShowSkillBarDuration = 5000 -- Level atlayınca 5 saniye göster
Config.ShowSkillBarOnXP = false -- XP kazanınca göster (sadece level atlayınca göstermek için false)

-- XP biriktirme sistemi (bar güncellemesi için)
Config.XPThreshold = 10 -- Her 10 XP'de bir bar güncelle (0.5 XP yerine 10 XP biriktirince göster)

