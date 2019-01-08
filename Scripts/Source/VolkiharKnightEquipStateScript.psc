Scriptname VolkiharKnightEquipStateScript
{Shared equip state functions}

function updateEquipState(Actor akActor, FormList armorList, FormList cuirassList, FormList spellList) global
	int armorIndex = armorList.GetSize()
	int numEquipped = 0
	int cuirassType = -1
	Debug.Notification("equip state ckeck")

	int spellIndex = spellList.GetSize()

	while spellIndex
		spellIndex -= 1
		Spell effectSpell = spellList.GetAt(spellIndex) As Spell
		akActor.RemoveSpell(effectSpell)
	endWhile

	while armorIndex
		armorIndex -= 1
		Form akItem = armorList.GetAt(armorIndex) As Form

		;Player is wearing a VK piece from the FormList
		if (akActor.IsEquipped(akItem))
			numEquipped += 1

			;Set VK cuirass type if the piece is a cuirass
			if (cuirassList.HasForm(akItem))
				cuirassType = cuirassList.Find(akItem)
			endif
		endif
	EndWhile

	if (numEquipped >= 4)
		Debug.Notification("applied")
		Spell EqupiSpell = spellList.GetAt(cuirassType) As Spell
		akActor.AddSpell(EqupiSpell)
	endif
endFunction
