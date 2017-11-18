//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 HickDead
//=============================================================================

class KFWeapDef_Schneidzekk extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="Schneidzekk.KFWeap_SMG_Schneidzekk"

//	BuyPrice=825
//	AmmoPricePerMag=10
	BuyPrice=1350
	AmmoPricePerMag=40
	ImagePath="WEP_UI_KRISS_TEX.UI_WeaponSelect_KRISS"

	EffectiveRange=70
}
