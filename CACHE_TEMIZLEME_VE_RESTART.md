# 🔄 Cache Temizleme ve Sunucu Yeniden Başlatma

## ⚠️ ÖNEMLİ: Sunucu Production Modunda

Sunucunuz production modunda çalıştığı için `exec` komutu devre dışı. 
Bu yüzden değişiklikler cache'den eski dosyaları yüklüyor.

## 🛠️ Çözüm Adımları

### Adım 1: Sunucuyu Kapat
Sunucu konsolunda:
```
quit
```
veya CTRL+C ile durdurun.

### Adım 2: Cache'i Temizle

**Windows için:**
```bash
cd temelPaket/data
rmdir /s /q cache\files
mkdir cache\files
```

**veya PowerShell:**
```powershell
Remove-Item -Path "temelPaket/data/cache/files/*" -Recurse -Force
```

**Manuel olarak:**
1. `temelPaket/data/cache/files` klasörüne gidin
2. İçindeki TÜM klasörleri silin
3. `files` klasörünü boş bırakın

### Adım 3: Sunucuyu Başlat
Normal şekilde sunucuyu başlatın.

## ✅ Yapılan Değişiklikler

Aşağıdaki dosyalar düzeltildi ve cache temizlenince yüklenecek:

1. ✅ `ak4y-advancedFishing/config.lua` - Framework "qb" olarak ayarlandı
2. ✅ `radialmenu/config.lua` - Modern QBCore export
3. ✅ `radialmenu/fxmanifest.lua` - Dosya sırası düzeltildi
4. ✅ `radialmenu/server.lua` - Modern QBCore export
5. ✅ `qb-carwash/client/main.lua` - Eksik export yorum satırı
6. ✅ `tgiann-aracparcalama/client/main.lua` - Eksik export yorum satırı
7. ✅ `quadro_drift/drift.lua` - QBCore eklendi ve bildirim düzeltildi
8. ✅ `wais-hudv6/client/client.lua` - xSound güvenli kontrol

## 🔍 Kontrol

Sunucu başladıktan sonra bu hataların kaybolması gerekir:
- ❌ `attempt to index a nil value (global 'QBCore')` - ak4y-advancedFishing
- ❌ `attempt to index a nil value (global 'QBCore')` - radialmenu
- ❌ `No such export addNotif` - qb-carwash
- ❌ `No such export pedcreate` - tgiann-aracparcalama
- ❌ `No such export DoLongHudText` - quadro_drift
- ❌ `No such export Attached` - wais-hudv6

## ⚠️ Kalacak Hatalar (Normal)

Bu hatalar obfuscated kod nedeniyle kalacak ama sorun değil:
- ⚠️ wais-jobpack goto label hataları (6 adet)
- Kaynak çalışmaya devam edecek

## 🚀 Hızlı Komut Seti

Sunucu konsolunda sırayla:
```bash
# 1. Sunucuyu kapat
quit

# 2. Cache temizle (Windows CMD)
cd temelPaket/data
rmdir /s /q cache\files
mkdir cache\files

# 3. Sunucuyu başlat
# Normal başlatma komutunuzu kullanın
```

## 💡 Alternatif: Development Mode

Eğer test sunucusuysa, `server.cfg` dosyasına ekleyin:
```cfg
set sv_enforceGameBuild 3258
setr game_enableFlyThroughWindscreen false
# Development mode için:
# set sv_productionMode false
```

Sonra sunucuyu yeniden başlatın ve `exec restart_resources.cfg` çalışacak.

## 📋 Başarı Kontrolü

Sunucu başladıktan sonra logları kontrol edin:
- ✅ "Script initialization finished" görünmeli
- ✅ QBCore hataları kaybolmalı
- ✅ Export hataları kaybolmalı
- ⚠️ Sadece wais-jobpack goto hataları kalmalı

## 🎯 Sonraki Adımlar

Cache temizlendikten ve sunucu yeniden başlatıldıktan sonra:
1. Oyuna girin
2. F3 radial menüyü test edin
3. `/fishmenu` ile balık tutma menüsünü test edin
4. Numpad 9 ile drift modunu test edin
5. Araç içinde müzik sistemini test edin

## ❓ Sorun Devam Ederse

Eğer cache temizledikten sonra hala hatalar varsa:
1. Sunucunun tamamen kapandığından emin olun
2. `cache` klasörünün tamamen boş olduğunu kontrol edin
3. Dosya değişikliklerinin kaydedildiğini kontrol edin
4. Sunucu loglarını paylaşın
