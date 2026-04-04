# Database and MariaDB Guide

Bu rehber, projede yeni veritabani girdisi, tablo, kolon veya seed veri eklemek gerektiginde izlenecek standart yolu anlatir.

## 1. Mevcut DB resmi

Ana veritabani:

- DB adi: `temelpaket`

Ana schema kaynagi:

- `temelpaket.sql`

Ek resource SQL dosyalari:

- `data/resources/[alan]/high_phone/high_phone.sql`
- `data/resources/[alan]/hb_motel/hb_motel.sql`

Runtime'da otomatik olusan tablo ornegi:

- `management_funds`
  - `data/resources/[qb]/qb-management/server/sv_accounts.lua`

## 2. En onemli tablolar

### Core oyuncu verisi

- `players`
  - citizenid, money, charinfo, job, gang, metadata, telefon alanlari

### Arac verisi

- `player_vehicles`
  - sahiplik, plate, mods, garage, engine/body, financing

### Telefon / fatura

- `phone_invoices`
  - citizenid, amount, society, sender, reason

### Konut / motel

- `apartments`
- `motel_rentals`
- `hb_motels_keys`
- `hb_motels_rooms`

## 3. Yeni DB ihtiyaci oldugunda once karar ver

Her degisiklik ayni tipte degildir.

### Sadece veri ekliyorsan

Ornek:

- yeni item kaydi
- yeni invoice seed verisi
- yeni motel odasi seed'i

Yapman gereken:

1. `INSERT` script'i hazirla
2. Hangi ortamda calisacagini not et
3. Kodun bu veriyi bekledigini dogrula

### Schema degisikligi yapiyorsan

Ornek:

- yeni tablo
- yeni kolon
- index ekleme
- var olan tabloyu resource ihtiyacina gore genisletme

Yapman gereken:

1. `CREATE TABLE` veya `ALTER TABLE` script'i yaz
2. Resource kodunu yeni schema ile uyumlu hale getir
3. MariaDB'de uygula
4. Query'lerin hata vermedigini test et

## 4. Nereye yazmaliyim?

### Kural

Bir degisiklik resource'a ozelse, ilgili resource'in yanina bir SQL dosyasi eklemek en temiz yoldur.

Ornek:

- telefon icinse `high_phone.sql`
- motel icinse `hb_motel.sql`
- management/boss funds gibi cekirdek etkisi varsa ilgili resource altina migration notu veya docs/sql altina migration eklenebilir

### Tavsiye edilen pratik

Her yeni DB degisikligi icin:

1. `docs/sql/` altina acik isimli bir migration dosyasi ekle
2. gerekiyorsa ilgili resource icinde README veya yorum ile referans ver
3. production'a uygulanma adimini PR veya changelog'a yaz

## 5. MariaDB ile degisiklik uygulama akisi

### Sunucuya SSH ile baglan

```bash
ssh root@SUNUCU_IP
```

### MariaDB shell ac

```bash
mysql -u root -p
```

Veya dogrudan belirli DB icin:

```bash
mysql -u root -p temelpaket
```

### SQL dosyasini uygula

```bash
mysql -u root -p temelpaket < /path/to/file.sql
```

## 6. Ornek senaryolar

### A. Yeni tablo eklemek

Senaryo: Yeni bir resource, oyuncu bazli log tutacak.

```sql
CREATE TABLE IF NOT EXISTS player_activity_logs (
    id INT NOT NULL AUTO_INCREMENT,
    citizenid VARCHAR(50) NOT NULL,
    activity_type VARCHAR(50) NOT NULL,
    payload LONGTEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_citizenid (citizenid),
    KEY idx_activity_type (activity_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

Uygulama:

```bash
mysql -u root -p temelpaket < docs/sql/mariadb_change_template.sql
```

Sonra Lua tarafinda query yaz.

### B. Var olan tabloya kolon eklemek

Senaryo: `player_vehicles` tablosuna yeni bir alan eklemek.

```sql
ALTER TABLE player_vehicles
ADD COLUMN service_notes LONGTEXT NULL AFTER metadata;
```

### C. Sadece veri eklemek

Senaryo: Manuel seed veri eklemek.

```sql
INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid, reason)
VALUES ('ABC12345', 500, 'mechanic', 'System', 'SYSTEM', 'Test invoice');
```

## 7. Kod tarafinda neyi guncellemeliyim?

DB degisikligi tek basina yetmez. Cogu durumda asagidakiler de guncellenir:

- `server.lua` query'leri
- `client.lua` event akisleri
- callback/export kullanan kodlar
- varsa config sabitleri
- gerekiyorsa yeni tabloyu kullanan verification adimlari

Ornekler:

- `high_phone/server/bank.lua` fatura ve odeme akislarini DB ile baglar
- `hb_mechanic/server/sv_bennys.lua` arac mod / tamir odemelerini kullanir
- `qb-management/server/sv_accounts.lua` `management_funds` tablosunu olusturur ve okur

## 8. Bu projedeki ozel notlar

### `management_funds`

Bu tablo ana dump icinde yer almak zorunda degil cunku runtime'da otomatik olusturuluyor.

Kaynak:

- `data/resources/[qb]/qb-management/server/sv_accounts.lua`

Mantik:

- resource acilisinda `CREATE TABLE IF NOT EXISTS management_funds`
- `AddMoney`, `RemoveMoney`, `GetAccount` export'lari
- `qb-bossmenu:server:addAccountMoneyScript` event uyumlulugu

### `phone_invoices`

Telefon fatura sistemi icin kritik tablodur.

Kod baglantisi:

- `data/resources/[alan]/high_phone/server/bank.lua`

Fatura odendiginde:

1. invoice okunur
2. oyuncudan banka parasi dusulur
3. commission dagitilabilir
4. boss account event'i tetiklenir
5. invoice silinir

## 9. Duzgun migration yazma kurali

- `IF NOT EXISTS` kullan
- yikici degisiklikte backup al
- kolon eklenecekse nullable veya default stratejisini dusun
- index gerekiyorsa ayni migration'a ekle
- runtime kodu ile SQL ayni PR/commit'te guncellenmeli

## 10. Dogrulama komutlari

### Tablo var mi?

```sql
SHOW TABLES LIKE 'management_funds';
```

### Kolonlari gor

```sql
DESCRIBE player_vehicles;
```

### Veri gor

```sql
SELECT * FROM management_funds LIMIT 20;
```

### Son invoice kayitlarini kontrol et

```sql
SELECT * FROM phone_invoices ORDER BY id DESC LIMIT 20;
```

## 11. Uygulama sonrasi checklist

1. SQL komutu hatasiz calisti mi?
2. Resource acilisinda query error var mi?
3. Beklenen tablo/kolon MariaDB'de gorunuyor mu?
4. In-game akista veri okunup yaziliyor mu?
5. Gerekliyse ilgili resource restart edildi mi?

## 12. Hangi komutlari kullanayim?

Kisa operasyon ornekleri:

```bash
ssh root@SUNUCU_IP
mysql -u root -p temelpaket
mysql -u root -p temelpaket < /home/fivem/docs/sql/example.sql
```

Daha ayrintili operasyon akisi icin:

- `docs/OPERATIONS_AND_COMMANDS.md`
