# FiveM QBCore Server

QBCore framework tabanlı FiveM sunucu projesi.

## 📋 Özellikler

- QBCore Framework
- Özel HUD sistemi (alan-hud)
- Banking sistemi (hb_banking)
- Chat sistemi (hb_chat)
- Farming sistemi (hb_farming)
- Mechanic sistemi (hb_mechanic)
- Motel sistemi (hb_motel)
- Ve daha fazlası...

## 🚀 Kurulum

### Gereksinimler

- FiveM Server Artifacts (Linux/Windows)
- MySQL/MariaDB 10.x veya üzeri
- En az 4GB RAM
- En az 20GB disk alanı

### Adım 1: Repository'yi Klonlayın

```bash
git clone https://github.com/swaffX/fivemxd.git
cd fivemxd
```

### Adım 2: FiveM Server Artifacts İndirin

#### Linux:
```bash
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/latest/fx.tar.xz
tar xf fx.tar.xz
rm fx.tar.xz
```

#### Windows:
https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/ adresinden son sürümü indirin.

### Adım 3: Veritabanı Kurulumu

```bash
# MySQL'e giriş yapın
mysql -u root -p

# Veritabanı oluşturun
CREATE DATABASE temelPaket CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# Kullanıcı oluşturun
CREATE USER 'fivem'@'localhost' IDENTIFIED BY 'güvenli_şifre';
GRANT ALL PRIVILEGES ON temelPaket.* TO 'fivem'@'localhost';
FLUSH PRIVILEGES;
EXIT;

# SQL dosyasını import edin
mysql -u root -p temelPaket < temelpaket.sql
```

### Adım 4: Server Konfigürasyonu

```bash
# server.cfg.example dosyasını kopyalayın
cp data/server.cfg.example data/server.cfg

# server.cfg dosyasını düzenleyin
nano data/server.cfg
```

Düzenlemeniz gerekenler:
- `sv_licenseKey` - https://keymaster.fivem.net adresinden alın
- `mysql_connection_string` - Veritabanı bilgilerinizi girin
- `sv_hostname` - Sunucu adınızı girin
- Admin izinleri için FiveM ve Discord ID'lerinizi ekleyin

### Adım 5: Sunucuyu Başlatın

#### Linux:
```bash
./run.sh +exec data/server.cfg
```

#### Windows:
```cmd
FXServer.exe +exec data/server.cfg
```

## 🔧 VPS Kurulumu

Detaylı VPS kurulum talimatları için `VPS_AKTARIM_REHBERI.md` dosyasına bakın.

### Hızlı VPS Kurulumu (Linux)

```bash
# VPS'te çalıştırın
bash vps_setup.sh
```

## 📁 Proje Yapısı

```
.
├── artifacts/          # FiveM server binary dosyaları
├── data/              # Ana sunucu dosyaları
│   ├── resources/     # Tüm kaynaklar
│   │   ├── [alan]/    # Özel kaynaklar
│   │   ├── [qb]/      # QBCore kaynakları
│   │   ├── [standalone]/ # Bağımsız kaynaklar
│   │   └── [voice]/   # Ses kaynakları
│   └── server.cfg     # Sunucu konfigürasyonu
├── txData/            # FiveM transaction data
└── temelpaket.sql     # Veritabanı şeması
```

## 🔐 Güvenlik

- `server.cfg` dosyasını asla GitHub'a yüklemeyin
- Güçlü veritabanı şifreleri kullanın
- Düzenli yedekleme yapın
- Güvenlik duvarı kurallarını yapılandırın

## 📝 Lisans

Bu proje QBCore framework kullanmaktadır. QBCore lisansı için [QBCore GitHub](https://github.com/qbcore-framework) sayfasını ziyaret edin.

## 🤝 Katkıda Bulunma

1. Fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add some amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request açın

## 📞 Destek

Sorularınız için issue açabilirsiniz.

## ⚠️ Önemli Notlar

- İlk kurulumda `server.cfg.example` dosyasını `server.cfg` olarak kopyalayın
- Lisans anahtarınızı mutlaka güncelleyin
- Veritabanı bağlantı bilgilerini doğru girin
- Artifacts klasöründeki DLL dosyaları GitHub'a yüklenmez (boyut nedeniyle)
