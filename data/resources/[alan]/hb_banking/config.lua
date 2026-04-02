Config = {}

Config.UIOpener = 'atm'  -- Let the bank menu open with which code you type

Config.MaxLastTransactions = "20"   -- When the player opens the bank, the maximum number of last transactions can be loaded, a maximum of 20 can be entered

Config.dbMinAmount = 100  -- Inflate the 'database' minimum value for a transaction to be included in the database. You can set the visitors in front of your server

Config.openBankWithCom = false -- Specifies whether the bank will be opened by pressing E or by typing a command. Keeping false is recommended for optimization

Config.noCloseATM = "Yakınlarda hiç atm yok" -- When the player tries to open the ATM, if there is no ATM nearby, the error message will be displayed.

Config.Banks = {
{name = "Bank", id = 108, Location = vector4(149.53, -1042.19, 29.37, 337.93)},
{name = "Bank", id = 108, Location = vector4(-1211.95, -332.04, 37.78, 23.28)},
{name = "Bank", id = 108, Location = vector4(-2961.11, 482.9, 15.7, 85.76)},
{name = "Bank", id = 108, Location = vector4(-112.2, 6471.18, 31.63, 118.7)},
{name = "Bank", id = 108, Location = vector4(313.79, -280.51, 54.16, 333.79)},
{name = "Bank", id = 108, Location = vector4(-351.42, -51.37, 49.04, 334.6)},
{name = "Bank", id = 108, Location = vector4(248.86, 224.41, 106.29, 159.86)},
{name = "Bank", id = 108, Location = vector4(1174.99, 2708.3, 38.09, 183.56)},
}

Config.Atms = {
    [1] = -1126237515,
    [2] = 506770882,
    [3] = -870868698,
    [4] = 150237004,
    [5] = -239124254,
    [6] = -1364697528,
}