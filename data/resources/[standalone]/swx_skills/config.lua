Config = {}

-- ─────────────────────────────────────────────
--  Skill tanımları  (sadece Dayanıklılık & Sürüş)
-- ─────────────────────────────────────────────
Config.Skills = {
    ["stamina"] = {
        label       = "Dayanıklılık",
        color       = "#e84393",   -- canlı pembe-kırmızı
        maxLevel    = 50,
        -- Seviye başına gereken XP = baseXP * xpMultiplier^(level-1)
        -- Örnek: Lv1→2: 500 | Lv5→6: ~1.000 | Lv10→11: ~2.000 | Lv20→21: ~8.000 | Lv50: ~1M
        baseXP      = 500,
        xpMultiplier = 1.15,
        statBonus   = {
            type           = "stamina",
            amountPerLevel = 2.0   -- Her levelda +2 stamina
        }
    },
    ["driving"] = {
        label       = "Sürüş",
        color       = "#00d2ff",   -- açık mavi
        maxLevel    = 50,
        baseXP      = 500,
        xpMultiplier = 1.15,
        statBonus   = {
            type           = "driving_skill",
            amountPerLevel = 2.0   -- Her levelda +2 sürüş becerisi
        }
    },
}

-- ─────────────────────────────────────────────
--  XP Kazanma Etkinlikleri  (saniyede kazanılan XP)
-- ─────────────────────────────────────────────
Config.XPActivities = {
    ["stamina"] = {
        running   = 3,   -- normal koşu
        sprinting = 5,   -- sprint (yüksek hız)
        swimming  = 4,   -- yüzme
        cycling   = 2,   -- bisiklet
    },
    ["driving"] = {
        cruising  = 2,   -- 50-100 km/h
        fast      = 4,   -- 100-150 km/h
        racing    = 7,   -- 150+ km/h
    },
}

-- ─────────────────────────────────────────────
--  Ayarlar
-- ─────────────────────────────────────────────
Config.ShowSkillBarDuration = 5000   -- Level atlayınca kaç ms görünsün
Config.XPThreshold          = 30     -- Kaç XP biriktirince bar güncellensin

