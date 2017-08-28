//=============================================================================
// KFMutator
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 HickDead, Kavoh
// - HickDead 2017.08.22
//=============================================================================

class SchneidzekkMutator extends KFMutator
	config(SchneidzekkMutator)
	dependson(KFGFxObject_TraderItems);

var private const class<KFWeapon> MyWepClass;
var private const class<KFWeaponDefinition> MyWepDefClass;

/*
function InitMutator(string Options, out string ErrorMessage)
{
	super.InitMutator( Options, ErrorMessage );
	`log("****************** Schneidzekk mutator: initialized");

//	AddMyWeapon();
}

// Can try PostBeginPlay instead
event PreBeginPlay()
{
	Super.PreBeginPlay();
	`log("****************** Schneidzekk mutator: PreBeginPlay");

//	AddMyWeapon();
}
*/

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();
//	`log("****************** Schneidzekk mutator: PostBeginPlay");

	if( ! AddMyWeapon() )
		SetTimer( 1.0f, true, 'addMyWeaponTimer');
//		SetTimer( 0.1f, true, 'addMyWeaponTimer');
//		SetTimer( 0.000001f, true, 'addMyWeaponTimer');
}

simulated function addMyWeaponTimer()
{
	if( AddMyWeapon() )
		ClearTimer( 'addMyWeaponTimer');
}


private simulated final function bool AddMyWeapon()
{
	local WorldInfo WI;
	local KFGameReplicationInfo KFGRI;
	local KFGFxObject_TraderItems TI;
	local STraderItem MyWep;

	`log("****************** Schneidzekk mutator: adding MyWeapon");

	WI = class'WorldInfo'.Static.GetWorldInfo();


	if (WI != none)
		KFGRI = KFGameReplicationInfo(WI.GRI);
	else
	{
		`log("****************** Schneidzekk mutator: WI==none");
		return false;
	}

	if (KFGRI != none)
		TI = KFGRI.TraderItems;
	else
	{
		`log("****************** Schneidzekk mutator: KFGRI==none");
		return false;
	}

	if (TI == none)
	{
		`log("****************** Schneidzekk mutator: TI==none");
		return false;
	}

	if( TI.SaleItems.Length < 1 )
	{
		`log("****************** Schneidzekk mutator: SaleItems empty!");
		return false;
	}


	foreach TI.SaleItems(myWep)
	{
		if( myWep.ClassName == MyWepClass.Name )
			return true;
	}


	MyWep = BuildMyWeapon(); // Construct the weapon

	TI.SaleItems.AddItem(MyWep); // Add weapon to SaleItems array

	TI.SetItemsInfo(TI.SaleItems); // Not sure what this native does, but may be important. Needed? YES!

	`log("****************** Schneidzekk mutator added MyWeapon");

	return true;
}

// Look at STraderItem struct in KFGFxObject_TraderItems class
private simulated final function STraderItem BuildMyWeapon()
{
	local STraderItem Wep;
//	local array<STraderItemWeaponStats> WepStats;

//	`log("****************** Schneidzekk mutator: build MyWeapon");

	Wep.WeaponDef = MyWepDefClass;
	Wep.ClassName = MyWepClass.Name;

////	Wep.AssociatedPerkClasses = MyWepClass.Default.AssociatedPerkClasses;	// Error, Can't access protected variable 'AssociatedPerkClasses' in 'KFWeapon'
	Wep.AssociatedPerkClasses = MyWepClass.Static.GetAssociatedPerkClasses();

	Wep.MagazineCapacity = MyWepClass.Default.MagazineCapacity[0];
	Wep.InitialSpareMags = MyWepClass.Default.InitialSpareMags[0];
	Wep.MaxSpareAmmo = MyWepClass.Default.SpareAmmoCapacity[0];

	Wep.InitialSecondaryAmmo = MyWepClass.Default.InitialSpareMags[1] * MyWepClass.Default.MagazineCapacity[1]; // Correct?
	Wep.MaxSecondaryAmmo = MyWepClass.Default.SpareAmmoCapacity[1]; // Correct?

	Wep.BlocksRequired = MyWepClass.Default.InventorySize;

	MyWepClass.Static.SetTraderWeaponStats(Wep.WeaponStats);

	Wep.InventoryGroup = MyWepClass.Default.InventoryGroup;
	Wep.GroupPriority = MyWepClass.Default.GroupPriority;

	Wep.TraderFilter = MyWepClass.Static.GetTraderFilter();
	Wep.AltTraderFilter = MyWepClass.Static.GetAltTraderFilter();

//	`log("****************** Schneidzekk mutator: built MyWeapon");

	return Wep;
}


// prevent the mutator being added more then once
function AddMutator(Mutator M)
{
	if( M!=Self )
	{
		if( M.Class==Class )
			M.Destroy();
		else Super.AddMutator(M);
	}
}


defaultproperties
{
	MyWepClass=Class'Schneidzekk.KFWeap_SMG_Schneidzekk'
	MyWepDefClass=Class'Schneidzekk.KFWeapDef_Schneidzekk'

	Name="Default__SchneidzekkMutator"
	ObjectArchetype=KFMutator'KFGame.Default__KFMutator'


	bAlwaysRelevant=true
	RemoteRole=ROLE_SimulatedProxy

}
