Scriptname VolkiharKnightUpdateScript extends Quest
{Quest to handle updating mod version and save game load}

Actor property PlayerRef auto
FormList property VolkiharKnightArmorFLST Auto
FormList property VolkiharKnightCuirassFLST Auto
FormList property VolkiharKnightArmorEffectFLST Auto

import VolkiharKnightEquipStateScript
float version

event OnInit()
  ;OnPlayerLoadGame will not fire the first time
	Maintenance()
endEvent

function Maintenance()
	if version < 1.0
		version = 1.0
		Debug.Notification("Now running Volkihar Knight 1.0.0")

    ;Update equip state on update
    VolkiharKnightEquipStateScript.updateEquipState(PlayerRef, VolkiharKnightArmorFLST, VolkiharKnightCuirassFLST, VolkiharKnightArmorEffectFLST)
	endIf
endFunction
