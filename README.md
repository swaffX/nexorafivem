# 🎮 Nexora Roleplay - FiveM Server

QBCore tabanlı FiveM roleplay sunucusu.

## 📋 İçerik

- QBCore Framework
- 100+ özel script
- Optimize edilmiş performans
- Türkçe dil desteği

## 🚀 VPS Kurulumu

### Hızlı Başlangıç

1. **GitHub'dan Çekin**
```bash
git clone https://github.com/KULLANICI_ADINIZ/fivem-server.git
cd fivem-server
```

2. **Manuel Dosyaları Aktarın**
```bash
# Yerel bilgisayarınızdan
scp data/server.cfg root@VPS_IP:~/fivem-server/data/
scp temelpaket.sql root@VPS_IP:~/
```

3. **Kurulumu Çalıştırın**
```bash
bash vps_setup.sh
```

4. **Lisans Anahtarını Güncelleyin**
```bash
nano data/server.cfg
# sv_licenseKey değiştirin
```

5. **Başlatın**
```bash
systemctl start fivem
```

## 📚 Rehberler

- **MANUEL_TRANSFER.txt** - Hızlı komutlar
- **GITHUB_TRANSFER_PLAN.md** - Detaylı transfer rehberi
- **VPS_TRANSFER_GUIDE.md** - Kapsamlı kurulum
- **HIZLI_BASLANGIC.txt** - 3 adımda kurulum
- **vps_commands.txt** - Komut referansı

## 🔧 Sunucu Yönetimi

```bash
# Başlat
systemctl start fivem

# Durdur
systemctl stop fivem

# Yeniden başlat
systemctl restart fivem

# Durum
systemctl status fivem

# Loglar
journalctl -u fivem -f
```

## 🔄 Güncelleme

```bash
cd ~/fivem-server
systemctl stop fivem
git pull
systemctl start fivem
```

## 📦 Gereksinimler

- Ubuntu 20.04+ / Debian 11+
- 4GB+ RAM
- 20GB+ Disk
- MariaDB/MySQL
- FiveM Lisans Anahtarı

## 🔒 Güvenlik

- `.gitignore` ile hassas dosyalar korunur
- `server.cfg` manuel aktarılmalı
- SQL dosyası manuel aktarılmalı
- Private repo kullanın

## 🐛 Sorun Giderme

### Sunucu başlamıyor
```bash
journalctl -u fivem -n 100
```

### MySQL hatası
```bash
systemctl status mysql
mysql -u fivem -p temelPaket
```

### Port kontrol
```bash
netstat -tulpn | grep 30120
```

## 📞 Destek

- Discord: discord.gg/Nexora
- Dokümantasyon: docs.qbcore.org

## 📝 Lisans

Bu proje özel lisanslıdır. İzinsiz kullanım yasaktır.

---

**Not:** `server.cfg` ve `temelpaket.sql` dosyaları güvenlik nedeniyle bu repo'da bulunmaz. Manuel olarak aktarılmalıdır.
