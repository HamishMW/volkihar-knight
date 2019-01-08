Scriptname VolkiharKnightEquipScript extends ObjectReference
{Handles equip events on armor items}

Import VolkiharKnightEquipStateScript

Actor property PlayerRef auto
FormList property VolkiharKnightArmorFLST Auto
FormList property VolkiharKnightCuirassFLST Auto
FormList property VolkiharKnightArmorEffectFLST Auto

function onEquipUnequip(Actor akActor)
	VolkiharKnightEquipStateScript.updateEquipState(akActor, VolkiharKnightArmorFLST, VolkiharKnightCuirassFLST, VolkiharKnightArmorEffectFLST)
endFunction

event OnUnequipped(Actor akActor)
	if akActor == PlayerRef
		onEquipUnequip(akActor)
	endif
endevent

event OnEquipped(Actor akActor)
	if akActor == PlayerRef
		int armorIndex = VolkiharKnightArmorFLST.GetSize()
		onEquipUnequip(akActor)
	endif
endevent
