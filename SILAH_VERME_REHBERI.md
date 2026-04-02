# 🔫 FiveM QBCore - Silah Verme Rehberi

## Yöntem 1: Admin Menü (En Kolay) ✅

### Adım 1: Admin Yetkisi Kontrolü
`server.cfg` dosyanızda admin yetkiniz olduğundan emin olun:
```lua
add_principal identifier.fivem:5804329 group.admin
```

### Adım 2: Oyunda Admin Menüyü Açın
- Oyuna girin
- `/admin` komutunu yazın veya F10 tuşuna basın
- "Give Weapons" veya "Silah Ver" seçeneğine tıklayın
- "Combat Pistol" seçin

## Yöntem 2: Sunucu Konsolu Komutu ⚡

Sunucu konsolunda (veya oyunda admin iseniz):
```
giveitem [PLAYER_ID] weapon_combatpistol 1
```

Örnek:
```
giveitem 1 weapon_combatpistol 1
```

## Yöntem 3: Oyun İçi Komut (Admin Gerekli) 💻

Oyunda chat'e yazın:
```
/giveitem [PLAYER_ID] weapon_combatpistol 1
```

Kendinize vermek için kendi ID'nizi kullanın:
```
/giveitem 1 weapon_combatpistol 1
```

## Yöntem 4: SQL Database (Kalıcı) 💾

Database'e direkt eklemek için:
```sql
INSERT INTO player_items (citizenid, name, amount, info, type, slot) 
VALUES ('ABC12345', 'weapon_combatpistol', 1, '{}', 'item', 1);
```

## Yöntem 5: Developer Modu (Test İçin) 🔧

`qb-core/config.lua` dosyasında:
```lua
QBConfig.Server.TestItems = true
```

Sonra oyunda:
```
/testitem weapon_combatpistol
```

## 🎯 Popüler Silahlar ve İsimleri

### Tabancalar (Pistols)
```
weapon_combatpistol      - Combat Pistol (En popüler)
weapon_pistol            - Walther P99
weapon_pistol_mk2        - Pistol Mk II
weapon_appistol          - AP Pistol (Otomatik)
weapon_pistol50          - Desert Eagle
weapon_snspistol         - SNS Pistol
weapon_heavypistol       - Heavy Pistol
weapon_vintagepistol     - Vintage Pistol
```

### Tüfekler (Rifles)
```
weapon_assaultrifle      - AK-47
weapon_carbinerifle      - M4A1
weapon_advancedrifle     - Advanced Rifle
weapon_specialcarbine    - Special Carbine
```

### SMG'ler
```
weapon_microsmg          - Micro SMG
weapon_smg               - SMG
weapon_assaultsmg        - Assault SMG
weapon_combatpdw         - Combat PDW
```

### Pompalı Tüfekler (Shotguns)
```
weapon_pumpshotgun       - Pump Shotgun
weapon_sawnoffshotgun    - Sawed-Off Shotgun
weapon_assaultshotgun    - Assault Shotgun
```

## 🔋 Mermi Verme

Combat Pistol için mermi:
```
/giveitem [PLAYER_ID] pistol_ammo 100
```

## ⚠️ Önemli Notlar

1. **Admin Yetkisi:** Silah vermek için admin yetkisi gerekir
2. **Item İsmi:** Silah ismi MUTLAKA küçük harf olmalı: `weapon_combatpistol`
3. **Unique Item:** Silahlar unique item'dır, aynı anda sadece 1 tane taşınabilir
4. **Mermi:** Silahla birlikte mermi vermeyi unutmayın
5. **Inventory Slot:** Envanterinizde boş slot olmalı

## 🎮 Hızlı Başlangıç Paketi

Kendinize temel silah paketi vermek için sunucu konsolunda:
```
giveitem 1 weapon_combatpistol 1
giveitem 1 pistol_ammo 250
giveitem 1 weapon_nightstick 1
giveitem 1 weapon_flashlight 1
```

## 🔍 Player ID Bulma

Kendi ID'nizi bulmak için oyunda:
```
/id
```

veya sunucu konsolunda:
```
status
```

## 📝 Örnek Senaryo

**Senaryo:** Kendinize Combat Pistol ve mermi vermek istiyorsunuz.

1. Oyuna girin
2. `/id` yazarak ID'nizi öğrenin (örn: 1)
3. Sunucu konsoluna gidin
4. Şunu yazın:
   ```
   giveitem 1 weapon_combatpistol 1
   giveitem 1 pistol_ammo 100
   ```
5. Oyunda `I` tuşuna basıp envanterinizi kontrol edin
6. Silahı kullanmak için üzerine tıklayın

## 🛠️ Sorun Giderme

**Silah gelmiyor:**
- Admin yetkinizi kontrol edin
- Item ismini kontrol edin (küçük harf)
- Envanterinizde boş slot olduğundan emin olun
- Sunucu loglarını kontrol edin

**Silah çalışmıyor:**
- Mermi verdiğinizden emin olun
- qb-weapons kaynağının çalıştığını kontrol edin
- Silahı envanterde kullanılabilir yapın

## 💡 İpuçları

- Test için önce `weapon_pistol` deneyin (en basit)
- Mermi türünü doğru verin (`pistol_ammo` tabancalar için)
- Silah attachmentları için ayrı itemler gerekir
- Illegal silahlar için polis lisansı gerekebilir
