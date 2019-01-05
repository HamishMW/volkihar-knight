Scriptname VolkiharKnightEquipScript extends ObjectReference
{Handles equip events on armor items}

Import VolkiharKnightEquipStateScript

FormList property VolkiharKnightArmorFLST Auto
FormList property VolkiharKnightCuirassFLST Auto
FormList property VolkiharKnightArmorEffectFLST Auto

event OnInit()
  Debug.Notification("equip init")
endEvent

function onEquipUnequip(Actor akActor)
	VolkiharKnightEquipStateScript.updateEquipState(akActor, VolkiharKnightArmorFLST, VolkiharKnightCuirassFLST, VolkiharKnightArmorEffectFLST)
endFunction

event OnUnequipped(Actor akActor)
	Debug.Notification("unequip")
	if akActor == Game.getPlayer()
		onEquipUnequip(akActor)
	endif
endevent

event OnEquipped(Actor akActor)
	Debug.Notification("equip")
	if akActor == Game.getPlayer()
		Debug.Notification("equip is player")
		int armorIndex = VolkiharKnightArmorFLST.GetSize()
		Debug.Notification("okay" + armorIndex)
		onEquipUnequip(akActor)
	endif
endevent
