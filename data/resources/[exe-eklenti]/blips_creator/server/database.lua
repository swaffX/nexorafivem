function setupDatabase(cb)
    local resName = GetCurrentResourceName()

    if(resName ~= "blips_creator") then
        print("It would be appreciated using ^blips_creator^7 as name of the resource")
    end

    -- Execute SQL directly - split into two queries
    local createTableSql = [[
        CREATE TABLE IF NOT EXISTS `global_blips` (
            `id` INT(11) NOT NULL AUTO_INCREMENT,
            `name` VARCHAR(50) NOT NULL DEFAULT 'blip' COLLATE 'utf8mb4_general_ci',
            `x` FLOAT(12) NOT NULL DEFAULT '0',
            `y` FLOAT(12) NOT NULL DEFAULT '0',
            `z` FLOAT(12) NOT NULL DEFAULT '0',
            `streetName` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
            `sprite` SMALLINT(6) NOT NULL DEFAULT '0',
            `scale` FLOAT(12) NOT NULL DEFAULT '0',
            `alpha` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0',
            `color` SMALLINT(6) NOT NULL DEFAULT '0',
            `ticked` BIT(1) NOT NULL DEFAULT b'0',
            `outline` BIT(1) NOT NULL DEFAULT b'0',
            `display` TINYINT(3) NOT NULL DEFAULT '0',
            `identifier` VARCHAR(80) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
            PRIMARY KEY (`id`) USING BTREE
        )
    ]]

    local alterTableSql = [[
        ALTER TABLE global_blips ADD COLUMN IF NOT EXISTS identifier VARCHAR(80) DEFAULT NULL
    ]]

    MySQL.Async.execute(createTableSql, {}, function(affectedRows)
        MySQL.Async.execute(alterTableSql, {}, function(affectedRows)
            print("[" .. GetCurrentResourceName() .. "] Database ready (SQL executed)")
            cb()
        end, function(err, query, params)
            print("[" .. GetCurrentResourceName() .. "] Database setup failed: " .. tostring(err))
            cb()
        end)
    end, function(err, query, params)
        print("[" .. GetCurrentResourceName() .. "] Database setup failed: " .. tostring(err))
        cb()
    end)
end