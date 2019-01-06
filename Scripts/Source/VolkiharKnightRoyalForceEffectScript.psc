Scriptname VolkiharKnightRoyalForceEffectScript extends activemagiceffect
{Handles visual, audio, and spell effects for the Royal Guard cuirass}

Spell property VolkiharKnightArmorEffectRoyalDrainSpell Auto
VisualEffect property ForceEffect Auto
VisualEffect property ForceEffectSecondary Auto
Sound property BlastBackSound Auto
Actor property PlayerRef Auto

event OnEffectStart(Actor akTarget, Actor akCaster)
  int force = 12
  float effectDuration = 1.0
  float effectDurationSecondary = 2.0

  PlayerRef.PushActorAway(akTarget, force)
  VolkiharKnightArmorEffectRoyalDrainSpell.Cast(PlayerRef, akTarget)

  ;Play sound and visual effects
  ForceEffect.Play(PlayerRef, effectDuration)
  ForceEffectSecondary.Play(PlayerRef, effectDurationSecondary)
  int BlastSoundInstance = BlastBackSound.Play(PlayerRef)
  Utility.Wait(2.0)
  Sound.StopInstance(BlastSoundInstance)
endEvent
