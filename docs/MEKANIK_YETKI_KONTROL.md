# Mekanik Script Yetki Sorunu Çözümü

## 🔍 Sorun Analizi

Mekanik yetkisi olmasına rağmen script çalışmıyor.

## ✅ Yapılan Değişiklik

**Dosya**: `data/resources/[meslek]/[legal]/0r-mechanic/config.lua`

```lua
Config.Locations = {
    ["Bennys Workshop"] = {
        job = "mechanic", -- unemployed → mechanic değiştirildi
        ...
    }
}
```

---

## 🧪 Kontrol Adımları

### 1. Job Kontrolü (Oyun İçi)

F8 konsolu aç ve yaz:
```lua
print(QBCore.Functions.GetPlayerData().job.name)
```

Çıktı `mechanic` olmalı. Eğer farklıysa:
```lua
print(json.encode(QBCore.Functions.GetPlayerData().job))
```

Örnek çıktı:
```json
{
    "name": "mechanic",
    "label": "Mechanic",
    "payment": 50,
    "onduty": true,
    "isboss": false,
    "grade": {
        "name": "employee",
        "level": 0
    }
}
```

### 2. Veritabanı Kontrolü (VPS)

```bash
mysql -u nexora -p'Nexora123!' temelpaket -e "SELECT citizenid, job FROM players WHERE citizenid = 'SENIN_CITIZEN_ID';"
```

Job sütunu `mechanic` olmalı.

### 3. QBCore Job Sistemi Kontrolü

```bash
# qb-core/shared/jobs.lua dosyasını kontrol et
cat data/resources/[qb]/qb-core/shared/jobs.lua | grep -A 10 "mechanic"
```

`mechanic` job'u tanımlı olmalı.

---

## 🔧 Olası Sorunlar ve Çözümler

### Sorun 1: Job Adı Farklı

**Belirti**: F8'de job adı `mechanic` değil (örn: `mekanik`, `mechanist`, vb.)

**Çözüm**: Config.lua'da job adını değiştir:
```lua
job = "SENIN_JOB_ADIN", -- Örnek: "mekanik"
```

### Sorun 2: On Duty Değil

**Belirti**: Job var ama `onduty = false`

**Çözüm**: 
```
1. /duty yaz (eğer duty sistemi varsa)
2. Veya boss menüden "Go On Duty" yap
3. Veya F8'de: TriggerEvent('QBCore:ToggleDuty')
```

### Sorun 3: Job Yok

**Belirti**: F8'de job `unemployed` veya `nil`

**Çözüm**: Admin ile job ver:
```
/setjob [ID] mechanic [grade]
```

Veya veritabanından:
```sql
UPDATE players SET job = 'mechanic', grade = 0 WHERE citizenid = 'SENIN_CITIZEN_ID';
```

### Sorun 4: Script Yüklenmemiş

**Belirti**: Lokasyona gidince hiçbir şey olmuyor

**Çözüm**:
```bash
# VPS'de
restart 0r-mechanic
# Veya
ensure 0r-mechanic
```

Konsol çıktısını kontrol et:
```bash
# Hata var mı?
tail -f /home/fivem/FXServer/server-data/cache/server.log | grep mechanic
```

### Sorun 5: SQL Tablosu Yok

**Belirti**: Console'da SQL hatası

**Çözüm**:
```bash
mysql -u nexora -p'Nexora123!' temelpaket < /home/fivem/data/resources/[meslek]/[legal]/0r-mechanic/0r_mechanic.sql
```

Kontrol:
```bash
mysql -u nexora -p'Nexora123!' temelpaket -e "SHOW TABLES LIKE '0r_mechanics';"
```

### Sorun 6: Koordinat Sorunu

**Belirti**: Lokasyonda E tuşu çıkmıyor

**Çözüm**: Koordinatları kontrol et:
```lua
-- F8 konsolu
local ped = PlayerPedId()
local coords = GetEntityCoords(ped)
print(coords)
```

Config.lua'daki koordinatlarla karşılaştır:
```lua
coords = {
    vector3(-211.2, -1323.79, 30.22) -- Bennys Workshop
}
```

---

## 🎯 Hızlı Test

### Test 1: Job Kontrolü
```lua
-- F8
print(QBCore.Functions.GetPlayerData().job.name)
```
Beklenen: `mechanic`

### Test 2: Lokasyon Kontrolü
```
1. Bennys Workshop'a git (-211.2, -1323.79, 30.22)
2. E tuşu görünmeli: "Mechanic Menu"
3. E'ye bas, menü açılmalı
```

### Test 3: Script Kontrolü
```bash
# VPS'de
restart 0r-mechanic
```
Console'da hata olmamalı.

---

## 📋 Alternatif Çözüm: Herkese Aç

Eğer herkesin kullanmasını istiyorsan:

```lua
Config.Locations = {
    ["Bennys Workshop"] = {
        job = "unemployed", -- Herkes kullanabilir
        ...
    }
}
```

---

## 🔍 Debug Modu

Config.lua'da debug açabilirsin (eğer varsa):

```lua
Config.Debug = true
```

Sonra F8'de detaylı loglar göreceksin.

---

## 📞 Destek Komutları

### Admin Komutları
```
/setjob [ID] mechanic 0     # Mekanik yap (grade 0)
/setjob [ID] mechanic 1     # Mekanik yap (grade 1)
/setjob [ID] mechanic 2     # Mekanik yap (grade 2)
```

### Player Komutları
```
/duty                        # Duty toggle (eğer varsa)
/job                         # Job bilgisi (eğer varsa)
```

---

## 🎯 Sonuç

1. ✅ Config.lua'da `job = "mechanic"` yapıldı
2. ✅ Restart: `restart 0r-mechanic`
3. ✅ Job kontrolü: F8'de `print(QBCore.Functions.GetPlayerData().job.name)`
4. ✅ Lokasyona git ve test et

Eğer hala çalışmıyorsa, F8'deki job adını bana söyle, ona göre düzeltelim!
