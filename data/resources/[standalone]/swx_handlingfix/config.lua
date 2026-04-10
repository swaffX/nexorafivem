Config = {}

-- Zorla uygulanacak araç handlingleri
Config.ForcedHandling = {
    ['redeye'] = {
        fInitialDriveMaxFlatVel = 250.0,
        fInitialDriveForce = 0.52,
        fTractionCurveMax = 3.6,
        fTractionCurveMin = 3.3,
        fBrakeForce = 1.1,
        fInitialDragCoeff = 4.5,
    },
    ['redeye3'] = {
        fInitialDriveMaxFlatVel = 250.0,
        fInitialDriveForce = 0.52,
        fTractionCurveMax = 3.6,
        fTractionCurveMin = 3.3,
        fBrakeForce = 1.1,
        fInitialDragCoeff = 4.5,
    }
}

-- Her araç spawn olduğunda uygula
Config.ApplyOnSpawn = true

-- Her 30 saniyede bir kontrol et (cache için)
Config.CheckInterval = 30000
