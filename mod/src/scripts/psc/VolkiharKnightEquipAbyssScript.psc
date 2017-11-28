Scriptname VolkiharKnightEquipAbyssScript extends ObjectReference  

Spell Property VolkiharKnightArmorEffectAbysswalkerSpell auto
GlobalVariable Property VolkiharKnightArmorPiecesWorn auto
GlobalVariable Property VolkiharKnightCuirassType auto

Event OnEquipped(Actor akActor)
    If (akActor == Game.GetPlayer())
        ;Make sure previous unequip finishes first when switching cuirass types
        Utility.WaitMenuMode(0.5)

        float NumWornBefore = VolkiharKnightArmorPiecesWorn.GetValue()
        float NumWorn = NumWornBefore + 1

        If (NumWorn <= 4)
            ;Allows unequipping everything to reset the count if need be
            VolkiharKnightArmorPiecesWorn.SetValue(NumWorn)
        Else
            ;Reset the count if it has previously desynced
            VolkiharKnightArmorPiecesWorn.SetValue(4)
        EndIf

        VolkiharKnightCuirassType.SetValue(2)

        If (VolkiharKnightArmorPiecesWorn.GetValue() == 4)
            akActor.AddSpell(VolkiharKnightArmorEffectAbysswalkerSpell)
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
            ;Reset the count if it has previously desynced
            VolkiharKnightArmorPiecesWorn.SetValue(0)
        EndIf

        VolkiharKnightCuirassType.SetValue(0)
        akActor.RemoveSpell(VolkiharKnightArmorEffectAbysswalkerSpell)
    EndIf
EndEvent