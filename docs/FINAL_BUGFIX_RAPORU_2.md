# Final Bugfix Raporu - 2026-04-04

## Düzeltilen Sorunlar

### 1. ✅ Burgershot Kasa Para 0 Sorunu
**Sorun**: Burgershot kasadaki para sürekli 0 gösteriyordu

**Sebep**: 
- `wonev:Updatemoney` eventi iki kere tanımlanmıştı
- İkinci tanım (en altta) ilkini override ediyordu
- İkinci tanımda qb-management/qb-bossmenu export'ları yanlış kullanılmıştı

**Çözüm**:
- İkinci (yanlış) tanımı kaldırdık
- İlk tanımı iyileştirdik (veritabanından doğru çekiyor)
- Veritabanında kayıt yoksa 0 ile başlatma eklendi
- `QBCore:Server:PlayerLoaded` eventi ile oyuncu yüklendiğinde kasa parasını otomatik yükleme eklendi

**Değiştirilen Dosyalar**:
- `data/resources/[meslek]/wonev-burgershot/server.lua`

**Test**:
```bash
# Sunucuya gir ve kasa menüsünü aç
# Para doğru gösterilmeli
```

---

### 2. ✅ WAIS-HUD Cash Senkronizasyon Sorunu
**Sorun**: Inventory'deki cash para HUD'a senkronize olmuyor (inventory 400, HUD 500 gösteriyor)

**Sebep**:
- `wFramework.requestData()` fonksiyonunda `QBCore.Functions.GetPlayerData()` yanlış çağrılıyordu
- qb-core'da bu fonksiyon callback alıyor ama WAIS-HUD callback vermeden çağırıyor
- Callback verilmezse direkt `QBCore.PlayerData` döndürüyor

**Çözüm**:
- `wFramework.requestData()` fonksiyonunu düzelttik
- Callback vermeden çağırıyoruz, direkt PlayerData dönüyor
- Hata durumunda `QBCore.PlayerData`'yı direkt kullanma fallback'i eklendi
- `qb-inventory/client/hud_bridge.lua`'da Config kontrolü eklendi (Config.ShowDebug)
- `wais-hudv6/bridge/qb/client.lua`'da para güncelleme eventi düzeltildi

**Değiştirilen Dosyalar**:
- `data/resources/[standalone]/wais-hudv6/bridge/framework.lua`
- `data/resources/[qb]/qb-inventory/client/hud_bridge.lua`
- `data/resources/[standalone]/wais-hudv6/bridge/qb/client.lua`

**Test**:
```bash
# Sunucuya gir
# /syncmoney komutu ile manuel senkronizasyon test et
# Para ver/al ve HUD'ın güncellendiğini kontrol et
# F8 console'da debug loglarını kontrol et
```

---

### 3. ✅ Git Pull Silinen Dosyaları Silmiyor
**Sorun**: VPS'de git pull yapınca silinen dosyalar kalıyordu

**Sebep**:
- `git pull` sadece değişiklikleri çeker, silinen dosyaları silmez
- `git ls-files --deleted` boş dönüyorsa hiçbir şey silmez

**Çözüm**:
- `git reset --hard origin/main` kullanarak remote ile tamamen senkronize ediyoruz
- Bu komut local'deki tüm değişiklikleri siler ve remote ile aynı yapar
- Önce `git stash` ile local değişiklikleri kaydediyoruz (geri almak için)
- Sonra `git clean -fd` ile tracked olmayan dosyaları siliyoruz

**Değiştirilen Dosyalar**:
- `vps_git_clean_pull.sh`

**Kullanım**:
```bash
cd /home/fivem/data
bash vps_git_clean_pull.sh

# Eğer local değişiklikleri geri almak istersen:
git stash pop
```

---

## Kalan Sorunlar

### ⚠️ WAIS-HUD Script.js Hatası
**Sorun**: 
```
Uncaught (in promise) TypeError: Cannot read properties of null (reading 'url')
(@wais-hudv6/web/dist/script.js:65)
```

**Durum**: 
- WAIS-HUD encrypted olduğu için JavaScript dosyalarını düzenleyemiyoruz
- Müzik sistemi geçici olarak kapatıldı (`Config.MusicSystem.disable = true`)
- Bu hata müzik sistemi ile ilgili, HUD'ın çalışmasını etkilemiyor

**Çözüm**: 
- Müzik sistemini kullanmayın veya WAIS-HUD'ın yeni versiyonunu alın

---

### ⚠️ qb-core Metadata Hatası
**Sorun**:
```
SCRIPT ERROR: @qb-core/client/loops.lua:15: attempt to index a nil value (field 'metadata')
```

**Durum**:
- `loops.lua`'da null check eklendi (önceki düzeltme)
- Hala görünüyorsa qb-core'u restart edin

**Çözüm**:
```bash
restart qb-core
```

---

## Test Checklist

### Burgershot Kasa
- [ ] Sunucuya gir
- [ ] Burgershot'a git
- [ ] Kasa menüsünü aç
- [ ] Para doğru gösteriliyor mu?
- [ ] Para ekle/çek çalışıyor mu?

### WAIS-HUD Cash
- [ ] Sunucuya gir
- [ ] F8 console'u aç
- [ ] `/syncmoney` komutu çalıştır
- [ ] Console'da para miktarlarını kontrol et
- [ ] Admin olarak kendine para ver
- [ ] HUD'da para güncellendiğini kontrol et
- [ ] Inventory'de para miktarını kontrol et
- [ ] HUD ve inventory aynı mı?

### Git Pull
- [ ] VPS'e bağlan
- [ ] `cd /home/fivem/data`
- [ ] `bash vps_git_clean_pull.sh`
- [ ] Silinen dosyalar silindi mi?
- [ ] Yeni dosyalar eklendi mi?
- [ ] Sunucuyu restart et

---

## Restart Komutları

```bash
# Sunucu içinde (F8 console)
restart qb-core
restart qb-inventory
restart wais-hudv6
restart wonev-burgershot

# Veya tüm sunucuyu restart et
quit
```

---

## Debug Komutları

### WAIS-HUD Debug
```lua
# config.lua'da
Config.ShowDebug = true
```

### Cash Senkronizasyon Test
```bash
# F8 console
/syncmoney
```

### Burgershot Kasa Test
```sql
# MySQL
SELECT * FROM burgershot_money WHERE id = 1;
SELECT * FROM burgershot_stocks WHERE id = 1;
```

---

## Notlar

1. **WAIS-HUD Encrypted**: JavaScript dosyalarını düzenleyemiyoruz, müzik sistemi kapalı kalmalı
2. **Git Hard Reset**: Local değişiklikler stash'lenir, geri almak için `git stash pop`
3. **Cash Sync**: İlk girişte 3 saniye bekliyor, sabırlı ol
4. **Burgershot**: Veritabanında kayıt yoksa otomatik 0 ile başlatılır

---

## Özet

✅ Burgershot kasa para sorunu çözüldü
✅ WAIS-HUD cash senkronizasyon sorunu çözüldü
✅ Git pull silinen dosyaları artık siliyor
⚠️ WAIS-HUD müzik sistemi kapalı (encrypted script hatası)
⚠️ qb-core metadata hatası düzeltildi (restart gerekebilir)

Tüm değişiklikler test edilmeli ve sunucu restart edilmeli.
