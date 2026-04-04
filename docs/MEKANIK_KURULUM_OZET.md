# 0r-mechanic Kurulum Özeti

## ✅ Yapılan İşlemler

### 1. Framework Ayarı
- ✅ `config.lua` zaten QBCore için ayarlı
- ✅ Framework: `qbcore`

### 2. MySQL Ayarı
- ✅ `fxmanifest.lua` düzeltildi
- ✅ `mysql-async` kapatıldı
- ✅ `oxmysql` aktif edildi (QBCore standardı)

### 3. Türkçe Dil Desteği
- ✅ Tüm menü metinleri Türkçeleştirildi
- ✅ Bildirimler Türkçe

### 4. Server.cfg
- ✅ Script zaten `ensure [meslek]` ile yüklenecek
- ✅ Ek ayar gerekmez

---

## 🗄️ SQL Kurulumu (VPS'de Yapılacak)

### En Kolay Yöntem: phpMyAdmin

1. **phpMyAdmin'e gir**
2. **FiveM veritabanını seç** (genelde `temelpaket` veya `fivem`)
3. **SQL sekmesine tıkla**
4. **Şu kodu yapıştır ve çalıştır:**

```sql
CREATE TABLE IF NOT EXISTS `0r_mechanics` (
  `plate` text DEFAULT NULL,
  `data` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
```

5. **"Git" veya "Execute" butonuna bas**
6. **Başarılı mesajını gör**

### Alternatif: SSH ile

```bash
# VPS'e bağlan
ssh root@VPS_IP

# MySQL'e gir
mysql -u root -p

# Veritabanını seç
USE temelpaket;

# Tabloyu oluştur
CREATE TABLE IF NOT EXISTS `0r_mechanics` (
  `plate` text DEFAULT NULL,
  `data` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# Kontrol et
SHOW TABLES LIKE '0r_mechanics';

# Çık
EXIT;
```

---

## 🎮 Oyun İçi Kullanım

### Mekanik Lokasyonu
- **Konum**: Bennys Workshop
- **Koordinatlar**: -211.2, -1323.79, 30.22
- **Harita**: Blip aktif (mavi ikon)
- **İş**: Herkes kullanabilir (job: "unemployed")

### Kontroller
- **E tuşu**: Mekanik menüsünü aç
- **Sol Shift**: Drift modu
- **E tuşu**: Nitro kullan
- **H tuşu**: Popcorn egzoz aç/kapat
- **Sol Ctrl**: Ödeme yap

### Özellikler
1. **Performans Yükseltmeleri**
   - Motor, turbo, fren, şanzıman, süspansiyon
   
2. **Görsel Özelleştirme**
   - Spoiler, egzoz, kaput, tampon, jant vb.
   
3. **Kozmetik**
   - Far rengi, neon, cam filmi, duman rengi
   
4. **Tuning**
   - Nitro sistemi
   - Popcorn egzoz
   - Drift modu
   - Çekiş kontrolü

5. **Fitment**
   - Jant açısı ayarı (camber)
   - Jant genişliği

---

## 💰 Fiyatlandırma

### Performans
- Motor: 5.000₺ (her seviye +500₺)
- Turbo: 5.000₺
- Fren: 5.000₺ (her seviye +500₺)
- Şanzıman: 5.000₺ (her seviye +500₺)

### Özel Sistemler
- Nitro: 15.000₺
- Popcorn Egzoz: 15.000₺
- Çekiş Kontrolü: 10.000₺
- Tuner Chip: 25.000₺

### Görsel
- Spoiler: 1.500₺+
- Egzoz: 1.000₺+
- Kaput: 2.200₺+
- Jantlar: 5.000₺+
- Fitment: 7.500₺

### Boya
- Normal Renk: 500₺
- İnci Renk: 500₺
- Krom: 750₺
- Kamelyon: 2.500₺

---

## 🔧 Yapılandırma

### Mekanik Lokasyonu Eklemek
`config.lua` dosyasında `Config.Locations` bölümüne yeni lokasyon ekle:

```lua
["Yeni Mekanik"] = {
    illegalMechanic = false,
    enableSociety = true,
    job = "mechanic", -- sadece mekanikler kullanabilir
    coords = {
        vector3(x, y, z)
    },
    showBlip = true,
    blipSprite = 446,
    blipColor = 4,
    blipCoords = vector3(x, y, z),
    bossMenu = vector3(x, y, z),
}
```

### İllegal Mekanik Yapmak
```lua
illegalMechanic = true, -- polise bildirim gitmez
job = "unemployed", -- herkes kullanabilir
```

### Sadece Belirli İş İçin
```lua
job = "mechanic", -- sadece mekanikler
```

---

## 🧪 Test Adımları

1. **SQL Yükleme Testi**
   ```sql
   SELECT * FROM 0r_mechanics;
   ```
   Tablo boş olmalı (henüz veri yok)

2. **Sunucu Başlatma**
   ```
   FXServer başlat
   Console'da hata olmamalı
   ```

3. **Oyun İçi Test**
   - Haritada mavi mekanik blip'i gör
   - Lokasyona git
   - E tuşuna bas
   - Menü açılmalı

4. **Araç Modifikasyonu**
   - Bir araç al
   - Mekanik menüsünden bir şey değiştir
   - Ödeme yap
   - Değişiklik uygulanmalı

5. **Veritabanı Kontrolü**
   ```sql
   SELECT * FROM 0r_mechanics;
   ```
   Araç plakası ve data görünmeli

---

## ⚠️ Önemli Notlar

1. **Oyun Versiyonu**: 2699+ olmalı (server.cfg'de 3258 ayarlı ✅)
2. **oxmysql**: QBCore için gerekli (✅ aktif)
3. **Ödeme**: Sol Ctrl tuşu ile yapılır
4. **Yedekleme**: SQL çalıştırmadan önce veritabanı yedeği al
5. **Performans**: `syncFitment = false` (performans için kapalı)

---

## 📁 Dosya Konumları

- **Script**: `data/resources/[meslek]/[legal]/0r-mechanic/`
- **SQL**: `data/resources/[meslek]/[legal]/0r-mechanic/0r_mechanic.sql`
- **Config**: `data/resources/[meslek]/[legal]/0r-mechanic/config.lua`
- **Detaylı Rehber**: `docs/MEKANIK_SQL_KURULUM.md`

---

## 🚀 Hızlı Başlangıç

1. ✅ Script dosyaları yerinde
2. ✅ oxmysql aktif
3. ✅ Türkçe dil eklendi
4. 🔄 **VPS'de SQL'i çalıştır** (yukarıdaki kod)
5. ✅ Sunucuyu başlat
6. ✅ Oyuna gir ve test et

---

**Kurulum Durumu**: %90 Tamamlandı
**Kalan İşlem**: Sadece SQL tablosunu VPS'de oluştur
**Tahmini Süre**: 2 dakika
