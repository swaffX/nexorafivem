# Nexora Speaker - Kalıcı Müzik Geçmişi

## 📋 Özellik Özeti

**Tarih**: 2026-04-05  
**Versiyon**: 1.2.0  
**Durum**: ✅ Tamamlandı

---

## 🎯 Özellik Açıklaması

Müzik geçmişi artık veritabanında saklanıyor. Sunucu restart olsa bile oyuncuların müzik geçmişi korunuyor.

### Özellikler
- ✅ Veritabanı entegrasyonu (MySQL)
- ✅ Oyuncu bazlı geçmiş (citizenid)
- ✅ Otomatik yükleme (spawn'da)
- ✅ Otomatik kaydetme (şarkı çalınca)
- ✅ 50 şarkı limiti (otomatik temizleme)
- ✅ Geçmişten silme
- ✅ Tüm geçmişi temizleme

---

## 🗄️ Veritabanı Yapısı

### Tablo: `speaker_history`

| Sütun | Tip | Açıklama |
|-------|-----|----------|
| `id` | INT(11) | Primary Key, Auto Increment |
| `citizenid` | VARCHAR(50) | Oyuncu ID (QBCore) |
| `url` | TEXT | YouTube URL |
| `title` | VARCHAR(255) | Şarkı adı |
| `played_at` | BIGINT(20) | Unix timestamp |

### İndeksler
- Primary Key: `id`
- Index: `citizenid` (hızlı sorgulama)
- Index: `played_at` (sıralama)

---

## 📥 Kurulum

### 1. SQL Tablosunu Oluştur

```sql
-- speaker_history.sql dosyasını çalıştır
-- Veya manuel olarak:

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

### 2. Resource'u Güncelle

Dosyalar zaten güncellenmiş durumda:
- ✅ `server.lua` - Database işlemleri
- ✅ `client.lua` - Yükleme/kaydetme
- ✅ `fxmanifest.lua` - oxmysql dependency

### 3. Restart

```
restart nexora-speaker
```

---

## 🔧 Teknik Detaylar

### Server Tarafı (server.lua)

#### 1. Geçmişi Yükle
```lua
RegisterNetEvent('nexora-speaker:server:loadHistory', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        local citizenid = Player.PlayerData.citizenid
        
        MySQL.Async.fetchAll('SELECT * FROM speaker_history WHERE citizenid = @citizenid ORDER BY played_at DESC LIMIT 50', {
            ['@citizenid'] = citizenid
        }, function(result)
            if result and #result > 0 then
                local history = {}
                for _, row in ipairs(result) do
                    table.insert(history, {
                        url = row.url,
                        title = row.title,
                        timestamp = row.played_at
                    })
                end
                TriggerClientEvent('nexora-speaker:client:receiveHistory', src, history)
            end
        end)
    end
end)
```

#### 2. Geçmişe Ekle
```lua
RegisterNetEvent('nexora-speaker:server:addToHistory', function(url, title)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        local citizenid = Player.PlayerData.citizenid
        local timestamp = os.time()
        
        MySQL.Async.execute('INSERT INTO speaker_history (citizenid, url, title, played_at) VALUES (@citizenid, @url, @title, @timestamp)', {
            ['@citizenid'] = citizenid,
            ['@url'] = url,
            ['@title'] = title,
            ['@timestamp'] = timestamp
        }, function(affectedRows)
            if affectedRows > 0 then
                -- Eski kayıtları temizle (50'den fazlaysa)
                MySQL.Async.execute([[
                    DELETE FROM speaker_history 
                    WHERE citizenid = @citizenid 
                    AND id NOT IN (
                        SELECT id FROM (
                            SELECT id FROM speaker_history 
                            WHERE citizenid = @citizenid 
                            ORDER BY played_at DESC 
                            LIMIT 50
                        ) AS temp
                    )
                ]], {
                    ['@citizenid'] = citizenid
                })
            end
        end)
    end
end)
```

#### 3. Geçmişten Sil
```lua
RegisterNetEvent('nexora-speaker:server:removeFromHistory', function(url, timestamp)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        local citizenid = Player.PlayerData.citizenid
        
        MySQL.Async.execute('DELETE FROM speaker_history WHERE citizenid = @citizenid AND url = @url AND played_at = @timestamp', {
            ['@citizenid'] = citizenid,
            ['@url'] = url,
            ['@timestamp'] = timestamp
        })
    end
end)
```

#### 4. Tüm Geçmişi Temizle
```lua
RegisterNetEvent('nexora-speaker:server:clearHistory', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        local citizenid = Player.PlayerData.citizenid
        
        MySQL.Async.execute('DELETE FROM speaker_history WHERE citizenid = @citizenid', {
            ['@citizenid'] = citizenid
        })
    end
end)
```

### Client Tarafı (client.lua)

#### 1. Spawn'da Yükle
```lua
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('nexora-speaker:server:loadHistory')
end)

RegisterNetEvent('nexora-speaker:client:receiveHistory', function(history)
    musicHistory = history
    historyLoaded = true
    print('[Nexora Speaker] Müzik geçmişi yüklendi: ' .. #musicHistory .. ' şarkı')
end)
```

#### 2. Şarkı Çalınca Kaydet
```lua
function PlayMusic(url, title)
    -- ... müzik çalma kodu
    
    -- Geçmişe ekle (local)
    local timestamp = os.time()
    table.insert(musicHistory, 1, {
        url = url,
        title = title or 'Bilinmeyen Şarkı',
        timestamp = timestamp
    })
    
    -- Server'a kaydet (kalıcı)
    TriggerServerEvent('nexora-speaker:server:addToHistory', url, title or 'Bilinmeyen Şarkı')
end
```

#### 3. Geçmişi Göster
```lua
function MusicHistoryMenu()
    if #musicHistory == 0 then
        QBCore.Functions.Notify('Müzik geçmişi boş!', 'error')
        return
    end
    
    local options = {}
    for i, song in ipairs(musicHistory) do
        -- Timestamp'i tarih formatına çevir
        local timeText = os.date('%d/%m/%Y %H:%M', song.timestamp)
        
        table.insert(options, {
            title = song.title,
            description = 'Çalındı: ' .. timeText,
            icon = 'music',
            onSelect = function()
                SongActionMenu(song)
            end
        })
    end
    
    -- Geçmişi temizle seçeneği
    table.insert(options, {
        title = 'Tüm geçmişi temizle',
        description = 'Tüm müzik geçmişini sil',
        icon = 'trash',
        onSelect = function()
            musicHistory = {}
            TriggerServerEvent('nexora-speaker:server:clearHistory')
            QBCore.Functions.Notify('Müzik geçmişi temizlendi', 'success')
        end
    })
    
    lib.registerContext({
        id = 'music_history_menu',
        title = 'Hoparlör geçmişi',
        menu = 'other_menu',
        options = options
    })
    
    lib.showContext('music_history_menu')
end
```

---

## 📊 Veri Akışı

```
Oyuncu Spawn
    ↓
Client: QBCore:Client:OnPlayerLoaded
    ↓
Server: nexora-speaker:server:loadHistory
    ↓
Database: SELECT * FROM speaker_history
    ↓
Server: nexora-speaker:client:receiveHistory
    ↓
Client: musicHistory = history
    ↓
Geçmiş Yüklendi ✅

---

Şarkı Çal
    ↓
Client: PlayMusic(url, title)
    ↓
Client: Local geçmişe ekle
    ↓
Server: nexora-speaker:server:addToHistory
    ↓
Database: INSERT INTO speaker_history
    ↓
Database: DELETE old records (>50)
    ↓
Kaydedildi ✅

---

Geçmişten Sil
    ↓
Client: SongActionMenu → Geçmişten sil
    ↓
Client: Local'den sil
    ↓
Server: nexora-speaker:server:removeFromHistory
    ↓
Database: DELETE FROM speaker_history
    ↓
Silindi ✅
```

---

## 🧪 Test Senaryoları

### ✅ Başarılı Testler
- [x] Spawn'da geçmiş yükleniyor
- [x] Şarkı çalınca kaydediliyor
- [x] Restart sonrası geçmiş korunuyor
- [x] 50 şarkı limiti çalışıyor
- [x] Geçmişten silme çalışıyor
- [x] Tüm geçmişi temizleme çalışıyor
- [x] Tarih formatı doğru gösteriliyor

### 📝 Test Adımları

#### Test 1: Yeni Kayıt
1. Oyuna gir
2. K tuşuna bas
3. Müzik çal
4. "Diğer" → "Müzik geçmişi"
5. Şarkı listede görünmeli

#### Test 2: Restart Sonrası
1. Müzik çal (birkaç şarkı)
2. Sunucuyu restart et
3. Tekrar gir
4. "Müzik geçmişi" aç
5. Şarkılar hala orada olmalı

#### Test 3: 50 Şarkı Limiti
1. 60 şarkı çal
2. Geçmişi kontrol et
3. Sadece son 50 şarkı olmalı

#### Test 4: Silme
1. Geçmişi aç
2. Bir şarkıya tıkla
3. "Geçmişten sil"
4. Şarkı kaybolmalı
5. Restart et
6. Şarkı hala silinmiş olmalı

---

## 📈 Performans

### Database Sorguları
- **Load**: 1 sorgu (spawn'da)
- **Save**: 2 sorgu (insert + cleanup)
- **Delete**: 1 sorgu
- **Clear**: 1 sorgu

### Optimizasyonlar
1. **İndeksler**: citizenid ve played_at indeksli
2. **Limit**: Her oyuncu max 50 şarkı
3. **Async**: Tüm sorgular asenkron
4. **Cleanup**: Otomatik eski kayıt temizleme

### Kaynak Kullanımı
- **Database**: ~5KB per player (50 songs)
- **Memory**: ~10KB client-side cache
- **Network**: Minimal (sadece spawn'da)

---

## 🔒 Güvenlik

### Önlemler
1. **Player Check**: Her işlemde QBCore player kontrolü
2. **Citizenid**: Oyuncu bazlı izolasyon
3. **SQL Injection**: Parametreli sorgular
4. **Limit**: 50 şarkı limiti (spam önleme)

---

## 🚀 Gelecek Geliştirmeler

### v1.3.0 İçin Planlar
- [ ] Favori sistemi (ayrı tablo)
- [ ] Playlist kaydetme
- [ ] Geçmiş paylaşma (arkadaşlarla)
- [ ] İstatistikler (en çok çalınan)

### v1.4.0 İçin Planlar
- [ ] Global geçmiş (tüm oyuncular)
- [ ] Trending şarkılar
- [ ] Şarkı önerileri
- [ ] Export/Import geçmiş

---

## 📝 Notlar

- Timestamp `os.time()` kullanıyor (Unix timestamp)
- Tarih formatı: `%d/%m/%Y %H:%M` (Türkçe format)
- oxmysql kullanılıyor (MySQL.Async)
- QBCore entegrasyonu gerekli

---

## 🐛 Sorun Giderme

### Geçmiş Yüklenmiyor
1. SQL tablosu oluşturuldu mu?
2. oxmysql çalışıyor mu?
3. Console'da hata var mı?

### Kaydetmiyor
1. QBCore player data var mı?
2. citizenid doğru mu?
3. Database bağlantısı var mı?

### Eski Kayıtlar Silinmiyor
1. Cleanup sorgusu çalışıyor mu?
2. 50'den fazla kayıt var mı?
3. SQL syntax hatası var mı?

---

**Versiyon**: 1.2.0  
**Durum**: ✅ Production Ready  
**Test Tarihi**: 2026-04-05  
**Geliştirici**: Nexora RP Team
