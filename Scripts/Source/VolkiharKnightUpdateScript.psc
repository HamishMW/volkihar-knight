ScriptName VolkiharKnightUpdateScript extends Quest
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
	if version < 0.4
		version = 0.4
		Debug.Notification("Now running Volkihar Knight " + version)
	endIf

  ;Update equip state on load
  VolkiharKnightEquipStateScript.updateEquipState(PlayerRef, VolkiharKnightArmorFLST, VolkiharKnightCuirassFLST, VolkiharKnightArmorEffectFLST)
endFunction
