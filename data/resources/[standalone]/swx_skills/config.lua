Config = {}

-- ─────────────────────────────────────────────
--  Skill tanımları  (sadece Dayanıklılık & Sürüş)
-- ─────────────────────────────────────────────
Config.Skills = {
    ["stamina"] = {
        label       = "Dayanıklılık",
        color       = "#e84393",   -- canlı pembe-kırmızı
        maxLevel    = 50,
        -- Seviye başına gereken XP = baseXP * level
        -- Örnek: Lv1→2: 7,222 | Lv5→6: 36,110 | Lv9→10: 65,000 | Lv20→21: 144,440 | Lv50: 361,110
        baseXP      = 7222,
        xpMultiplier = 1.0,
        statBonus   = {
            type           = "stamina",
            amountPerLevel = 2.0   -- Her levelda +2 stamina
        }
    },
    ["driving"] = {
        label       = "Sürüş",
        color       = "#00d2ff",   -- açık mavi
        maxLevel    = 50,
        baseXP      = 7222,
        xpMultiplier = 1.0,
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
        running   = 1,   -- normal koşu (azaltıldı)
        sprinting = 2,   -- sprint (yüksek hız) (azaltıldı)
        swimming  = 2,   -- yüzme (azaltıldı)
        cycling   = 1,   -- bisiklet (azaltıldı)
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
Config.XPThreshold          = 100    -- Kaç XP biriktirince bar güncellensin (artırıldı)

