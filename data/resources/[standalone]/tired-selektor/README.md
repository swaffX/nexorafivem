**Tired-Selektor**

![FiveM](https://img.shields.io/badge/PLATFORM-FIVEM-orange?style=for-the-badge&logo=fivem&logoColor=white)
![Lua](https://img.shields.io/badge/LANGUAGE-LUA-blue?style=for-the-badge&logo=lua&logoColor=white)
![Standalone](https://img.shields.io/badge/FRAMEWORK-STANDALONE-success?style=for-the-badge)

> "Control the night." A lightweight, kernel-level inspired vehicle headlight flasher designed for seamless integration and zero latency.

**Tired-Selektor** operates directly within the client thread, injecting custom key listeners to manipulate vehicle lighting states instantly. Unlike heavy resource scripts, Selektor runs with **0.00ms idle usage**, ensuring zero performance impact on your client-side tick loop.

### :zap: Operational Capabilities

* **Instant Trigger:** Intercepts key presses (Default: `TAB`) for immediate high-beam response.
* **State Retention:** Intelligently caches the previous headlight state (Off, Low, High) and restores it post-sequence.
* **Variable Speed:** Custom tick-rate definitions allow for precise control over flash duration and frequency.
* **Standalone Architecture:** No external dependencies. Deploys on any server environment (ESX, QB, Custom) without bridge layers.

### Preview : https://www.youtube.com/watch?v=ShiFMcdJDpQ

### :gear: Configuration (client/main.lua)

```lua
Config = {}

-- [CORE SETTINGS]
Config.Keybind = 37      -- Interaction Key (Default: TAB / Input Index)

-- [SEQUENCE SETTINGS]
Config.FlashCount = 3    -- Total cycle count per trigger
Config.FlashSpeed = 150  -- Thread sleep duration in ms (lower = faster)

