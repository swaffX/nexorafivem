# Nexora Animpose

Emote kullanırken karakterinizin pozisyonunu ayarlamanızı sağlayan script.

## Özellikler

- ✅ GTA native instructional buttons (sağ altta tuş gösterimi)
- ✅ rpemotes ile tam uyumlu
- ✅ Emote animasyonunu bozmadan hareket
- ✅ Türkçe dil desteği
- ✅ Multiplayer sync
- ✅ UI/NUI yok, sadece native GTA arayüzü

## Kurulum

1. `nexora-animpose` klasörünü `resources/[standalone]/` içine kopyalayın
2. `server.cfg` dosyanıza `ensure nexora-animpose` ekleyin
3. Sunucuyu yeniden başlatın

## Kullanım

1. Bir emote kullanın (örn: `/e sit`)
2. `/animpose` komutunu kullanın
3. Tuşlarla pozisyonu ayarlayın:
   - **W/A/S/D**: İleri/Sol/Geri/Sağ hareket
   - **Arrow Up/Down**: Yukarı/Aşağı hareket
   - **E/Q**: Sola/Sağa dön
   - **Arrow Left/Right**: Hız azalt/arttır
   - **Enter**: Pozisyonu onayla
   - **Backspace**: İptal et (orijinal pozisyona dön)

## Yapılandırma

`config.lua` dosyasından ayarları değiştirebilirsiniz:

- Komut adı
- Hareket hızı
- Maksimum mesafe
- Dil metinleri

## Notlar

- Emote aktifken kullanılmalıdır
- Maksimum 10 birim uzaklaşabilirsiniz
- Diğer oyuncular pozisyon değişikliklerinizi görebilir
- Emote animasyonu korunur
