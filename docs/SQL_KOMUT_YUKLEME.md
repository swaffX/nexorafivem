# VPS'de Komut ile SQL Yükleme Rehberi

## Yöntem 1: SQL Dosyasını Direkt Yükle (En Hızlı)

### Adım 1: SQL Dosyasının Konumunu Bul

SQL dosyası zaten VPS'de FiveM sunucu klasöründe:

**Muhtemel Konumlar:**
- `/root/FXServer/server-data/resources/[meslek]/[legal]/0r-mechanic/0r_mechanic.sql`
- `/home/fivem/server-data/resources/[meslek]/[legal]/0r-mechanic/0r_mechanic.sql`
- `/opt/fivem/resources/[meslek]/[legal]/0r-mechanic/0r_mechanic.sql`

**Konumu Bulmak İçin:**
```bash
find /root -name "0r_mechanic.sql" 2>/dev/null
# veya
find /home -name "0r_mechanic.sql" 2>/dev/null
```

### Adım 2: SSH ile VPS'e Bağlan

```bash
ssh root@VPS_IP_ADRESI
```
Şifreyi gir.

### Adım 3: SQL Dosyasını Yükle

Önce dosyanın konumunu bul:
```bash
find /root -name "0r_mechanic.sql" 2>/dev/null
```

Çıktı örneği:
```
/root/FXServer/server-data/resources/[meslek]/[legal]/0r-mechanic/0r_mechanic.sql
```

Şimdi bu konumu kullanarak yükle:
```bash
mysql -u root -p temelpaket < /root/FXServer/server-data/resources/[meslek]/[legal]/0r-mechanic/0r_mechanic.sql
```

**Veya kısa yol (dosya konumunu otomatik bul):**
```bash
SQL_FILE=$(find /root -name "0r_mechanic.sql" 2>/dev/null | head -n 1)
mysql -u root -p temelpaket < "$SQL_FILE"
```

**Açıklama:**
- `mysql`: MySQL komut satırı aracı
- `-u root`: root kullanıcısı ile bağlan
- `-p`: şifre sor
- `temelpaket`: veritabanı adı (senin veritabanın adı ne ise onu yaz)
- `< /root/0r_mechanic.sql`: bu dosyayı oku ve çalıştır

Şifreyi gir ve Enter'a bas. İşlem 1 saniyede biter.

### Adım 4: Kontrol Et

```bash
mysql -u root -p temelpaket -e "SHOW TABLES LIKE '0r_mechanics';"
```

Çıktı:
```
+----------------------------------+
| Tables_in_temelpaket (0r_mechanics) |
+----------------------------------+
| 0r_mechanics                     |
+----------------------------------+
```

Tablo görünüyorsa başarılı! ✅

---

## Yöntem 2: Tek Komutla (SQL Dosyası Olmadan)

SQL dosyasını VPS'e yüklemeden direkt komutla oluştur:

```bash
mysql -u root -p temelpaket <<EOF
CREATE TABLE IF NOT EXISTS \`0r_mechanics\` (
  \`plate\` text DEFAULT NULL,
  \`data\` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
EOF
```

Şifreyi gir ve Enter. Bitti!

---

## Yöntem 3: MySQL İçinde Çalıştır

### Adım 1: MySQL'e Gir
```bash
mysql -u root -p
```

### Adım 2: Veritabanını Seç
```sql
USE temelpaket;
```

### Adım 3: SQL Dosyasını Çalıştır
```sql
SOURCE /root/FXServer/server-data/resources/[meslek]/[legal]/0r-mechanic/0r_mechanic.sql;
```

**Not:** Dosya konumu farklıysa önce bul:
```bash
# MySQL'den çık
EXIT;

# Dosyayı bul
find /root -name "0r_mechanic.sql" 2>/dev/null

# Tekrar MySQL'e gir ve doğru konumu kullan
mysql -u root -p
USE temelpaket;
SOURCE /bulunan/konum/0r_mechanic.sql;
```

Veya direkt kodu yapıştır:
```sql
CREATE TABLE IF NOT EXISTS `0r_mechanics` (
  `plate` text DEFAULT NULL,
  `data` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
```

### Adım 4: Kontrol Et
```sql
SHOW TABLES LIKE '0r_mechanics';
```

### Adım 5: Çık
```sql
EXIT;
```

---

## Hızlı Kopya-Yapıştır Komutlar

### Tam Otomatik (Dosya Konumunu Otomatik Bul)
```bash
# SQL dosyasını bul
SQL_FILE=$(find /root -name "0r_mechanic.sql" 2>/dev/null | head -n 1)

# Dosya bulundu mu kontrol et
if [ -f "$SQL_FILE" ]; then
    echo "SQL dosyası bulundu: $SQL_FILE"
    mysql -u root -p temelpaket < "$SQL_FILE"
    echo "SQL başarıyla yüklendi!"
else
    echo "SQL dosyası bulunamadı!"
fi

# Kontrol et
mysql -u root -p temelpaket -e "SELECT COUNT(*) as tablo_var FROM information_schema.tables WHERE table_schema='temelpaket' AND table_name='0r_mechanics';"
```

Çıktı `1` ise başarılı!

---

## Veritabanı Adını Bilmiyorsan

### Mevcut Veritabanlarını Listele
```bash
mysql -u root -p -e "SHOW DATABASES;"
```

Çıktı:
```
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| temelpaket         |  <-- FiveM veritabanı
+--------------------+
```

### FiveM Veritabanını Bul
```bash
mysql -u root -p -e "SHOW DATABASES;" | grep -E "fivem|qb|essential|temel"
```

---

## MySQL Şifresini Bilmiyorsan

### 1. Server.cfg'den Bul
```bash
cat /root/FXServer/server-data/server.cfg | grep mysql_connection_string
```

Çıktı:
```
set mysql_connection_string "mysql://nexora:Nexora123!@127.0.0.1/temelpaket?charset=utf8mb4"
```

**Şifre**: `Nexora123!`
**Veritabanı**: `temelpaket`
**Kullanıcı**: `nexora`

### 2. Doğru Komut
```bash
mysql -u nexora -p'Nexora123!' temelpaket < /root/0r_mechanic.sql
```

---

## Sık Karşılaşılan Hatalar

### "ERROR 1045: Access denied"
**Sebep**: Yanlış şifre veya kullanıcı adı
**Çözüm**: server.cfg'den doğru bilgileri al

### "ERROR 1049: Unknown database"
**Sebep**: Veritabanı adı yanlış
**Çözüm**: `SHOW DATABASES;` ile kontrol et

### "No such file or directory"
**Sebep**: SQL dosyası yanlış konumda veya bulunamıyor
**Çözüm**: 
```bash
# Dosyayı bul
find /root -name "0r_mechanic.sql" 2>/dev/null
find /home -name "0r_mechanic.sql" 2>/dev/null
find /opt -name "0r_mechanic.sql" 2>/dev/null

# Veya FiveM klasöründe ara
find /root/FXServer -name "*.sql" 2>/dev/null
find /root -type d -name "0r-mechanic" 2>/dev/null
```

### "command not found: mysql"
**Sebep**: MySQL kurulu değil
**Çözüm**:
```bash
# Ubuntu/Debian
apt install mysql-client -y

# CentOS/RHEL
yum install mysql -y
```

---

## Pratik Örnek (Senin Durumun)

### 1. VPS'e Bağlan
```bash
ssh root@VPS_IP
```

### 2. SQL Dosyasını Bul
```bash
find /root -name "0r_mechanic.sql" 2>/dev/null
```

Çıktı örneği:
```
/root/FXServer/server-data/resources/[meslek]/[legal]/0r-mechanic/0r_mechanic.sql
```

### 3. SQL'i Yükle (Bulunan Konumu Kullan)
```bash
mysql -u nexora -p'Nexora123!' temelpaket < /root/FXServer/server-data/resources/[meslek]/[legal]/0r-mechanic/0r_mechanic.sql
```

**Veya Otomatik:**
```bash
SQL_FILE=$(find /root -name "0r_mechanic.sql" 2>/dev/null | head -n 1)
mysql -u nexora -p'Nexora123!' temelpaket < "$SQL_FILE"
```

### 4. Kontrol Et
```bash
mysql -u nexora -p'Nexora123!' temelpaket -e "SHOW TABLES LIKE '0r_mechanics';"
```

### 5. Bitti!
```bash
exit
```

---

## Bonus: Tüm SQL Dosyalarını Toplu Yükle

Eğer birden fazla SQL dosyan varsa (FiveM klasöründeki tüm SQL'ler):

```bash
# FiveM resources klasöründeki tüm SQL dosyalarını bul ve yükle
find /root/FXServer/server-data/resources -name "*.sql" -type f | while read sql_file; do
    echo "Yükleniyor: $sql_file"
    mysql -u nexora -p'Nexora123!' temelpaket < "$sql_file"
done
```

---

## Özet: En Hızlı Yöntem

```bash
# 1. SSH'ye bağlan
ssh root@VPS_IP

# 2. SQL dosyasını bul
SQL_FILE=$(find /root -name "0r_mechanic.sql" 2>/dev/null | head -n 1)
echo "Bulunan dosya: $SQL_FILE"

# 3. Tek komutla yükle
mysql -u nexora -p'Nexora123!' temelpaket < "$SQL_FILE"

# 4. Kontrol et
mysql -u nexora -p'Nexora123!' temelpaket -e "SELECT * FROM 0r_mechanics LIMIT 1;"

# 5. Çık
exit
```

**Süre**: 30 saniye ⚡

---

## Video Anlatım Gibi Adımlar

```
1️⃣ PuTTY veya PowerShell aç
2️⃣ ssh root@VPS_IP yaz
3️⃣ Şifreyi gir
4️⃣ find /root -name "0r_mechanic.sql" 2>/dev/null
5️⃣ Çıkan konumu kopyala
6️⃣ mysql -u nexora -p'Nexora123!' temelpaket < KOPYALADIGIN_KONUM
7️⃣ Enter'a bas
8️⃣ Bitti! ✅
```

**Veya Otomatik:**
```
1️⃣ SSH'ye bağlan
2️⃣ SQL_FILE=$(find /root -name "0r_mechanic.sql" 2>/dev/null | head -n 1)
3️⃣ mysql -u nexora -p'Nexora123!' temelpaket < "$SQL_FILE"
4️⃣ Bitti! ✅
```

---

**Not**: Şifrede özel karakterler varsa (`!`, `@`, `#` vb.) şifreyi tek tırnak içine al: `-p'Nexora123!'`
