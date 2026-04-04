# Operations and Commands

Bu dosya, sunucuyu calistirma, cache temizleme, resource restart etme, log bakma ve temel operasyon komutlarini tek yerde toplar.

## 1. En onemli operasyon dosyalari

### `data/server.cfg`

Sunucunun ana config dosyasidir.

Burada:

- port
- max client
- mysql connection string
- resource start sirasi
- permissions

tanimlanir.

### `data/clear_cache.bat`

Windows tarafinda `cache/files` klasorunu temizler.

Kullanim amaci:

- bozuk cache
- resource guncellemesi sonrasi temiz baslangic
- istemci veya sunucu cache supheli durumlari

### `data/restart_resources.cfg`

Sunucu konsolunda `exec restart_resources.cfg` diye calistirilabilecek toplu restart dosyasidir.

Not:

- Buradaki liste kalici dogruluk garantisi vermez
- Hata veren resource listesi degistiginde bu dosya da guncellenmelidir

## 2. Yerel repo ve VPS layout farki

Local repo:

```text
repo-root/
  data/
    server.cfg
    resources/
```

Canli VPS deploy sekli:

```text
/home/fivem/
  server.cfg
  resources/
```

Bu fark kritik.

Bir komut calistirmadan once su soruyu sor:

"Ben repo source'unu mu duzenliyorum, yoksa production deploy klasorunu mu?"

## 3. Siklikla kullanilan komutlar

### Git

Repo guncelle:

```bash
git fetch origin
git pull --ff-only origin main
```

Durum bak:

```bash
git status -sb
```

### SSH

```bash
ssh root@SUNUCU_IP
```

### MariaDB

```bash
mysql -u root -p
mysql -u root -p temelpaket
mysql -u root -p temelpaket < some_change.sql
```

## 4. FiveM ve txAdmin operasyonlari

### Resource restart

Sunucu konsolunda:

```text
restart qb-management
restart hb_mechanic
```

Toplu cfg:

```text
exec restart_resources.cfg
```

### Sunucu loglari

Local veya exported environment'te:

- `txData/default/logs/fxserver.log`
- `txData/default/logs/server.log`

VPS'te deploy sekline gore:

- `/home/fivem/txData/default/logs/fxserver.log`
- `/home/fivem/server.log`

### Screen ile baslatma ornegi

```bash
cd /home/fivem
screen -S fivem -dm bash -c './run.sh +set txAdminPort 40120'
```

### Screen oturumunu ac

```bash
screen -r fivem
```

### Screen'den cik

`Ctrl+A`, sonra `D`

## 5. In-game komutlari bulma mantigi

Bu projede komutlarin buyuk kismi:

- `QBCore.Commands.Add(...)`
- `RegisterCommand(...)`

ile tanimlanir.

Merkezi komut mantigi:

- `data/resources/[qb]/qb-core/server/commands.lua`

Resource bazli ornekler:

- `hb_mechanic`: `mekanik`
- `hb_multicharacter`: `logout`, `closeNUI`
- `high_phone`: fatura komutlari

## 6. Bu repo icin dikkat edilmesi gereken operasyon notlari

### Sira hatalari

Yanlis start sirasi su hatalari dogurabilir:

- `No such export GetCoreObject`
- `No such export AddMoney`
- `attempt to index a nil value`

Bu tip hatalarda kontrol et:

1. `ox_lib` ve `qb-core` once mi kalkiyor?
2. ilgili kutuphane resource'u yuklu mu?
3. deploy klasorunde dogru dosya mi calisiyor?

### Cache konusu

Runtime klasorleri repoya commit edilmemeli:

- `cache/`
- `txData/`
- `alpine/`
- log dosyalari

### Config konusu

Gercek production `server.cfg` icindeki:

- lisans key
- mysql sifresi
- admin identifier'lari

gibi alanlar dikkatle yonetilmelidir.

## 7. Siklikla kullanilan dogrulama komutlari

### Belirli bir hata var mi?

```bash
grep -n "SCRIPT ERROR" /home/fivem/txData/default/logs/fxserver.log | tail -n 50
```

### Belirli resource acildi mi?

```bash
grep -n "Started resource qb-management" /home/fivem/txData/default/logs/fxserver.log | tail
```

### Belirli export hatasi var mi?

```bash
grep -n "No such export AddMoney" /home/fivem/txData/default/logs/fxserver.log | tail
```

## 8. Degisiklik sonrasi pratik checklist

1. Gerekliyse SQL uygulandi mi?
2. Gerekli resource restart edildi mi?
3. Log temiz mi?
4. In-game akis test edildi mi?
5. Runtime deploy yolu ile repo yolu karistirilmadi mi?
