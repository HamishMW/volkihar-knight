Scriptname VolkiharKnightEquipScript extends ObjectReference
{Handles application and removal of spell effects}

Actor property PlayerREF Auto
FormList property VolkiharKnightArmorFLST Auto
FormList property VolkiharKnightCuirassFLST Auto
FormList property VolkiharKnightArmorEffectFLST Auto

function RemoveArmorSpells(Actor akActor)
	int iIndex = VolkiharKnightArmorEffectFLST.GetSize()
	while iIndex
		iIndex -= 1
		Spell effectSpell = VolkiharKnightArmorEffectFLST.GetAt(iIndex) As Spell
		akActor.RemoveSpell(effectSpell)
	endWhile
endFunction

function UpdateEquipState(Actor akActor)
	int iIndex = VolkiharKnightArmorFLST.GetSize()
	int equipped = 0
	int cuirassType = -1

	while iIndex
		iIndex -= 1
		Form akItem = VolkiharKnightArmorFLST.GetAt(iIndex) As Form
		
		;Player is wearing a VK piece from the FormList
		if (akActor.IsEquipped(akItem))
			equipped += 1
			Debug.Notification("Yep")

			;Set VK cuirass type if the piece is a cuirass
			if (VolkiharKnightCuirassFLST.HasForm(akItem))
				cuirassType = VolkiharKnightCuirassFLST.Find(akItem)
			endif
		else
			Debug.Notification("Nope")
		endif
	EndWhile

	if (equipped >= 4)
		;TODO find out how to make this work
		;akActor.AddSpell(VolkiharKnightArmorEffectFLST[cuirassType])
	Else 
		RemoveArmorSpells(akActor)
	endif
endFunction

event OnUnequipped(Actor akActor)
	if (akActor == PlayerREF)
		UpdateEquipState(akActor)
	endif
endevent

event OnEquipped(Actor akActor)
	if akActor == PlayerREF
		UpdateEquipState(akActor)
	endif
endevent
