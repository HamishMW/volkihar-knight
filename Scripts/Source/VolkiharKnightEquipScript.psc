Scriptname VolkiharKnightEquipScript extends ObjectReference
{Handles equip events on armor items}

Import VolkiharKnightEquipStateScript

FormList property VolkiharKnightArmorFLST Auto
FormList property VolkiharKnightCuirassFLST Auto
FormList property VolkiharKnightArmorEffectFLST Auto

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
		int armorIndex = VolkiharKnightArmorFLST.GetSize()
		onEquipUnequip(akActor)
	endif
endevent
