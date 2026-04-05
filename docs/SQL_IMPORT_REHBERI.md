# SQL Dosyası Import Rehberi

## 📋 Nexora Speaker - speaker_history.sql Import

**Dosya**: `data/resources/[standalone]/nexora-speaker/speaker_history.sql`

---

## 🔧 Yöntem 1: HeidiSQL (Önerilen)

### Adımlar:
1. **HeidiSQL'i Aç**
2. **Database'e Bağlan** (QBCore database'i seç)
3. **Menü**: `Dosya` → `SQL Dosyası Çalıştır`
4. **Dosya Seç**: `speaker_history.sql`
5. **Çalıştır** butonuna bas
6. ✅ Tablo oluşturuldu!

### Alternatif (SQL Penceresi):
1. HeidiSQL'de **SQL** sekmesine git
2. `speaker_history.sql` dosyasını aç (Not Defteri ile)
3. İçeriği **kopyala**
4. HeidiSQL SQL penceresine **yapıştır**
5. **F9** veya **Çalıştır** butonuna bas

---

## 🔧 Yöntem 2: phpMyAdmin

### Adımlar:
1. **phpMyAdmin'e Gir** (genelde `http://localhost/phpmyadmin`)
2. Sol menüden **QBCore database'ini seç**
3. Üst menüden **İçe Aktar (Import)** sekmesine git
4. **Dosya Seç** butonuna bas
5. `speaker_history.sql` dosyasını seç
6. Sayfanın altındaki **Git (Go)** butonuna bas
7. ✅ Tablo oluşturuldu!

---

## 🔧 Yöntem 3: MySQL Command Line

### Windows:
```cmd
cd C:\xampp\mysql\bin
mysql -u root -p qbcoreframework_XXXXX < "C:\path\to\speaker_history.sql"
```

### Linux:
```bash
mysql -u root -p qbcoreframework_XXXXX < /path/to/speaker_history.sql
```

**Not**: `qbcoreframework_XXXXX` yerine kendi database adınızı yazın

---

## 🔧 Yöntem 4: Manuel SQL Kodu

Eğer dosya import etmek istemiyorsanız, direkt SQL kodunu çalıştırabilirsiniz:

```sql
CREATE TABLE IF NOT EXISTS `speaker_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `url` text NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT 'Bilinmeyen Şarkı',
  `played_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `played_at` (`played_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

### Nasıl Çalıştırılır:
1. HeidiSQL veya phpMyAdmin'de **SQL** sekmesine git
2. Yukarıdaki kodu **yapıştır**
3. **Çalıştır**

---

## ✅ Kontrol Et

Tablo oluşturuldu mu kontrol etmek için:

```sql
SHOW TABLES LIKE 'speaker_history';
```

Veya:

```sql
DESCRIBE speaker_history;
```

Çıktı şöyle olmalı:
```
+------------+--------------+------+-----+-------------------+
| Field      | Type         | Null | Key | Default           |
+------------+--------------+------+-----+-------------------+
| id         | int(11)      | NO   | PRI | NULL              |
| citizenid  | varchar(50)  | NO   | MUL | NULL              |
| url        | text         | NO   |     | NULL              |
| title      | varchar(255) | NO   |     | Bilinmeyen Şarkı  |
| played_at  | bigint(20)   | NO   | MUL | NULL              |
+------------+--------------+------+-----+-------------------+
```

---

## 🐛 Sorun Giderme

### Hata: "Table already exists"
**Çözüm**: Tablo zaten var, sorun yok! Devam edebilirsiniz.

### Hata: "Access denied"
**Çözüm**: MySQL kullanıcı şifrenizi kontrol edin.

### Hata: "Unknown database"
**Çözüm**: Database adını kontrol edin. QBCore database'i seçili mi?

### Hata: "Syntax error"
**Çözüm**: SQL kodunu tam kopyaladığınızdan emin olun.

---

## 📝 Notlar

- **Backup**: Import öncesi database backup almayı unutmayın!
- **Charset**: utf8mb4 kullanılıyor (emoji desteği)
- **Engine**: InnoDB (transaction desteği)
- **Indexes**: citizenid ve played_at indeksli (hızlı sorgulama)

---

## 🚀 Import Sonrası

1. **FiveM Server'ı Restart Et**
```
restart nexora-speaker
```

2. **Test Et**
- Oyuna gir
- K tuşuna bas
- Müzik çal
- "Diğer" → "Müzik geçmişi"
- Şarkı listede görünmeli

3. **Restart Testi**
- Server'ı restart et
- Tekrar gir
- Geçmiş hala orada olmalı ✅

---

**Hazırlayan**: Nexora RP Team  
**Tarih**: 2026-04-05
