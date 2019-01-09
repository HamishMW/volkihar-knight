# Changelog

Release message:

Volkihar Knight 1.0.0 release

Kept you waiting huh? Welcome to 1.0.0. It addresses many of the missing features and issues of the inital release. It's safe to update on existing saves, but there are some changes to be aware of:

[*]There are now basic armor sets with no bonus effects, and legendary versions that confer a bonus when all pieces are worn.
[*]Any previously crafted armor will no longer receive the set bonus - only the legendary sets have the scripted effects. You must visit Volkihar Keep Cathedral after confronting Harkon (at the start of Kindred Judgment). There will be a chest behind the Molag Bal altar containing the Legendary Volkihar Knight armor. If you've previously completed Kindred Judgement the chest will still appear.
[*]If you had the light armor patch installed, your armor will change to heavy armor. You will have to craft the armor again. Light armor is now included in the main plugin, so you no longer need a patch.
[*]Specific mod patches are no longer needed. It's now compatible with all vampire overhauls.

Be sure to check out the changelog for a full list of changes.

## Version 1.0.0
- Weight slider support
- Improved textures
- New gauntlets design
- Reworked UV maps and condensed textures into fewer files to improve performance (note any retextures will need to be updated to align with the new UVs for the robes)
- Added female boot and gauntlet meshes
- Fixed female first person view textures
- Changed the Abysswalker effect. The new effect is Volkihar Knight: Embrace of the Abyss. The effect still muffles footsteps, but now drains a small portion of health, magicka, and stamina from nearby enemies while in sunlight instead of cancelling out the weakness to sunlight effect.
- !Added light armor version to the main plugin
- Removed specific patches for Better Vampires and Sacrosanct. The new Abysswalker effect does not change any existing effects or effects modified by vampire overhauls, so it should be compatible with everything.
- Changed craftable versions to have no scripted set bonus effects
- Added unique legendary sets to a chest in Volkihar Keep Cathedral (legendary armor applies the set bonus when 4 pieces are worn). Only appears after you have confronted Harkon in the quest Kindred Judgement.
- Added descriptions to the legendary armor pieces
- Legendary sets are no longer craftable - there is now only one of each.
- Previously crafted Volkihar Knight armor is now the standard version with no set bonus.
- Refactored equip script to fix previous issues with equipping and set bonus effects being applied/removed.
- Removed the fomod installer, it's no longer needed now that the patches are obsolete.
- Removed dirty edits from the esp
- Volkihar Knight is now open source. The mod's source scripts, meshes, and textures are on GitHub https://github.com/HamishMW/volkihar-knight/

## Version 0.3.2
- Unequipping and re-equipping all armor should now fix any issues with effects not being applied
- Fix a minor bug with the light armor option

## Version 0.3.1
- Pack assets into BSA archives
- Update scripts to prevent equipping issues
- Update Of Royal Blood effect description to match the new effect
- Add a patch for Better Vampires

## Version 0.3.0
- Improve the Royal Guard bonus effect. It now has a chance to force push melee attackers and drain their health
- Improve the Assassin stealth effect. The effect no longer dispels when interacting with objects
- General script improvements; should fix any problems with effects occasionally not being applied correctly
- Skyrim Classic version release http://www.nexusmods.com/skyrim/mods/80634/
- Fix a bug with the Sacrosanct patch where only the Abysswalker cuirass was required to regen in sunlight

## Version 0.2.0
- Add beast race support for the hood
- Allow equipped circlets to be visible under the hood
- Add an optional light armor version

## Version 0.1.0
- Initial upload
