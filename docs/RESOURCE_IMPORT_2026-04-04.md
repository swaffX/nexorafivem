# Resource Import 2026-04-04

This note documents the large resource merge imported from:

`C:\Users\oguz\Desktop\full\txData\QBCoreFramework_7334A3.base\resources`

## Imported Categories

- `[exe-eklenti]`: `ak4y-spawnselector`, `carwash`, `izzy_loading`, `police-radar`, `repair`, `rpemotes`, `torpak-policemegaphone`
- `[maps]`: all source maps
- `[meslek][illegal]`: all source illegal jobs
- `[meslek][legal]`: `kaves_mechanic`, `galer`, `qb-taxijob`
- `[meslek][soygun]`: all source robbery resources
- `[qb]`: `fivem-appearance`, `qb-doorlock`, `qb-garages`, `qb-inventory`, `qb-radialmenu`, `qb-shops`
- `[standalone]`: `renkliharita`, `CarryPeople`
- `[arabalar]`: all source vehicle resources except `xsound`

## Replaced Resources

The following older resources were moved out of the active tree into:

`data/_replaced_resources/2026-04-04`

- `data/resources/[alan]/hb_loading` -> replaced by `izzy_loading`
- `data/resources/[meslek]/dpemotes` -> replaced by `rpemotes`
- `data/resources/[standalone]/cylex_animmenu` -> disabled to avoid emote overlap
- `data/resources/[meslek]/qb-carwash` -> replaced by `carwash`
- `data/resources/[qb]/qb-smallresources/client/carwash.lua` -> moved out to avoid double carwash logic
- `data/resources/[alan]/hb_mechanic` -> replaced by `kaves_mechanic`
- `data/resources/[alan]/hb_vehicleshop` -> replaced by `galer`
- `data/resources/[standalone]/cylex_garage` -> replaced by `qb-garages`
- `data/resources/[standalone]/radialmenu` -> replaced by `qb-radialmenu`
- `data/resources/[standalone]/illenium-appearance` -> replaced by `fivem-appearance`
- `data/resources/[meslek]/quadro_kucakomuz` -> replaced by `CarryPeople`
- `data/resources/[qb]/qb-doorlock` -> replaced by source version
- `data/resources/[qb]/qb-inventory` -> replaced by source version
- `data/resources/[defaultmaps]/[prison_map]` -> replaced by source `[maps]/[prison_map]`

## Special Notes

- `xsound` was not copied into `[arabalar]` because the project already had `data/resources/[standalone]/xsound`. Keeping both would create a duplicate resource name conflict.
- `data/server.cfg` was updated to use `start izzy_loading` and to ensure `[maps]`, `[meslek]`, `[mlo]`, `[arabalar]`, and `[exe-eklenti]`.
- `data/resources/[alan]/hb_multicharacter/config.lua` was switched from `illenium-appearance` to `fivem-appearance`.
- `data/restart_resources.cfg` now references `qb-radialmenu`, `carwash`, and `rpemotes`.

## SQL Files To Review

These SQL files exist in the active resource tree after the import:

- `data/resources/[meslek]/[illegal]/qb-drugs/qb-drugs.sql`
- `data/resources/[meslek]/[illegal]/qb-weed/qb-weed.sql`
- `data/resources/[meslek]/[legal]/kaves_mechanic/kaves_mechanic.sql`
- `data/resources/[qb]/fivem-appearance/sql/management_outfits.sql`
- `data/resources/[qb]/fivem-appearance/sql/player_outfits.sql`
- `data/resources/[qb]/qb-garages/database.sql`
- `data/resources/[qb]/qb-garages/patch1.sql`
- `data/resources/[qb]/qb-inventory/qb-inventory.sql`

Review these before production deployment if the target database has not already been prepared.

## Known Follow-Up Risk

`ak4y-spawnselector` was imported as requested, but its original source package is designed to work with `ak4y-multicharacter`. The current project still uses `hb_multicharacter`, so spawn-selector behavior should be validated in-game before deployment.
