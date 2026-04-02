Config = {}

--framework settings
Config.Framework = "auto" --options: "auto","esx","qb","qbox"

--language settings
Config.Language = "tr" --"tr" (Turkish), "en" (English)

--command settings
Config.Command = "fpsmenu"
Config.HelpText = "FPS Boost Menüsünü Aç"

--admin settings
--shared/admins.lua

--discord webhook logging
Config.Discord = {
    Enabled = true,
    WebhookURL = "https://discord.com/api/webhooks/1463294679792619655/CROO7d3nWrcYpR0xhQnrAG4AuQjR887eFdeq_i1e_F8Chb0fxj6LvQ8Bu5GmdhytGQPv", -- Buraya Discord webhook URL'nizi girin
    LogAdminAccess = true, -- admin panel open log
    LogUnauthorizedAttempts = true, -- authorize Log
    LogCleanupActions = true -- cleanup Log
}