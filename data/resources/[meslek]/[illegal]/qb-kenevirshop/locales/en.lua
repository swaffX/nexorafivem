local Translations = {
    error = {
        negative = 'Negatif bir miktar satmaya çalıştınız?',
        no_melt = 'Bana eritecek bir şey vermedin...',
        no_items = 'Yeterli eşya yok',
    },
    success = {
        sold = 'Başarıyla $%{value3} fiyatına %{value} x %{value2} sattınız',
        items_received = 'Aldınız: %{value} x %{value2}',
    },
    info = {
        title = 'Kenevir Sat',
        subject = 'Eşya Eritme',
        message = 'Eşyalarınızı eritmeyi bitirdik. Gelip herhangi bir zamanda onları alabilirsiniz.',
        open_pawn = 'Satış Marketini Aç',
        sell = 'Eşyaları Sat',
        sell_pawn = 'Kenevirleri buraya sat',
        melt = 'Eşyaları Erit',
        melt_pawn = 'Eritme Marketini Aç',
        melt_pickup = 'Eritilen Eşyaları Al',
        pawn_closed = 'Eritme merkezi kapalı. Mesai saatleri: %{value}:00 AM - %{value2}:00 PM',
        sell_items = 'Satış Fiyatı $%{value}',
        back = '⬅ Geri Dön',
        melt_item = 'Erit %{value}',
        max = 'Max Miktar %{value}',
        submit = 'Sat',
        melt_wait = 'Bana %{value} dakika ver eşyalarını eriteceğim.',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})