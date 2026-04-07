#!/bin/bash
# Post-start script for txAdmin
# Restarts swx-youtube-extractor service when FiveM server starts

LOG_FILE="/home/fivem/scripts/post-start.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$DATE] Post-start script çalıştırılıyor..." >> $LOG_FILE

# YouTube extractor servisini restart et
echo "[$DATE] swx-youtube-extractor servisi restart ediliyor..." >> $LOG_FILE
systemctl restart swx-youtube-extractor

# Servis durumunu kontrol et
sleep 2
if systemctl is-active --quiet swx-youtube-extractor; then
    echo "[$DATE] swx-youtube-extractor servisi başarıyla başlatıldı" >> $LOG_FILE
else
    echo "[$DATE] HATA: swx-youtube-extractor servisi başlatılamadı" >> $LOG_FILE
    systemctl status swx-youtube-extractor >> $LOG_FILE 2>&1
fi

echo "[$DATE] Post-start script tamamlandı" >> $LOG_FILE
