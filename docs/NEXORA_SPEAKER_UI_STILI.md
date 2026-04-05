# Nexora Speaker UI Stil Rehberi

## 📋 Genel Bakış

Bu dokümantasyon, nexora-speaker için oluşturduğumuz UI stilini ve menü yapısını açıklar. Bu stil, gelecekteki tüm UI geliştirmelerinde referans olarak kullanılacaktır.

---

## 🎨 UI Tasarım Prensipleri

### 1. **Hiyerarşik Menü Yapısı**
- Ana menü → Alt menüler → Eylem menüleri → Dialog'lar
- Her menü bir önceki menüye geri dönüş sağlar
- Kullanıcı her zaman nerede olduğunu bilir

### 2. **Açıklayıcı Başlıklar ve Açıklamalar**
- **Title**: Kısa ve net (örn: "Müzik çal")
- **Description**: Detaylı açıklama (örn: "Youtube videoları ve çalma listeleri destekleniyor.")
- **Icon**: Her seçenek için uygun FontAwesome ikonu

### 3. **Dinamik İçerik**
- Menüler gerçek zamanlı veri gösterir (örn: "Toplam 3 aktif filtre")
- Disabled state'ler mantıklı kullanılır (örn: playlist boşsa "Sonraki şarkı" disabled)
- Sayaçlar ve durumlar sürekli güncellenir

---

## 📱 Menü Yapısı Örnekleri

### Ana Menü Şablonu
```lua
function OpenMainMenu()
    lib.registerContext({
        id = 'main_menu',
        title = 'Ana Başlık',
        options = {
            {
                title = 'Seçenek 1',
                description = 'Açıklama metni',
                icon = 'play',
                onSelect = function()
                    SubMenu1()
                end
            },
            {
                title = 'Seçenek 2',
                description = 'Başka bir açıklama',
                icon = 'cog',
                disabled = false, -- Dinamik olabilir
                onSelect = function()
                    SubMenu2()
                end
            }
        }
    })
    
    lib.showContext('main_menu')
end
```

### Alt Menü Şablonu (Geri Dönüş ile)
```lua
function SubMenu()
    lib.registerContext({
        id = 'sub_menu',
        title = 'Alt Menü',
        menu = 'main_menu', -- Geri tuşu ile ana menüye döner
        options = {
            -- Seçenekler
        }
    })
    
    lib.showContext('sub_menu')
end
```

### Liste Menüsü (Dinamik İçerik)
```lua
function ListMenu()
    local options = {}
    
    for i, item in ipairs(dataList) do
        table.insert(options, {
            title = item.name,
            description = 'Detay: ' .. item.detail,
            icon = 'music',
            onSelect = function()
                ActionMenu(item)
            end
        })
    end
    
    lib.registerContext({
        id = 'list_menu',
        title = 'Liste (' .. #dataList .. ' öğe)',
        menu = 'parent_menu',
        options = options
    })
    
    lib.showContext('list_menu')
end
```

### Eylem Menüsü (Context Actions)
```lua
function ActionMenu(item)
    lib.registerContext({
        id = 'action_menu',
        title = 'Eylem seç',
        menu = 'list_menu',
        options = {
            {
                title = 'Şimdi çal',
                description = 'Bu öğeyi hemen kullan',
                icon = 'play',
                onSelect = function()
                    DoAction(item)
                end
            },
            {
                title = 'Sıraya ekle',
                description = 'Sıraya ekle',
                icon = 'list',
                onSelect = function()
                    AddToQueue(item)
                end
            },
            {
                title = 'Favori',
                description = 'Favorilere ekle',
                icon = 'star',
                onSelect = function()
                    AddToFavorites(item)
                end
            },
            {
                title = 'Sil',
                description = 'Bu öğeyi kaldır',
                icon = 'trash',
                onSelect = function()
                    DeleteItem(item)
                end
            }
        }
    })
    
    lib.showContext('action_menu')
end
```

---

## 🎯 Dialog Şablonları

### Basit Input Dialog
```lua
function SimpleInputDialog()
    local input = lib.inputDialog('Başlık', {
        {
            type = 'input',
            label = 'Alan Adı',
            description = 'Açıklama metni',
            required = true,
            icon = 'link'
        }
    })
    
    if input then
        local value = input[1]
        -- İşlem yap
    end
end
```

### Çoklu Alan Dialog
```lua
function MultiInputDialog()
    local input = lib.inputDialog('Başlık', {
        {
            type = 'input',
            label = 'URL',
            description = 'YouTube URL\'si girin',
            required = true,
            icon = 'link'
        },
        {
            type = 'input',
            label = 'İsim (Opsiyonel)',
            description = 'Öğe adını girin',
            icon = 'music'
        }
    })
    
    if input then
        local url = input[1]
        local name = input[2] or 'Varsayılan İsim'
        -- İşlem yap
    end
end
```

### Slider Dialog
```lua
function SliderDialog()
    local input = lib.inputDialog('Ayarlar', {
        {
            type = 'slider',
            label = 'Ses Seviyesi (0.10-1.5)',
            min = 10,
            max = 150,
            default = 50,
            required = true
        },
        {
            type = 'slider',
            label = 'Mesafe (1.0-75.0)',
            min = 10,
            max = 750,
            default = 300,
            required = true
        }
    })
    
    if input then
        local volume = input[1] / 100
        local distance = input[2] / 10
        -- İşlem yap
    end
end
```

### Number Input Dialog
```lua
function NumberInputDialog()
    local input = lib.inputDialog('Filtre Ayarları', {
        {
            type = 'number',
            label = 'Frequency',
            description = '10 ile 10000 arasında Hz',
            min = 10,
            max = 10000,
            default = 350,
            required = true,
            icon = 'signal'
        },
        {
            type = 'number',
            label = 'Gain',
            description = '-40 ile 40 arasında dB',
            min = -40,
            max = 40,
            default = 0,
            required = true,
            icon = 'volume-up'
        }
    })
    
    if input then
        local frequency = input[1]
        local gain = input[2]
        -- İşlem yap
    end
end
```

---

## 🔧 Nexora Speaker Menü Akışı

```
Ana Menü (Hoparlör etkileşimi)
├── Müzik çal → [Dialog: URL + İsim]
├── Müzik sıraya al → [Dialog: URL + İsim]
├── Sonraki şarkı → [Action]
├── Müziği duraklat/yeniden başlat → [Action]
├── Ses seviyesini/aralığını değiştir → [Dialog: Ses + Mesafe]
├── Hoparlörü tut → [Yakında]
├── Hoparlörü yerden al → [Yakında]
└── Diğer
    ├── Sırayı yönet
    │   ├── Müziği Durdur → [Action]
    │   ├── Playlist'i Göster
    │   │   └── [Şarkı] → Eylem seç
    │   │       ├── Şimdi çal
    │   │       └── Sıradan çıkar
    │   └── Playlist'i Temizle → [Action]
    │
    ├── Müzik geçmişi (Hoparlör geçmişi)
    │   └── [Şarkı] → Eylem seç
    │       ├── Şimdi çal
    │       ├── Sıraya ekle
    │       ├── Favori
    │       └── Geçmişten sil
    │
    ├── Filtreler (Hoparlör filtreleri)
    │   ├── Toplam X aktif filtre [Info]
    │   └── Yeni filtre → Filtre tipi
    │       ├── Lowpass → [Dialog: Freq + Gain + Detune]
    │       ├── Highshelf → [Dialog: Freq + Gain + Detune]
    │       ├── Peaking → [Dialog: Freq + Gain + Detune]
    │       ├── Highpass → [Dialog: Freq + Gain + Detune]
    │       ├── Notch → [Dialog: Freq + Gain + Detune]
    │       ├── Lowshelf → [Dialog: Freq + Gain + Detune]
    │       ├── Bandpass → [Dialog: Freq + Gain + Detune]
    │       └── Allpass → [Dialog: Freq + Gain + Detune]
    │
    ├── Bağlan → [Yakında]
    ├── Herkese açık durum → [Yakında]
    ├── Kalıcı durum → [Yakında]
    └── Hoparlörü yeniden adlandır → [Dialog: İsim]
```

---

## 💡 İyi Pratikler

### 1. **Disabled State Kullanımı**
```lua
{
    title = 'Sonraki şarkı',
    disabled = #playlist == 0, -- Playlist boşsa disabled
    onSelect = function()
        PlayNextSong()
    end
}
```

### 2. **Dinamik Başlıklar**
```lua
{
    title = 'Toplam ' .. activeCount .. ' aktif filtre.',
    description = 'Aktif filtreleri yönet',
    disabled = true -- Sadece bilgi gösterimi
}
```

### 3. **Geri Bildirim**
```lua
QBCore.Functions.Notify('İşlem başarılı!', 'success')
QBCore.Functions.Notify('Hata oluştu!', 'error')
QBCore.Functions.Notify('Bilgi mesajı', 'info')
```

### 4. **Veri Sınırlama**
```lua
-- Geçmişi 50 ile sınırla
if #musicHistory > 50 then
    table.remove(musicHistory, #musicHistory)
end
```

### 5. **Zaman Gösterimi**
```lua
local timeAgo = math.floor((GetGameTimer() - timestamp) / 1000)
local timeText = timeAgo < 60 and timeAgo .. ' saniye önce' 
                 or math.floor(timeAgo / 60) .. ' dakika önce'
```

---

## 🎨 Icon Önerileri

| Kategori | Icon | Kullanım |
|----------|------|----------|
| Müzik | `music`, `play`, `pause`, `stop` | Müzik kontrolleri |
| Liste | `list`, `bars` | Playlist, sıra |
| Ayarlar | `cog`, `sliders`, `volume-up` | Ayarlar menüleri |
| Filtre | `filter`, `wave-square` | Ses filtreleri |
| Eylemler | `forward`, `backward`, `repeat` | Şarkı kontrolleri |
| Sosyal | `star`, `heart`, `share` | Favori, paylaş |
| Durum | `lock`, `globe`, `link` | Durum göstergeleri |
| Silme | `trash`, `times` | Silme işlemleri |
| Ekleme | `plus`, `plus-circle` | Ekleme işlemleri |
| Bilgi | `info`, `question` | Bilgi gösterimi |

---

## 📝 Notlar

1. **ox_lib Context Menu** kullanıyoruz
2. Her menü `lib.registerContext()` ile oluşturulur
3. `lib.showContext()` ile gösterilir
4. `menu` parametresi geri dönüş için kullanılır
5. Dialog'lar `lib.inputDialog()` ile oluşturulur
6. `GetGameTimer()` kullan, `os.time()` FiveM'de çalışmaz!

---

## 🚀 Gelecek Projeler İçin

Bu UI stili şu projelerde kullanılacak:
- ✅ nexora-speaker (Tamamlandı)
- 🔄 Diğer araç sistemleri
- 🔄 Envanter UI'ları
- 🔄 Yönetim panelleri
- 🔄 Sosyal etkileşim menüleri

---

**Son Güncelleme**: 2026-04-05  
**Versiyon**: 1.0.0  
**Geliştirici**: Nexora RP Team
