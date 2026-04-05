const express = require('express');
const cors = require('cors');
const { exec } = require('child_process');
const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// YouTube audio extract endpoint
app.get('/extract', async (req, res) => {
    const { url } = req.query;
    
    if (!url) {
        return res.status(400).json({ error: 'URL gerekli' });
    }
    
    console.log('[SWX Extractor] Processing:', url);
    
    try {
        // yt-dlp ile ses URL'sini çıkar
        const command = `yt-dlp -f "bestaudio[ext=m4a]/bestaudio" --dump-json --no-download "${url}"`;
        
        exec(command, { timeout: 15000 }, (error, stdout, stderr) => {
            if (error) {
                console.error('[SWX Extractor] Error:', error.message);
                return res.status(500).json({ error: 'Ses çıkarılamadı', details: error.message });
            }
            
            try {
                const data = JSON.parse(stdout);
                
                // Ses URL'sini bul
                let audioUrl = null;
                
                // Önce m4a formatını ara
                if (data.formats) {
                    for (const format of data.formats) {
                        if (format.ext === 'm4a' && format.url) {
                            audioUrl = format.url;
                            break;
                        }
                    }
                    
                    // m4a bulunamadıysa webm ara
                    if (!audioUrl) {
                        for (const format of data.formats) {
                            if (format.ext === 'webm' && format.url && format.audio_channels) {
                                audioUrl = format.url;
                                break;
                            }
                        }
                    }
                }
                
                if (audioUrl) {
                    console.log('[SWX Extractor] Audio URL found:', audioUrl.substring(0, 100) + '...');
                    res.json({
                        success: true,
                        url: audioUrl,
                        title: data.title || 'YouTube Video',
                        duration: data.duration || 0
                    });
                } else {
                    console.error('[SWX Extractor] No audio URL found');
                    res.status(404).json({ error: 'Ses formatı bulunamadı' });
                }
            } catch (parseError) {
                console.error('[SWX Extractor] JSON parse error:', parseError);
                res.status(500).json({ error: 'JSON parse hatası' });
            }
        });
    } catch (err) {
        console.error('[SWX Extractor] Error:', err);
        res.status(500).json({ error: 'Sunucu hatası' });
    }
});

// Health check
app.get('/health', (req, res) => {
    res.json({ status: 'ok', service: 'SWX YouTube Extractor' });
});

app.listen(PORT, () => {
    console.log(`[SWX Extractor] Server running on port ${PORT}`);
    console.log(`[SWX Extractor] Health check: http://localhost:${PORT}/health`);
    console.log(`[SWX Extractor] Extract: http://localhost:${PORT}/extract?url=YOUTUBE_URL`);
});
