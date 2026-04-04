# 0r-mechanic SQL Kurulum Rehberi

## SQL Dosyası İçeriği

Script şu tabloyu oluşturuyor:
```sql
CREATE TABLE IF NOT EXISTS `0r_mechanics` (
  `plate` text DEFAULT NULL,
  `data` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
```

Bu tablo araç plakalarına göre mekanik verilerini (tamir geçmişi, modifikasyonlar vb.) saklar.

---

## VPS'de SQL Yükleme Yöntemleri

### YÖNTEM 1: phpMyAdmin ile (En Kolay)

1. **phpMyAdmin'e Giriş Yap**
   - VPS'inin web paneline gir (genelde `http://VPS_IP:8080` veya hosting panel linki)
   - phpMyAdmin'i aç
   - FiveM veritabanını seç (genelde `fivem`, `qbcore`, `essentialmode` gibi isimler)

2. **SQL Dosyasını İçe Aktar**
   - Üstteki menüden **"SQL"** sekmesine tıkla
   - Aşağıdaki SQL kodunu yapıştır:
   ```sql
   CREATE TABLE IF NOT EXISTS `0r_mechanics` (
     `plate` text DEFAULT NULL,
     `data` longtext DEFAULT '[]'
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
   ```
   - **"Git"** veya **"Execute"** butonuna bas
   - "Query executed successfully" mesajını gör

3. **Kontrol Et**
   - Sol menüden `0r_mechanics` tablosunu görebilmelisin
   - Tablo boş olacak (henüz veri yok)

---

### YÖNTEM 2: HeidiSQL ile (Windows)

1. **HeidiSQL İndir ve Kur**
   - https://www.heidisql.com/download.php

2. **VPS'e Bağlan**
   - HeidiSQL'i aç
   - "New" butonuna bas
   - Bilgileri gir:
     - **Hostname/IP**: VPS IP adresi
     - **User**: MySQL kullanıcı adı (genelde `root`)
     - **Password**: MySQL şifresi
     - **Port**: 3306 (varsayılan)
   - "Open" butonuna bas

3. **SQL Çalıştır**
   - Sol taraftan FiveM veritabanını seç
   - Üstteki menüden **"Query"** sekmesine tıkla
   - SQL kodunu yapıştır ve F9'a bas (veya Execute butonuna tıkla)

---

### YÖNTEM 3: SSH ile (Terminal - Linux/VPS)

1. **VPS'e SSH ile Bağlan**
   ```bash
   ssh root@VPS_IP_ADRESI
   ```

2. **MySQL'e Giriş Yap**
   ```bash
   mysql -u root -p
   ```
   - Şifreyi gir

3. **Veritabanını Seç**
   ```sql
   USE fivem;
   ```
   (Veritabanı adın farklıysa onu yaz)

4. **SQL Kodunu Çalıştır**
   ```sql
   CREATE TABLE IF NOT EXISTS `0r_mechanics` (
     `plate` text DEFAULT NULL,
     `data` longtext DEFAULT '[]'
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
   ```

5. **Kontrol Et**
   ```sql
   SHOW TABLES LIKE '0r_mechanics';
   ```
   - Tablo görünüyorsa başarılı

6. **Çıkış**
   ```sql
   EXIT;
   ```

---

### YÖNTEM 4: SQL Dosyasını Doğrudan Yükle

1. **SQL Dosyasını VPS'e Aktar**
   - FileZilla veya WinSCP ile `0r_mechanic.sql` dosyasını VPS'e yükle
   - Örnek konum: `/root/0r_mechanic.sql`

2. **SSH ile Yükle**
   ```bash
   mysql -u root -p fivem < /root/0r_mechanic.sql
   ```
   (Şifreyi gir ve bekle)

---

## Kurulum Sonrası Kontrol

### 1. Tablo Oluşturuldu mu?
phpMyAdmin veya HeidiSQL'de `0r_mechanics` tablosunu görebilmelisin.

### 2. Server.cfg Kontrolü
`data/server.cfg` dosyasında mekanik scripti yüklü mü kontrol et:
```cfg
ensure 0r-mechanic
```

### 3. Oyun İçi Test
- Sunucuyu başlat
- Mekanik lokasyonuna git
- Araç tamir et veya modifiye et
- phpMyAdmin'de `0r_mechanics` tablosuna veri geldi mi kontrol et

---

## Sık Karşılaşılan Hatalar

### "Table already exists"
- Sorun değil, tablo zaten var demek
- `IF NOT EXISTS` komutu sayesinde hata vermez

### "Access denied for user"
- MySQL kullanıcı adı veya şifre yanlış
- VPS hosting panelinden doğru bilgileri al

### "Unknown database"
- Veritabanı adı yanlış
- `SHOW DATABASES;` komutuyla mevcut veritabanlarını listele

### "Connection refused"
- MySQL servisi çalışmıyor olabilir
- VPS'de: `systemctl status mysql` veya `service mysql status`
- Çalışmıyorsa: `systemctl start mysql`

---

## Önemli Notlar

1. **Yedek Al**: SQL çalıştırmadan önce mevcut veritabanının yedeğini al
2. **Doğru Veritabanı**: FiveM sunucunun kullandığı veritabanına yükle
3. **Karakter Seti**: UTF-8 kullanıldığından emin ol (Türkçe karakter desteği için)
4. **oxmysql**: QBCore genelde oxmysql kullanır, fxmanifest.lua'da kontrol et

---

## Hızlı Özet

En kolay yöntem: **phpMyAdmin**
1. phpMyAdmin aç
2. FiveM veritabanını seç
3. SQL sekmesine git
4. Yukarıdaki CREATE TABLE kodunu yapıştır
5. Execute'a bas
6. Bitti!

---

**Dosya Konumu**: `data/resources/[meslek]/[legal]/0r-mechanic/0r_mechanic.sql`
**Tablo Adı**: `0r_mechanics`
**Amaç**: Araç tamir ve modifikasyon verilerini saklar
