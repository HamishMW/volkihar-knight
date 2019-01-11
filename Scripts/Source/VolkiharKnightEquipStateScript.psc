Scriptname VolkiharKnightEquipStateScript
{Shared equip state functions}

function updateEquipState(Actor akActor, FormList armorList, FormList cuirassList, FormList spellList) global
	int armorIndex = armorList.GetSize()
	int numEquipped = 0
	int cuirassIndex = -1

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
				cuirassIndex = cuirassList.Find(akItem)
			endif

			;Light cuirasses are double the index in the Formlist
			if cuirassIndex > 2
				cuirassIndex = cuirassIndex - 3
			endif
		endif
	EndWhile

	if (numEquipped >= 4)
		Spell EqupiSpell = spellList.GetAt(cuirassIndex) As Spell
		akActor.AddSpell(EqupiSpell)
	endif
endFunction
