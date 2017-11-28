Scriptname VolkiharKnightEquipScript extends ObjectReference
{Handles effects applied by this armor}

Spell Property VolkiharKnightArmorEffectRoyalSpell auto
Spell Property VolkiharKnightArmorEffectAbysswalkerSpell auto
Spell Property VolkiharKnightArmorEffectAssassinSpell auto
GlobalVariable Property VolkiharKnightArmorPiecesWorn auto
GlobalVariable Property VolkiharKnightCuirassType auto

Event OnEquipped(Actor akActor)
    If (akActor == Game.GetPlayer())
        float NumWornBefore = VolkiharKnightArmorPiecesWorn.GetValue()
        float CuirassType = VolkiharKnightCuirassType.GetValue()
        float NumWorn = NumWornBefore + 1

        If (NumWorn <= 4)
            ;Allows unequipping everything to reset the count if need be
            VolkiharKnightArmorPiecesWorn.SetValue(NumWorn)
        Else
            ;Reset count if it has been previously desynced
            VolkiharKnightArmorPiecesWorn.SetValue(4)
        EndIf

        VolkiharKnightArmorPiecesWorn.SetValue(NumWorn)
	 
        If (NumWorn == 4 && CuirassType == 1)
            akActor.AddSpell(VolkiharKnightArmorEffectRoyalSpell)
        ElseIf(NumWorn == 4 && CuirassType == 2)
            akActor.AddSpell(VolkiharKnightArmorEffectAbysswalkerSpell)
        ElseIf(NumWorn == 4 && CuirassType == 3)
            akActor.AddSpell(VolkiharKnightArmorEffectAssassinSpell)
        EndIf
        
    EndIf
EndEvent

Event OnUnequipped(Actor akActor)
    If (akActor == Game.GetPlayer())
        float NumWorn2 = VolkiharKnightArmorPiecesWorn.GetValue()
        
        If (NumWorn2 > 0)
            ;Allows unequipping everything to reset the count if need be
            VolkiharKnightArmorPiecesWorn.SetValue(NumWorn2 - 1)
        Else
            ;Reset count if it has been previously desynced
            VolkiharKnightArmorPiecesWorn.SetValue(0)
        EndIf

        akActor.RemoveSpell(VolkiharKnightArmorEffectRoyalSpell)
        akActor.RemoveSpell(VolkiharKnightArmorEffectAbysswalkerSpell)
        akActor.RemoveSpell(VolkiharKnightArmorEffectAssassinSpell)
    EndIf
EndEvent