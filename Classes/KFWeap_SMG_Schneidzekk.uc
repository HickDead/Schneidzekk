//=============================================================================
// KFWeap_SMG_Schneidzekk
//=============================================================================
// http://wiki.tripwireinteractive.com/index.php?title=Schneidzekk_Medic_Gun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 HickDead
//  - HickDead 2017.08.18
//=============================================================================

class KFWeap_SMG_Schneidzekk extends KFWeap_MedicBase;

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_SMG;
}

defaultproperties
{
	// Healing charge
	HealAmount=15
	HealFullRechargeSeconds=10

	// Inventory
	InventorySize=3
	GroupPriority=75
	WeaponSelectTexture=Texture2D'WEP_UI_KRISS_TEX.UI_WeaponSelect_KRISS'
	SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'

	// FOV
	MeshFOV=86
	MeshIronSightFOV=45
	PlayerIronSightFOV=75

	// Zooming/Position
	IronSightPosition=(X=15.f,Y=0.f,Z=0.0f)
	PlayerViewOffset=(X=20.f,Y=9.5f,Z=-3.0f)

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'wep_1p_kriss_mesh.Wep_1stP_KRISS_Rig'
		AnimSets(0)=AnimSet'wep_1p_kriss_anim.wep_1p_kriss_anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'wep_3p_kriss_mesh.Wep_KRISS_Pickup'
	End Object

	AttachmentArchetype=KFWeaponAttachment'wep_kriss_arch.Wep_KRISS_3P'
	//SpectatorWeaponArchetype=KFWeaponAttachment'wep_kriss_arch.Wep_KRISS_3P'

	// Ammo
	MagazineCapacity[0]=33
	SpareAmmoCapacity[0]=300
	InitialSpareMags[0]=5
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=50
	minRecoilPitch=40
	maxRecoilYaw=75
	minRecoilYaw=-75
	RecoilRate=0.045
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=1.85
	WalkingRecoilModifier=1.1
	JoggingRecoilModifier=1.2

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_Kriss'
	FireInterval(DEFAULT_FIREMODE)=+.06 //? 952 RPM
	Spread(DEFAULT_FIREMODE)=0.01
	InstantHitDamage(DEFAULT_FIREMODE)=40.0
	FireOffset=(X=30,Y=4.5,Z=-5)

	// ALTFIRE_FIREMODE
	AmmoCost(ALTFIRE_FIREMODE)=30
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
//	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
//	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
//	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_Kriss'
//	Spread(ALTFIRE_FIREMODE)=0.015

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=26.0
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Kriss'

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'wep_kriss_arch.Wep_KRISS_MuzzleFlash'
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_KRISS.Play_KRISS_Fire_3P_Loop', FirstPersonCue=AkEvent'WW_WEP_KRISS.Play_KRISS_Fire_1P_Loop')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_KRISS.Play_KRISS_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_KRISS.Play_KRISS_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_KRISS.Play_KRISS_Fire_3P_EndLoop', FirstPersonCue=AkEvent'WW_WEP_KRISS.Play_KRISS_Fire_1P_EndLoop')
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClasses(0)=class'KFPerk_FieldMedic'
	AssociatedPerkClasses(1)=class'KFPerk_SWAT'
}
