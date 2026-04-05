const express = require('express');
const cors = require('cors');
const { exec } = require('child_process');
const http = require('http');
const https = require('https');
const app = express();
const PORT = process.env.PORT || 3000;
const HOST = process.env.HOST || '0.0.0.0'; // Dışarıdan erişim için

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
                    
                    // URL'yi proxy üzerinden ver (direkt Google URL'si yerine)
                    const proxyUrl = `http://localhost:${PORT}/proxy?url=${encodeURIComponent(audioUrl)}`;
                    
                    res.json({
                        success: true,
                        url: proxyUrl,  // Proxy URL döndür
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

// Audio proxy endpoint - Googlevideo URL'lerini stream eder
app.get('/proxy', (req, res) => {
    const { url } = req.query;
    
    if (!url) {
        return res.status(400).json({ error: 'URL gerekli' });
    }
    
    console.log('[SWX Extractor] Proxy request:', url.substring(0, 100) + '...');
    
    try {
        const parsedUrl = new URL(url);
        const client = parsedUrl.protocol === 'https:' ? https : http;
        
        const options = {
            hostname: parsedUrl.hostname,
            port: parsedUrl.port || (parsedUrl.protocol === 'https:' ? 443 : 80),
            path: parsedUrl.pathname + parsedUrl.search,
            method: 'GET',
            headers: {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                'Accept': 'audio/*;q=0.9,*/*;q=0.8',
                'Accept-Encoding': 'identity',
                'Connection': 'keep-alive'
            }
        };
        
        const proxyReq = client.request(options, (proxyRes) => {
            // CORS headers
            res.header('Access-Control-Allow-Origin', '*');
            res.header('Access-Control-Allow-Methods', 'GET, OPTIONS');
            res.header('Access-Control-Allow-Headers', 'Content-Type, Range');
            res.header('Accept-Ranges', 'bytes');
            
            // Content headers
            if (proxyRes.headers['content-type']) {
                res.header('Content-Type', proxyRes.headers['content-type']);
            } else {
                res.header('Content-Type', 'audio/mp4');
            }
            
            if (proxyRes.headers['content-length']) {
                res.header('Content-Length', proxyRes.headers['content-length']);
            }
            
            // Range support için
            if (proxyRes.headers['accept-ranges']) {
                res.header('Accept-Ranges', proxyRes.headers['accept-ranges']);
            }
            
            res.writeHead(proxyRes.statusCode);
            proxyRes.pipe(res);
        });
        
        proxyReq.on('error', (err) => {
            console.error('[SWX Extractor] Proxy error:', err.message);
            res.status(500).json({ error: 'Proxy hatası' });
        });
        
        proxyReq.end();
    } catch (err) {
        console.error('[SWX Extractor] Proxy setup error:', err);
        res.status(500).json({ error: 'Sunucu hatası' });
    }
});

// Health check
app.get('/health', (req, res) => {
    res.json({ status: 'ok', service: 'SWX YouTube Extractor' });
});

app.listen(PORT, HOST, () => {
    console.log(`[SWX Extractor] Server running on ${HOST}:${PORT}`);
    console.log(`[SWX Extractor] Health check: http://${HOST}:${PORT}/health`);
    console.log(`[SWX Extractor] Extract: http://${HOST}:${PORT}/extract?url=YOUTUBE_URL`);
    console.log(`[SWX Extractor] Proxy: http://${HOST}:${PORT}/proxy?url=AUDIO_URL`);
});
