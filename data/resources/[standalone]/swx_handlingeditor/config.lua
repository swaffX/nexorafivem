Config = {}

-- Admin yetkisi (qb-core grup veya ACE permission)
Config.AdminGroups = { ['admin'] = true, ['god'] = true, ['mod'] = true }
Config.AcePermission = 'command.handling'

-- Handling kayıt yöntemi: 'json' (dosya) veya 'mysql' (veritabanı)
Config.Storage = 'json'

-- Dosya kayıt yolu (json için)
Config.JsonPath = 'handling_data.json'

-- Araç spawn olduğunda otomatik uygula
Config.AutoApply = true

-- Her 30 saniyede handling kontrolü
Config.CheckInterval = 30000

-- Varsayılan handling değerleri (yeni araçlar için şablon)
Config.DefaultHandling = {
    fMass = 1500.0,
    fInitialDragCoeff = 8.0,
    fPercentSubmerged = 85.0,
    fDriveBiasFront = 0.0,
    nInitialDriveGears = 6,
    fInitialDriveForce = 0.35,
    fDriveInertia = 1.0,
    fClutchChangeRateScaleUpShift = 2.0,
    fClutchChangeRateScaleDownShift = 2.0,
    fInitialDriveMaxFlatVel = 150.0,
    fBrakeForce = 1.0,
    fBrakeBiasFront = 0.5,
    fHandBrakeForce = 0.5,
    fSteeringLock = 35.0,
    fTractionCurveMax = 2.0,
    fTractionCurveMin = 1.8,
    fTractionCurveLateral = 19.0,
    fTractionSpringDeltaMax = 0.15,
    fLowSpeedTractionLossMult = 0.0,
    fCamberStiffnesss = 0.0,
    fTractionBiasFront = 0.5,
    fTractionLossMult = 1.0,
    fSuspensionForce = 2.5,
    fSuspensionCompDamp = 1.5,
    fSuspensionReboundDamp = 1.5,
    fSuspensionUpperLimit = 0.15,
    fSuspensionLowerLimit = -0.15,
    fSuspensionRaise = 0.0,
    fSuspensionBiasFront = 0.5,
    fAntiRollBarForce = 0.5,
    fAntiRollBarBiasFront = 0.5,
    fRollCentreHeightFront = 0.4,
    fRollCentreHeightRear = 0.4,
    fCollisionDamageMult = 1.0,
    fWeaponDamageMult = 1.0,
    fDeformationDamageMult = 0.8,
    fEngineDamageMult = 1.5,
}

-- Komut isimleri
Config.Commands = {
    editor = 'swxhandling',        -- Ana menü
    save = 'savehandling',         -- Kaydet
    reset = 'resethandling',       -- Sıfırla
    list = 'swxhandlinglist'       -- Listele
}

-- Menü başlığı
Config.MenuTitle = '🔧 Araç Handling Editörü'
