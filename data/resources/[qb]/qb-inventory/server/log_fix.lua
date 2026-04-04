-- qb-inventory Log Fix
-- qb-log yoksa basit log sistemi

-- Basit log fonksiyonu
local function SimpleLog(logType, message, data)
    print(string.format('[QB-Inventory Log] %s: %s', logType, message))
    if data then
        print(json.encode(data, {indent = true}))
    end
end

-- qb-log export'u yoksa basit log kullan
if GetResourceState('qb-log') ~= 'started' then
    print('[QB-Inventory] qb-log bulunamadı, basit log sistemi kullanılıyor')
    
    -- Export oluştur (diğer scriptler için)
    exports('CreateLog', function(logType, title, color, message, tagEveryone)
        SimpleLog(logType, message, {title = title, color = color})
    end)
else
    print('[QB-Inventory] qb-log bulundu, normal log sistemi kullanılıyor')
end
