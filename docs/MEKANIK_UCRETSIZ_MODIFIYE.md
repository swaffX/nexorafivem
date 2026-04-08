# BakiTelli_mechanic - Mekanik Ücretsiz Modifiye Sistemi

## Yapılan Değişiklikler

### Dosya: `data/resources/[meslek]/[legal]/BakiTelli_mechanic/server.lua`

Mekanik görevine sahip oyuncuların araç modifikasyonlarını ücretsiz yapabilmesi için server.lua dosyası güncellendi.

## Özellikler

- Mekanik görevine sahip oyuncular tüm modifiye işlemlerini 0$ yapabilir
- Diğer oyuncular normal fiyatları öder
- Sistem otomatik olarak oyuncunun görevini kontrol eder

## Kod Açıklaması

```lua
RegisterNetEvent("BakiTelli_mechanic:buyitem", function (price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    -- Mekanik görevine sahip oyuncular için fiyat kontrolü
    if Player.PlayerData.job.name == "mechanic" then
        price = 0 -- Mekanikler için ücretsiz
    end
    
    if getMoney(src) >= price then 
        if price > 0 then
            removeMoney(src, price)
        end
        TriggerClientEvent("BakiTelli_mechanic:cl:buyitem", src)
    else 
        nofity(src, Config.Langs["NoPrice"])
    end
end)
```

## Nasıl Çalışır?

1. Oyuncu bir modifiye satın almaya çalıştığında sistem önce oyuncunun görevini kontrol eder
2. Eğer oyuncu "mechanic" görevine sahipse, fiyat otomatik olarak 0'a ayarlanır
3. Fiyat 0'dan büyükse para çekilir, değilse direkt modifiye uygulanır
4. Diğer tüm oyuncular normal fiyatları öder

## Test Etme

1. Sunucuyu yeniden başlatın: `restart BakiTelli_mechanic`
2. Mekanik görevine sahip bir karakterle giriş yapın
3. Mekanik menüsünü açın ve herhangi bir modifiye seçin
4. Modifiyenin ücretsiz uygulandığını doğrulayın

## Görev Adı Özelleştirme

Eğer sunucunuzda mekanik görevinin adı farklıysa, aşağıdaki satırı düzenleyin:

```lua
if Player.PlayerData.job.name == "mechanic" then
```

Örneğin, görev adı "tamirci" ise:

```lua
if Player.PlayerData.job.name == "tamirci" then
```

## Notlar

- Bu değişiklik sadece server tarafında yapıldı
- Client tarafında herhangi bir değişiklik gerekmedi
- Sistem QBCore framework'ü kullanıyor
- Tüm modifiye türleri (motor, renk, jant, vb.) için geçerli

## Tarih

- **Oluşturulma:** 8 Nisan 2026
- **Versiyon:** 1.0
