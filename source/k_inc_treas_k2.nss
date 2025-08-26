////////////////////////////////////////////////////////////////////////////////
/*	LOOT OVERHAUL

	k_inc_treas_k2

	Header file for random loot.

	JC 2024-05-26                                                             */
////////////////////////////////////////////////////////////////////////////////
#include "k_inc_q_crystal"
#include "k_inc_treasure"

////////////////////////////////////////////////////////////////////////////////
//	CONFIGURATION
////////////////////////////////////////////////////////////////////////////////

// Sets how many saber colors to add to the original 10. This will support mods
// that add extra colors as long as they stick to the existing naming scheme.
int EXTRA_SABER_COLORS = 0;


////////////////////////////////////////////////////////////////////////////////
//	INDEX
////////////////////////////////////////////////////////////////////////////////

/*******************************************************************************
	Item Classifications
********************************************************************************

100 ITEM CLASS: WEAPONS
	110 WEAPON TYPE: BLASTER PISTOL
		* 111 Blaster Pistol
	120 WEAPON TYPE: BLASTER RIFLE
		* 121 Blaster Rifle
	130 WEAPON TYPE: MELEE
		* 131 Melee
	140 WEAPON TYPE: LIGHTSABER
		* 141 Lightsaber (Standard)
		* 142 Short Lightsaber
		* 143 Double-Bladed Lightsaber
	150 WEAPON TYPE: PERAGUS
		* 151 Mining Laser
		* 152 Advanced Mining Laser
		* 153 Heavy Mining Laser
		* 154 Vibrocutter
		* 155 Guidon Beacon

200 ITEM CLASS: UPGRADES
	210 UPGRADE TYPE: RANGED
		* 211 Targeting Scope
		* 212 Firing Chamber
		* 213 Power Pack
	220 UPGRADE TYPE: MELEE
		* 221 Grip
		* 222 Edge
		* 223 Energy Cell
	230 UPGRADE TYPE: ARMOR
		* 231 Overlay
		* 232 Underlay
	240 UPGRADE TYPE: LIGHTSABER
		* 241 Emitter
		* 242 Lens
		* 243 Energy Cell
		* 244 Power Crystal
		* 245 Color Crystal

300 ITEM CLASS: EQUIPMENT
	310 EQUIPMENT TYPE: BELT
		* 311 Belt
	320 EQUIPMENT TYPE: GLOVES
		* 321 Gloves
	330 EQUIPMENT TYPE: HEADGEAR
		* 331 Headgear
	340 EQUIPMENT TYPE: IMPLANT
		* 341 Implant Level 1
		* 342 Implant Level 2
		* 343 Implant Level 3
		* 344 Implant Level 4
	350 EQUIPMENT TYPE: ARMBAND
		* 351 Armband

400 ITEM CLASS: ARMOR
	410 ARMOR TYPE: LIGHT
		* 411 Light Armor
	420 ARMOR TYPE: MEDIUM
		* 421 Medium Armor
	430 ARMOR TYPE: HEAVY
		* 431 Heavy Armor
	440 ARMOR TYPE: ROBES
		* 441 Robes

500 ITEM CLASS: DROID ITEMS
	510 DROID ITEM TYPE: INTERFACE
		* 511 Droid Interface
	520 DROID ITEM TYPE: UTILITY
		* 521 Droid Utility
	530 DROID ITEM TYPE: ARMOR
		* 531 Droid Armor
	540 DROID ITEM TYPE: SHIELDS
		* 541 Droid Energy Shield
		* 542 Droid Environment Shield
	550 DROID ITEM TYPE: DEVICE
		* 551 Droid Device

900 ITEM CLASS: DISPOSABLES
	910 DISPOSABLE TYPE: CREDITS
		* 911 Credits
	920 DISPOSABLE TYPE: COMPONENTS & CHEMICALS
		* 921 Components
		* 922 Chemicals
	930 DISPOSABLE TYPE: SHIELDS
		* 931 Energy Shield
		* 932 Environment Shield
		* 933 Melee Shield
	940 DISPOSABLE TYPE: MEDICAL ITEMS
		* 941 Medpac
		* 942 Repair Kit
	950 DISPOSABLE TYPE: STIMS
		* 951 STR Stim
		* 952 DEX Stim
		* 953 CON Stim
		* 954 Medpac II
		* 955 Battle Stim
	960 DISPOSABLE TYPE: EXTRA CREDITS
		* 961 Credits II
	970 DISPOSABLE TYPE: GRENADES
		* 971 Adhesive Grenade
		* 972 Concussion Grenade
		* 973 Cryo-Ban Grenade
		* 974 Thermal Detonator
		* 975 Plasma Grenade
		* 976 Ion Grenade
		* 977 Poison Grenade
		* 978 Sonic Grenade
		* 979 Frag Grenade
	980 DISPOSABLE TYPE: SKILL ITEMS
		* 981 Parts
		* 982 Computer Spike
		* 983 Security Spike
	990 DISPOSABLE TYPE: ROCKETS
		* 991 Rocket

*******************************************************************************/

/*******************************************************************************
	Unique Item Index
********************************************************************************

Weapons & Armor - LOOT_U_ARMS
* 0 Armor - Qel-Droma
* 1 Armor - Exar Kun
* 2 Armor - Jamoh Hogra
* 3 Blaster - Onasi
* 4 Blaster - Onasi II
* 5 Blaster - Nadd
* 6 Melee - Freyyr

Equipment - LOOT_U_EQUIP
* 0 Belt - Qel-Droma
* 1 Armband - Vao
* 2 Glove - Ossuk
* 3 Headgear - Saresh
* 4 Headgear - Bindo
* 5 Crystal - Solari

Robes - LOOT_U_ROBES
* 0 Robe - Arca
* 1 Robe - Aleema
* 2 Robe - Sylvar
* 3 Robe - Malak
* 4 Robe - Jolee
* 5 Robe - Thon
* 6 Robe - Crado
* 7 Robe - Nomi

*******************************************************************************/


////////////////////////////////////////////////////////////////////////////////
//	PROTOTYPES
////////////////////////////////////////////////////////////////////////////////

// Utility Functions
int LOOT_D(int nItemLevel,);
string LOOT_Suffix(int nItemNum);
int LOOT_IsLateGame();
int LOOT_UniqueItemID(int nItemType, int nItemNum);
string LOOT_UniqueItemTag(int nItemType, int nItemNum);
string LOOT_UniqueGlobal(int nItemType);
int LOOT_GetUniqueGlobalState(int nItemType);
int LOOT_GetUniqueFound(int nItemType, int nItemNum);
void LOOT_SetUniqueFound(int nItemType, int nItemNum, int nState);
void LOOT_DebugItem(int nClass, int nType, int nSubtype, int nVariation, string sTemplate);
// Specific Items
int LOOT_GetSpecificClass(int nItemLevel);
int LOOT_GetSpecificType(int nItemLevel, int nItemClass);
int LOOT_GetSpecificSubtype(int nItemLevel, int nItemType);
int LOOT_GetSpecificVariation(int nItemLevel, int nItemType);
// Weapons
int LOOT_GetWeaponType();
int LOOT_GetPistolNum(int nItemLevel);
int LOOT_GetRifleNum(int nItemLevel);
int LOOT_GetMeleeNum(int nItemLevel);
int LOOT_GetSaberSubtype();
int LOOT_GetSaberColor(int nItemLevel, int nColorType = 0);
int LOOT_GetPeragusWeapon();
// Upgrades
int LOOT_GetUpgradeType(int nFilter = 0);
int LOOT_GetUpgradeSubtype(int nItemType, int nFilter = 0);
int LOOT_GetColorCrystalNum(int nInput);
int LOOT_GetPowerCrystalNum(int nItemLevel);
int LOOT_GetUpgradeNum(int nItemLevel, int nItemType, int nItemTier = 0);
// Equipment
int LOOT_GetEquipmentType();
int LOOT_GetBeltNum(int nItemLevel);
int LOOT_GetGloveNum(int nItemLevel);
int LOOT_GetHeadgearNum(int nItemLevel);
int LOOT_GetImplantTier(int nItemLevel);
int LOOT_GetImplantNum(int nItemLevel);
// Droid Items
int LOOT_GetDroidItemType();
int LOOT_GetDroidInterfaceNum(int nItemLevel);
int LOOT_GetDroidUtilityNum(int nItemLevel);
int LOOT_GetDroidArmorNum(int nItemLevel);
int LOOT_GetDroidShieldSubtype();
int LOOT_GetDroidShieldTier(int nItemLevel);
int LOOT_GetDroidShieldNum(int nItemLevel, int nItemType = 0, int nItemTier = 0);
int LOOT_GetDroidDeviceNum(int nItemLevel);
// Armor
int LOOT_GetArmorType();
int LOOT_GetLightArmorNum(int nItemLevel);
int LOOT_GetMediumArmorNum(int nItemLevel);
int LOOT_GetHeavyArmorNum(int nItemLevel);
int LOOT_GetRobeNum(int nItemLevel);
// Disposable Items
int LOOT_GetComponentChemicalSubtype();
int LOOT_GetShieldSubtype();
int LOOT_GetShieldTier(int nItemLevel);
int LOOT_GetShieldNum(int nItemLevel, int nItemType = 0, int nItemTier = 0);
int LOOT_GetShieldQuantity(int nItemLevel, int nItemType, int nItemTier = 0);
int LOOT_GetMedicalSubtype();
int LOOT_GetMedpacTier(int nItemLevel);
int LOOT_GetStimSubtype(int nFilter = 0);
int LOOT_GetStimTier(int nItemLevel);
int LOOT_GetStimNum(int nItemLevel, int nItemType = 0, int nItemTier = 0);
int LOOT_GetGrenadeSubtype(int nItemLevel);
int LOOT_GetGrenadeQuantity(int nItemLevel, int nItemType);
int LOOT_GetSecuritySpikeTier(int nItemLevel);
int LOOT_GetRocketNum(int nItemLevel);
int LOOT_GetDisposableLateGame(int nItemLevel);
int LOOT_GetSkillSubtype();
// Item Templates
string GetItemPrefix(int nItemType);
string GetTreasureSpecific(int nItemLevel, int nItemType = 0);
string GetBundlePrefix(int nItemLevel, int nItemType);
string GetTreasureBundle(int nItemLevel, int nItemType = 0);
string GetTreasureNormal(int nItemLevel, int nItemType = 0);
string GetTreasureRare(int nItemLevel, int nItemType = 0);
// Item Placement
void PlaceTreasureDisposable(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 900);
void PlaceTreasure(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0);
void PlaceCritterTreasure(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0);
void PlaceTreasureJedi(object oContainer = OBJECT_SELF, int numberOfItems = 1);
void PlaceTreasureDroid(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0);
void PlaceTreasurePeragus(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0);
void PlaceHKFactoryTreasure(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0);


////////////////////////////////////////////////////////////////////////////////
//	UTILITY FUNCTIONS
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_D()
	
	Rolls a die of a given size with probability skewed towards larger values.
	
	- nSize: Die size

	JC 2024-05-25                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_D(int nSize) {
	int nRoll = Random(nSize) + 1;
	if( nRoll <= nSize / 2 )
		nRoll += Random(nSize / 2);
	return nRoll;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_Suffix()

	Converts an item number to a string to get the final item variation suffix.

	JC 2024-04-27                                                             */
////////////////////////////////////////////////////////////////////////////////
string LOOT_Suffix(int nItemNum) {
	if( nItemNum == 0 )
		return "";
	if( nItemNum < 0 )
		return "01";
	if( nItemNum < 10 )
		return "0" + IntToString(nItemNum);
	if (nItemNum < 100 )
		return IntToString(nItemNum);
	if( nItemNum == 100 )
		return "x01";
	if( nItemNum > 100 && nItemNum < 110 )
		return "x0" + IntToString(nItemNum - 100);
	if( nItemNum >=  110 )
		return "x" + IntToString(nItemNum - 100);
	return "";
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_IsLateGame()

	Checks whether it's late in the game (after boarding the Ravager).

	JC 2021-01-09                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_IsLateGame() {
	return StringToInt(GetStringLeft(GetModuleName(), 2)) >= 85;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_UniqueItemID()

	Returns an ID for a unique item so its corresponding global can be set or
	checked.

	- nItemType: Item type (item classifications)
	- nItemNum: Item variation number

	JC 2020-09-07                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_UniqueItemID(int nItemType, int nItemNum) {
	int nItemID;

	switch( nItemType ) {
	// Light Armor
	case 411: // Qel-Droma
		nItemID = 0;
		break;
	// Medium Armor
	case 421:
		switch( nItemNum ) {
		case 11: // Exar Kun
			nItemID = 1;
			break;
		case 15: // Jamoh Hogra
			nItemID = 2;
			break;
		}
		break;
	// Blaster Pistol
	case 111:
		switch( nItemNum ) {
		case 22: // Onasi
			nItemID = 3;
			break;
		case -1: // Onasi II
			// Second Onasi blaster requires spooky non-existent item number
			return 4;
			break;
		case 30: // Freedon Nadd
			nItemID = 5;
			break;
		}
		break;
	// Melee
	case 131: // Freyyr
		nItemID = 6;
		break;
	// Armband
	case 351: // Vao
		nItemID = 102;
		break;
	// Belt
	case 311: // Qel-Droma
		nItemID = 0;
		break;
	// Gloves
	case 321: // Ossuk
		nItemID = 2;
		break;
	// Headgear
	case 331:
		switch( nItemNum ) {
		case 25: // Saresh
			nItemID = 3;
			break;
		case 26: // Bindo
			nItemID = 4;
			break;
		}
		break;
	// Upgrade - Lightsaber - Power Crystal
	case 244: // Solari
		nItemID = 5;
		break;
	// Robes
	case 441:
		switch( nItemNum ) {
		case 23: // Arca
			nItemID = 0;
			break;
		case 24: // Aleema
			nItemID = 1;
			break;
		case 25: // Sylvar
			nItemID = 2;
			break;
		case 26: // Malak
			nItemID = 3;
			break;
		case 27: // Jolee
			nItemID = 4;
			break;
		case 28: // Thon
			nItemID = 5;
			break;
		case 29: // Crado
			nItemID = 6;
			break;
		case 30: // Nomi
			nItemID = 7;
			break;
		}
		break;
	default:
		nItemID = 0;
	}
	
	return nItemID;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_UniqueItemTag()

	Returns the tag of a unique item.

	- nItemType: Item type (item classifications)
	- nItemNum: Item variation number

	JC 2019-08-02                                                             */
////////////////////////////////////////////////////////////////////////////////
string LOOT_UniqueItemTag(int nItemType, int nItemNum) {
	// Exception for Vao Armband
	if( nItemType == 351 )
		return "a_band_x02";
	// Exception for 2nd Onasi Blaster
	if( nItemType == 111 && nItemNum == -1 )
		return "w_blaste_22";
	// Otherwise, prefix + suffix
	return GetItemPrefix(nItemType) + LOOT_Suffix(nItemNum);
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_UniqueGlobal()

	Returns a string for the global that keeps track of the specified unique
	item type.

	Three globals are needed to keep track of them all:
	* LOOT_U_EQUIP - armbands, belts, headgear, and crystals
	* LOOT_U_ARMS - weapons and armor (except for robes)
	* LOOT_U_ROBES - robes

	- nItemType: Item type (item classifications)

	JC 2019-08-03                                                             */
////////////////////////////////////////////////////////////////////////////////
string LOOT_UniqueGlobal(int nItemType) {
	switch( nItemType ) {
	case 441:
		return "LOOT_U_ROBES";
	case 111:
	case 131:
	case 411:
	case 421:
		return "LOOT_U_ARMS";
	case 244:
	case 311:
	case 321:
	case 331:
	case 351:
		return "LOOT_U_EQUIP";
	}
	return "";
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetUniqueGlobalState()

	Returns the corrected value for a unique item global.

	- nItemType: Item type (item classifications)

	JC 2019-08-06                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetUniqueGlobalState(int nItemType) {
	int nGlobal = GetGlobalNumber(LOOT_UniqueGlobal(nItemType));
	
	// 128 is stored as -128 for reasons, so the global has to be converted
	// first if it has a negative value
	if( nGlobal < 0 )
		nGlobal += 256;

	return nGlobal;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetUniqueFound()

	Checks if a unique item has already been found.

	- nItemType: Item type (item classifications)
	- nItemID: Unique item ID (unique item index)

	JC 2019-09-07                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetUniqueFound(int nItemType, int nItemNum) {
	return LOOT_GetUniqueGlobalState(nItemType) >> (LOOT_UniqueItemID(nItemType, nItemNum));
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_SetUniqueFound()

	Sets whether a unique item has been found.

	- nItemType: Item type (item classifications)
	- nItemID: Unique item ID (unique item index)
	- nState: Set whether it's been found or not (TRUE or FALSE);

	Warning: This will only work if the global is already set to the opposite
	state, so you need to check before you set.

	JC 2019-09-07                                                             */
////////////////////////////////////////////////////////////////////////////////
void LOOT_SetUniqueFound(int nItemType, int nItemNum, int nState) {
	string sGlobal = LOOT_UniqueGlobal(nItemType);
	int nGlobal = GetGlobalNumber(sGlobal);
	int nAdjust = 1 << LOOT_UniqueItemID(nItemType, nItemNum);
	
	// 2 Onasi Blasters are permitted, so we have to switch IDs for the second
	if( (nItemType == 111 && nAdjust == 8) && LOOT_GetUniqueFound(111, 22) )
		nAdjust <<= 1;

	if( nState )
		SetGlobalNumber(sGlobal, nGlobal | nAdjust);
	else
		SetGlobalNumber(sGlobal, nGlobal & ~nAdjust);
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_DebugItem()

	Prints item details in the feedback screen, for testing.

	- nClass: Item class
	- nType:  Item type
	- nSubtype: Item subtype
	- nVariation: Item variation
	- sTemplate: Item template

	JC 2024-05-25                                                             */
////////////////////////////////////////////////////////////////////////////////
void LOOT_DebugItem(int nClass, int nType, int nSubtype, int nVariation, string sTemplate) {
	SendMessageToPC(GetFirstPC(),
		IntToString(nClass) + " -> " +
		IntToString(nType) + " -> " +
		IntToString(nSubtype) + " -> " +
		"'" + sTemplate +  "' " +
		"(" + IntToString(nVariation) + ")"
	);
}

////////////////////////////////////////////////////////////////////////////////
//	SPECIFIC ITEMS
////////////////////////////////////////////////////////////////////////////////

int LOOT_GetSpecificClass(int nItemLevel) {
	int nItemType;
	// Player shouldn't find armor early on when they're meant to be naked
	if( GetGlobalNumber("G_PC_LEVEL") < 4 )
		nItemType = 100 * (Random(3) + 1);
	// Droid items and disposables aren't included in random loot
	else
		nItemType = 100 * (Random(4) + 1);
	// Roll for item class
	// Equipment more common, upgrades less common
	if( nItemType == 200 && Random(2) )
		nItemType = 300;
	return nItemType;
}

int LOOT_GetSpecificType(int nItemLevel, int nItemClass) {
	switch( nItemClass ) {
	case 100: // Weapons
		return LOOT_GetWeaponType();
	case 200: // Upgrades
		// Restrict lightsaber upgrades
		if( nItemLevel < 6 )
			return LOOT_GetUpgradeType(1);
		return LOOT_GetUpgradeType(0);
	case 300: // Equipment
		return LOOT_GetEquipmentType();
	case 400: // Armor
		return LOOT_GetArmorType();
	case 500: // Droid
		return LOOT_GetDroidItemType();
	}
	return 910;
}

int LOOT_GetSpecificSubtype(int nItemLevel, int nItemType) {
	switch( nItemType ) {
	case 140: // Lightsaber
		return LOOT_GetSaberSubtype();
	case 150: // Peragus Weapons
		return LOOT_GetPeragusWeapon();
	case 210: // Upgrade - Ranged
	case 220: // Upgrade - Melee
	case 230: // Upgrade - Armor
	case 240: // Upgrade - Lightsaber
		return LOOT_GetUpgradeSubtype(nItemType);
	case 340: // Implant
		return 340 + LOOT_GetImplantTier(nItemLevel);
	case 350: // Armband
		// Vao Armband is the only possible armband
		return 351;
	case 540: // Droid Shield
		return LOOT_GetDroidShieldSubtype();
	}
	// Everything else has only 1 thing per thing
	return nItemType + 1;	
}

int LOOT_GetSpecificVariation(int nItemLevel, int nItemType) {
	switch( nItemType ) {
	case 111: // Blaster Pistol
		return LOOT_GetPistolNum(nItemLevel);
	case 121: // Blaster Rifle
		return LOOT_GetRifleNum(nItemLevel);
	case 131: // Melee
		return LOOT_GetMeleeNum(nItemLevel);
	case 141: // Lightsaber - Standard
	case 142: // Lightsaber - Short
	case 143: // Lightsaber - Double-Bladed
		return LOOT_GetSaberColor(nItemLevel);
	case 151: // Mining Laser
	case 152: // Advanced Mining Laser
	case 153: // Heavy Mining Laser
	case 154: // Vibrocutter
	case 155: // Guidon Beacon
		return 0;
	case 157:
		return LOOT_GetMeleeNum(nItemLevel);
	case 211: // Upgrade - Ranged - Targeting Scope
	case 212: // Upgrade - Ranged - Firing Chamber
	case 213: // Upgrade - Ranged - Power Pack
	case 221: // Upgrade - Melee - Grip
	case 222: // Upgrade - Melee - Edge
	case 223: // Upgrade - Melee - Energy Cell
	case 231: // Upgrade - Overlay
	case 232: // Upgrade - Underlay
	case 241: // Upgrade - Lightsaber - Emitter
	case 242: // Upgrade - Lightsaber - Lens
	case 243: // Upgrade - Lightsaber - Energy Cell
		return LOOT_GetUpgradeNum(nItemLevel, nItemType);
	case 244: // Upgrade - Lightsaber - Power Crystal
		return LOOT_GetPowerCrystalNum(nItemLevel);
	case 245: // Upgrade - Lightsaber - Color Crystal
		return LOOT_GetColorCrystalNum(LOOT_GetSaberColor(nItemLevel));
	case 311: // Belt
		return LOOT_GetBeltNum(nItemLevel);
	case 321: // Gloves
		return LOOT_GetGloveNum(nItemLevel);
	case 331: // Headgear
		return LOOT_GetHeadgearNum(nItemLevel);
	case 341: // Implant Level 1
	case 342: // Implant Level 2
	case 343: // Implant Level 3
	case 344: // Implant Level 4
		return LOOT_GetImplantNum(nItemLevel);
	case 351: // Armband
		// Vao Armband is the only possible armband
		return 102;
	case 411: // Light Armor
		return LOOT_GetLightArmorNum(nItemLevel);
	case 421: // Medium Armor
		return LOOT_GetMediumArmorNum(nItemLevel);
	case 431: // Heavy Armor
		return LOOT_GetHeavyArmorNum(nItemLevel);
	case 441: // Robes
		return LOOT_GetRobeNum(nItemLevel);
	case 511: // Droid Interface
		return LOOT_GetDroidInterfaceNum(nItemLevel);
	case 521: // Droid Utility
		return LOOT_GetDroidUtilityNum(nItemLevel);
	case 531: // Droid Armor
		return LOOT_GetDroidArmorNum(nItemLevel);
	case 541: // Droid Shield - Energy
	case 542: // Droid Shield - Enviro
		return LOOT_GetDroidShieldNum(nItemLevel, nItemType);
	case 551: // Droid Device
		return LOOT_GetDroidDeviceNum(nItemLevel);
	}
	return 1;
}


////////////////////////////////////////////////////////////////////////////////
//	WEAPONS
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetWeaponType()

	Determines weapon item type.

	JC 2024-05-18                                                             */
////////////////////////////////////////////////////////////////////////////////

int LOOT_GetWeaponType() {
	// Only Peragus weapons on Peragus
	if( GetStringRight(GetModuleName(), 3) == "PER" )
		return 150;
	// Lightsabers aren't included in random loot
	return 100 + 10 * (Random(3) + 1);
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetPistolNum()

	Generates item variation number for blaster pistols.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetPistolNum(int nItemLevel) {
	// Pistols have 30 variations
	int nRoll = LOOT_D(nItemLevel);
	int nItemNum = 0;
	
	// Replacement table for if a better version of what we rolled is available
	do {
		switch( nRoll ) {
		case 1: // Blaster Pistol --> Republic Blaster
			if( nItemLevel >= 9 )
				nRoll = 9;
			else
				nItemNum = nRoll;
			break;
		case 9: // Republic Blaster --> Mandalorian Blaster
			if( nItemLevel >= 12 )
				nRoll = 12;
			else
				nItemNum = nRoll;
			break;
		case 12: // Mandalorian Blaster --> Onasi Blaster
			if( nItemLevel >= 22 )
				nRoll = 22;
			else
				nItemNum = nRoll;
			break;
		case 22: // *Onasi Blaster*
			// Replace with Micro-Pulse Blaster based on item level OR
			// if two have already been found
			if( nItemLevel >= 26 || LOOT_GetUniqueFound(111, -1) )
				nRoll = 26;
			else {
				LOOT_SetUniqueFound(111, 22, TRUE);
				nItemNum = nRoll;
			}
			break;

		case 2: // Ion Blaster --> Aratech Droid Oxidizer
			if( nItemLevel >= 10 )
				nRoll = 10;
			else
				nItemNum = nRoll;
			break;
		case 10: // Aratech Droid Oxidizer --> Aratech Ionmaster
			if( nItemLevel >= 21 )
				nRoll = 21;
			else
				nItemNum = nRoll;
			break;

		case 3: // Field Survival Pistol --> Scout Enforcer
			if( nItemLevel >= 7 )
				nRoll = 7;
			else
				nItemNum = nRoll;
			break;
		case 7: // Scout Enforcer --> Watchman Blaster
			if( nItemLevel >= 18 )
				nRoll = 18;
			else
				nItemNum = nRoll;
			break;
		case 18: // Watchman Blaster --> Elite Watchman Blaster
			if( nItemLevel >= 27 )
				nRoll = 27;
			else
				nItemNum = nRoll;
			break;

		case 4: // Sonic Pistol --> Systech Aural Blaster
			if( nItemLevel >= 8 )
				nRoll = 8;
			else
				nItemNum = nRoll;
			break;
		case 8: // Systech Aural Blaster --> Arkanian Sonic Blaster
			if( nItemLevel >= 14 )
				nRoll = 14;
			else
				nItemNum = nRoll;
			break;

		case 5: // Disruptor Pistol --> Sith Disruptor
			if( nItemLevel >= 15 )
				nRoll = 15;
			else
				nItemNum = nRoll;
			break;
		case 15: // Sith Disruptor --> Mandalorian Ripper
			if( nItemLevel >= 20 )
				nRoll = 20;
			else
				nItemNum = nRoll;
			break;
		case 20: // Mandalorian Ripper --> Mandalorian Disintegrator
			if( nItemLevel >= 28 )
				nRoll = 28;
			else
				nItemNum = nRoll;
			break;

		case 6: // Heavy Blaster Pistol --> Arkanian Heavy Pistol
			if( nItemLevel >= 11 )
				nRoll = 11;
			else
				nItemNum = nRoll;
			break;
		case 11: // Arkanian Heavy Pistol --> Mandalorian Heavy Blaster
			if( nItemLevel >= 16 )
				nRoll = 16;
			else
				nItemNum = nRoll;
			break;
		case 16: // Mandalorian Heavy Blaster --> Zabrak Heavy Blaster
			if( nItemLevel >= 24 )
				nRoll = 24;
			else
				nItemNum = nRoll;
			break;

		case 13: // Systech Static Blaster --> Systech Electric Blaster
			if( nItemLevel >= 25 )
				nRoll = 25;
			else
				nItemNum = nRoll;
			break;

		case 30: // *Freedon Nadd's Blaster*
			// If it was found before, replace with a random high level item
			if( LOOT_GetUniqueFound(111, nRoll) )
				nRoll = Random(6) + 24;
			else {
				LOOT_SetUniqueFound(111, 30, TRUE);
				nItemNum = nRoll;
			}
			break;
		
		default:
			nItemNum = nRoll;
			break;
		}
	} while( nItemNum <= 0 );

	return nItemNum;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetRifleNum()

	Generates item variation number for blaster pistols.

	Replaces certain items when better versions are available.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetRifleNum(int nItemLevel) {
	// Rifles have 30 variations
	int nRoll = LOOT_D(nItemLevel);
	int nItemNum = 0;

	// Replacement table for if a better version of what we rolled is available
	do {
		switch( nRoll ) {
		case 1: // Blaster Carbine --> Repeating Blaster Carbine
			if( nItemLevel >= 6 )
				nRoll = 6;
			else
				nItemNum = nRoll;
			break;
		case 6: // Repeating Blaster Carbine --> Heavy Repeating Blaster Carbine
			if( nItemLevel >= 17 )
				nRoll = 17;
			else
				nItemNum = nRoll;
			break;

		case 2: // Ion Carbine --> Ion Rifle
			if( nItemLevel >= 7 )
				nRoll = 7;
			else
				nItemNum = nRoll;
			break;
		case 7: // Ion Rifle --> Bothan Droid Disruptor
			if( nItemLevel >= 15 )
				nRoll = 15;
			else
				nItemNum = nRoll;
			break;
		case 15: // Bothan Droid Disruptor --> Verpine Droid Disruptor
			if( nItemLevel >= 20 )
				nRoll = 20;
			else
				nItemNum = nRoll;
			break;
		case 20: // Verpine Droid Disruptor --> Verpine Droid Disintegrator
			if( nItemLevel >= 29 )
				nRoll = 29;
			else
				nItemNum = nRoll;
			break;

		case 3: // Sonic Carbine --> Sonic Rifle
			if( nItemLevel >= 9 )
				nRoll = 9;
			else
				nItemNum = nRoll;
			break;
		case 9: // Sonic Rifle --> Sonic Disruptor
			if( nItemLevel >= 27 )
				nRoll = 27;
			else
				nItemNum = nRoll;
			break;

		case 4: // Blaster Rifle --> Arkanian Blaster Rifle
			if( nItemLevel >= 12 )
				nRoll = 12;
			else
				nItemNum = nRoll;
			break;

		case 5: // Bowcaster --> War Bowcaster
			if( nItemLevel >= 11 )
				nRoll = 11;
			else
				nItemNum = nRoll;
			break;

		case 8: // Disruptor Carbine --> Disruptor Rifle
			if( nItemLevel >= 13 )
				nRoll = 13;
			else
				nItemNum = nRoll;
			break;

		case 10: // Repeating Blaster Rifle --> Heavy Repeating Rifle
			if( nItemLevel >= 22 )
				nRoll = 22;
			else
				nItemNum = nRoll;
			break;
		case 22: // Heavy Repeating Rifle --> Mandalorian Heavy Repeater
			if( nItemLevel >= 26 )
				nRoll = 26;
			else
				nItemNum = nRoll;
			break;

		case 14: // Argazdan Riot Buster --> Slavemaster Stun Carbine
			if( nItemLevel >= 25 )
				nRoll = 25;
			else
				nItemNum = nRoll;
			break;
		
		default:
			nItemNum = nRoll;
			break;
		}
	} while( nItemNum <= 0 );

	return nItemNum;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetMeleeNum()

	Generates item variation number for melee weapons.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetMeleeNum(int nItemLevel) {
	// Melee weapons have 30 variations
	int nRoll = LOOT_D(nItemLevel);
	int nItemNum = 0;

	// Replacement table for if a better version of what we rolled is available
	do {
		switch( nRoll ) {
		case 1: // Short Sword --> Vibroblade
			if( nItemLevel >= 5 )
				nRoll = 5;
			else
				nItemNum = nRoll;
			break;
		case 5: // Vibroblade --> Zabrak Vibroblade
			if( nItemLevel >= 10 )
				nRoll = 10;
			else
				nItemNum = nRoll;
			break;

		case 2: // Long Sword --> Vibrosword
			if( nItemLevel >= 6 )
				nRoll = 6;
			else
				nItemNum = nRoll;
			break;
		case 6: // Vibrosword --> Echani Vibrosword
			if( nItemLevel >= 21 )
				nRoll = 21;
			else
				nItemNum = nRoll;
			break;

		case 3: // Energy Baton --> Exchange Negotiator
			if( nItemLevel >= 8 )
				nRoll = 8;
			else
				nItemNum = nRoll;
			break;
		case 8: // Exchange Negotiator --> Gand Silencer
			if( nItemLevel >= 18 )
				nRoll = 18;
			else
				nItemNum = nRoll;
			break;
		case 18: // Gand Silencer --> Gand Discharger
			if( nItemLevel >= 29 )
				nRoll = 29;
			else
				nItemNum = nRoll;
			break;

		case 4: // Quarterstaff --> Force Pike
			if( nItemLevel >= 14 )
				nRoll = 14;
			else
				nItemNum = nRoll;
			break;
		case 14: // Force Pike --> Gand Shockstaff
			if( nItemLevel >= 23 )
				nRoll = 23;
			else
				nItemNum = nRoll;
			break;

		case 7: // Double-Bladed Sword --> Vibro Double-Blade
			if( nItemLevel >= 15 )
				nRoll = 15;
			else
				nItemNum = nRoll;
			break;

		case 11: // Rodian Blade --> Rodian Death Blade
			if( nItemLevel >= 17 )
				nRoll = 17;
			else
				nItemNum = nRoll;
			break;

		case 12: // Sith War Sword --> Sith Tremor Sword
			if( nItemLevel >= 22 )
				nRoll = 22;
			else
				nItemNum = nRoll;
			break;

		case 30: // *Freyyr's Warblade*
			// If it was found before, replace with a random high level item
			if( LOOT_GetUniqueFound(131, nRoll) )
				nRoll = Random(10) + 20;
			else {
				LOOT_SetUniqueFound(131, 30, TRUE);
				nItemNum = nRoll;
			}
			break;
		
		default:
			nItemNum = nRoll;
			break;
		}
	} while( nItemNum <= 0 );

	return nItemNum;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetSaberSubtype()

	Determines lightsaber subtype (STANDARD, SHORT, or DOUBLE-BLADED).

	Standard lightsabers are more common than short and double-bladed, with a
	3:1:1 ratio.

	JC 2024-05-18                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetSaberSubtype() {
	switch( Random(5) ) {
	case 4: // Double-Bladed Lightsaber
		return 143;
	case 3: // Short Lightsaber
		return 142;
	}
	return 141; // Standard Lightsaber
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetSaberColor()

	Determines the color for a lightsaber with different rolls depending on
	which option is input.

	The colors are grouped into two categories:
	* COMMON (blue, red, green, yellow, violet)
	* RARE (cyan, silver, orange, viridian, and any additional colors added with
		   EXTRA_SABER_COLORS)
	Additionally, violet is considered semi-rare and is always half as likely
	as the other common colors.

	Colors may be randomly chosen with one of four algorithms:
	* COMMON - Only common colors (violet less likely)
	* RARE - Only rare colors (equal chance amongst them)
	* WEIGHTED - Roll for all colors, with up to 25% chance of getting a rare
				 color. The initial roll determines common or rare, then
				 another roll is performed for that.
	* ANY - Equal chance for all colors, regardless of rarity

	Returns a number between 1 and 11 for the original game colors:
	* 1 = BLUE
	* 2 = RED
	* 3 = GREEN
	* 4 = YELLOW
	* 5 = VIOLET
	* There is no color #6
	* 7 = BRONZE
	* 8 = ORANGE
	* 9 = SILVER
	* 10 = CYAN
	* 11 = VIRIDIAN

	And if more extra colors are added, this will return 12+ without any more
	weird rules. 12 = extra color #1, etc.

	- nItemLevel: Item level determining the quality of the items we can get
	- nColorType: Which color algorithm to use
	  * -1: ANY
	  *  0: WEIGHTED
	  *  1: COMMON
	  *  2: RARE

	JC 2024-05-18                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetSaberColor(int nItemLevel, int nColorType) {
	if( nItemLevel > 20 )
		nItemLevel = 20; // caps the die at d100
	int nColor;	
	// If we're using weighted odds, determine common or rare
	if( nColorType == 0 ) {
		if( Random(nItemLevel * 5) < 75 )
			nColorType = 1; // Common
		else
			nColorType = 2; // Rare
	}	
	// Roll for common colors
	if( nColorType == 1 )
		nColor = (Random(9) + 1) / 2;
	// Roll for rare colors
	else if( nColorType == 2 )
		nColor = Random(5 + EXTRA_SABER_COLORS) + 6;
	// Roll for even odds
	else
		nColor = Random(10 + EXTRA_SABER_COLORS) + 1;
	// Get the real number
	// No #6 (Malak's saber).
	if( nColor >= 6 ) {
		return nColor + 1;
	}
	return nColor;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetPeragusWeapon()

	Determines weapon type for loot on Peragus.

	Regular weapons are excluded from Peragus lot and only location-specific
	weapons will drop.
	
	25% chance Mining Laser
	20% chance Advanced Mining Laser
	5% chance Heavy Mining Laser
	25% chance Vibrocutter
	20% chance Guidon Beacon
	5% chance Other Melee Weapons

	JC 2024-05-18                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetPeragusWeapon() {
	switch( Random(20) ) {
	case 0:
	case 1:
	case 2:
	case 3:
	case 4:
		return 151; // Mining Laser
	case 5:
	case 6:
	case 7:
	case 8:
		return 152; // Advanced Mining Laser
	case 9:
		return 153; // Heavy Mining Laser
	case 10:
	case 11:
	case 12:
	case 13:
	case 14:
		return 154; // Vibrocutter
	case 15:
	case 16:
	case 17:
	case 18:
		return 155; // Guidon Beacon
	}
	return 131; // Other Melee Weapons
}


////////////////////////////////////////////////////////////////////////////////
//	UPGRADES
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetUpgradeType()

	Determines the type of upgrade (ARMOR, RANGED, MELEE, or LIGHTSABER).

	Probability is roughly based on how common the items that use the upgrades
	are, so upgrades for more common items are more common. Armor and ranged
	upgrades are more common than melee and lightsaber upgrades, with a 2:2:1:1
	ratio.

	- nFilter: Used to exlude certain results if desired
	  * 0: Any upgrade type
	  * 1: Armor, ranged, or melee, but no lightsaber
	  * 2: Ranged, melee, or lightsaber, but no armor
	  * 3: Ranged or melee, no armor or lightsaber

	JC 2019-08-03                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetUpgradeType(int nFilter) {
	int nRoll;
	switch( nFilter ) {
	case 1: // No lightsaber upgrades if that's specified
		nRoll = Random(5);
		break;
	case 2: // No armor option
		nRoll = Random(4) + 2;
		break;
	case 3: // Ranged & melee only option
		nRoll = Random(3) + 2;
		break;
	default: // All upgrades
		nRoll = Random(6);
		break;
	}
	// Check the roll to determine type
	switch( nRoll ) {
	case 0:
	case 1:
		return 230; // Armor
	case 2:
	case 3:
		return 210; // Ranged
	case 4:
		return 220; // Melee
	case 5:
		return 240; // Lightsaber
	}
	return 210;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetUpgradeSubtype()

	Randomly determines an upgrade subtype based on the input type.

	Each upgrade type has different subtypes with different algorithms for their
	probabilities. These are weighted so upgrade parts that can be used in more
	items are more common. For example,	many blasters can only have the scope
	upgraded, so scopes have a higher probability than other ranged upgrade
	parts.

	RANGED
	  Scope, Firing Chamber, Power Pack
	  5:4:3
	MELEE
	  Grip, Edge, Energy Cell
	  3:3:2
	ARMOR
	  Underlay, Overlay
	  3:2
	LIGHTSABER
	  Emitter, Lens, Energy Cell, Color Crystal, Power Crystal
	  5:5:5:3:2

	- nItemType: Item type (item classifications, upgrade types only)
	- nFilter: Used to exclude certain results if desired
	  LIGHTSABER
	  * 0: Any lightsaber upgrade
	  * 1: Emitter, energy cell, or lens only
	  * 2: Color crystal or power crystal only
	  * 3: No color crystal, but anything else

	JC 2019-08-03                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetUpgradeSubtype(int nItemType, int nFilter) {
	int nRoll;
	// If upgrade type isn't known, randomly generate it
	if( nItemType != 210 &&
		nItemType != 220 &&
		nItemType != 230 &&
		nItemType != 240 )
		nItemType = LOOT_GetUpgradeType();
	// Different upgrades have different rules
	switch( nItemType ) {
	// Ranged
	case 210:
		nRoll = Random(12);
		if( nRoll < 5 )
			return 211; // Targeting Scope
		if( nRoll < 9 )
			return 212; // Firing Chamber
		return 213; // Power Pack
	// Melee
	case 220:
		nRoll = Random(8);
		if( nRoll < 3 )
			return 222; // Edge
		if( nRoll < 6 )
			return 221; // Grip
		return 223; // Energy Cell
	// Armor
	case 230:
		nRoll = Random(5);
		if( nRoll < 3 )
			return 232; // Underlay
		return 231; // Overlay
	// Lightsaber
	case 240:
		// Parts only option
		if( nFilter == 1 )
			nRoll = Random(15);
		// Crystals only option
		else if( nFilter == 2 )
			nRoll = Random(5) + 15;
		// No color crystal option
		else if( nFilter == 3 )
			nRoll = Random(18);
		// All saber upgrades
		else
			nRoll = Random(20);
		// Check the roll to determine subtype
		if( nRoll < 5 )
			return 241; // Emitter
		if( nRoll < 10 )
			return 243; // Energy Cell
		if( nRoll < 15 )
			return 242; // Lens
		if( nRoll < 18 )
			return 244; // Power Crystal
		return 245; // Color Crystal
	}
	return 211;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetColorCrystalNum()

	Converts a saber color to the matching crystal color because these numbers
	don't match because who knows why.

	Returns a number from 1-10 for the original game colors:
	* 1 = BLUE
	* 2 = GREEN
	* 3 = YELLOW
	* 4 = RED
	* 5 = VIRIDIAN
	* 6 = CYAN
	* 7 = SILVER
	* 8 = ORANGE
	* 9 = VIRIDIAN
	* 10 = BRONZE (extra color #1)

	This never outputs 11 because that's skipped for crystal colors. For 12+,
	the output always matches the input.

	- nInput: Input saber color number

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetColorCrystalNum(int nInput) {
	switch( nInput ) {
	case 2: // Red
		return 4;
	case 3: // Green
		return 2;
	case 4: // Yellow
		return 3;
	case 7: // Bronze
		return 10;
	case 9: // Silver
		return 7;
	case 10: // Cyan
		return 6;
	case 11: // Viridian
		return 9;
	}
	// No weird rules for anything else
	return nInput;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetPowerCrystalNum()

	Generates item variation number for lightsaber power crystals.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetPowerCrystalNum(int nItemLevel) {
	// Power crystals have 25 variations
	if( nItemLevel > 25 )
		nItemLevel = 25;
	int nRoll = LOOT_D(nItemLevel);	
	// Replace the Solari Crystal if it's been found before
	if( nRoll == 21 ) {
		if( LOOT_GetUniqueFound(244, 21) ) {
			nRoll = LOOT_D(nItemLevel - 1);
			if( nRoll >= 21 )
				nRoll += 1;
		}
		else
			LOOT_SetUniqueFound(244, 21, TRUE);
	}
	return nRoll;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetUpgradeNum()

	Generates item variation number for upgrades.

	Upgrades are divided into tiers (e.g. Armorweave Underlay Mark I, Armorweave
	Underlay Mark II...) but the upgrade types have different numbers of tiers
	with different amounts of items in each tier. Item level is used to
	calculate the appropriate tier, using the least common multiple of the max
	level (30) and the total number of upgrade items for the given type. Once
	the tier is known, a random item variant is picked, with even odds for all
	varieties.

	- nItemLevel: Item level determining the quality of the items we can get
	- nItemType: Item type (item classifications, upgrades only)
	- nItemTier: Optional number to specify an item tier

	JC 2024-05-18                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetUpgradeNum(int nItemLevel, int nItemType, int nItemTier) {
	int nNumTiers;
	int nItemsPerTier;
	int nItemID;
	int nNumItems;
	
	// Different upgrade types have their items grouped in different amounts
	switch( nItemType ) {
	case 211: // Ranged - Targeting Scope
		nNumTiers = 4;
		nItemsPerTier = 4;
		break;
	case 212: // Ranged - Firing Chamber
		nNumTiers = 3;
		nItemsPerTier = 5;
		break;
	case 213: // Ranged - Power Pack
		nNumTiers = 5;
		nItemsPerTier = 3;
		break;
	case 221: // Melee - Grip
		nNumTiers = 3;
		nItemsPerTier = 5;
		break;
	case 222: // Melee - Edge
		nNumTiers = 4;
		nItemsPerTier = 4;
		break;
	case 223: // Melee - Energy Cell
		nNumTiers = 4;
		nItemsPerTier = 4;
		break;
	case 231: // Armor - Overlay
		nNumTiers = 4;
		nItemsPerTier = 8;
		break;
	case 232: // Armor - Underlay
		nNumTiers = 5;
		nItemsPerTier = 6;
		break;
	case 241: // Lightsaber - Emitter
		nNumTiers = 4;
		nItemsPerTier = 4;
		break;
	case 242: // Lightsaber - Lens
		nNumTiers = 3;
		nItemsPerTier = 5;
		break;
	case 243: // Lightsaber - Energy Cell
		nNumTiers = 4;
		nItemsPerTier = 4;
		break;
	}	
	// Determine tier based on player level if it isn't known
	if( nItemTier < 1 || nItemTier > nNumTiers ) {
		// Item level scales to match the total number of items
		nNumItems = nNumTiers * nItemsPerTier;
		if( 30 % nNumItems == 0 )
			nItemLevel = (nItemLevel + (30 / nNumItems) - 1) / (30 / nNumItems);
		else if( nNumItems < 30 )
			nItemLevel = ((nItemLevel * nNumItems) + 30 - nNumItems) / 30;
		else
			nItemLevel = (nItemLevel * nNumItems) / 30;
		nItemTier = (nItemLevel + nItemsPerTier - 1) / nItemsPerTier;
	}	
	// Roll to get a 2-digit item ID
	// (tens digit for the tier, ones digit for the variation)
	nItemID = (nItemTier * 10) + Random(nItemsPerTier) + 1;
	// Exceptions to pad out tiers with fewer items
	switch( nItemType ) {
	case 211: // Ranged - Targeting Scope
		if( nItemID == 44 )
			nItemID = 34;
		break;
	case 222: // Melee - Edge
		if( nItemID == 44 )
			nItemID = 32;
		break;
	case 223: // Melee - Energy Cell
		if( nItemID == 44 )
			nItemID = 34;
		break;
	case 231: // Armor - Overlay
		if( nItemID == 47 )
			nItemID = 36;
		else if( nItemID == 48 )
			nItemID = 38;
		break;
	case 241: // Lightsaber - Emitter
		if( nItemID == 42 )
			nItemID = 31;
		else if( nItemID == 43 )
			nItemID = 32;
		else if( nItemID == 44 )
			nItemID = 34;
		break;
	case 242: // Lightsaber - Lens
		if( nItemID == 34 )
			nItemID = 24;
		else if( nItemID == 35 )
			nItemID = 25;
		break;
	case 243: // Lightsaber - Energy Cell
		if( nItemID == 42 )
			nItemID = 31;
		else if( nItemID == 43 )
			nItemID = 33;
		else if( nItemID == 44 )
			nItemID = 34;
		break;
	}
	
	// Convert item ID to a real item variation
	return (((nItemID / 10) - 1) * nItemsPerTier) + (nItemID % 10);
}


////////////////////////////////////////////////////////////////////////////////
//	EQUIPMENT
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetBeltNum()

	Generates item variation number for equipment.

	JC 2024-06-01                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetEquipmentType() {
	int nRoll;
	if( LOOT_GetUniqueFound(351, 102) ) {
		nRoll = Random(4) + 1;
	}
	else {
		nRoll = Random(5) + 1;
		if( nRoll == 5 )
			LOOT_SetUniqueFound(351, 102, TRUE);
	}
	return 300 + 10 * nRoll;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetBeltNum()

	Generates item variation number for belts.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-26                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetBeltNum(int nItemLevel) {
	// Belts have 30 variations
	int nRoll = LOOT_D(nItemLevel);
	int nItemNum = 0;
	
	// Replacement table for if a better version of what we rolled is available
	do {
		switch( nRoll ) {
		case 1: // Adrenaline Amplifier --> Avanced Adrenaline Amplifier
			if( nItemLevel >= 5 )
				nRoll = 5;
			else
				nItemNum = nRoll;
			break;
		case 5: // Advanced Adrenaline Amplifier --> Hyper Adrenaline Amplifier
			if( nItemLevel >= 9 )
				nRoll = 9;
			else
				nItemNum = nRoll;
			break;

		case 2: // Cardio-Regulator --> Systech Cardio-Regulator
			if( nItemLevel >= 8 )
				nRoll = 8;
			else
				nItemNum = nRoll;
			break;
		case 8: // Systech Cardio-Regulator --> Aratech Cardio-Regulator
			if( nItemLevel >= 25 )
				nRoll = 25;
			else
				nItemNum = nRoll;
			break;

		case 3: // Stealth Field Generator
			// No stealth belts on Peragus, to make the one in the security locker matter
			if( GetStringRight(GetModuleName(), 3) == "PER" ) {
				nRoll = Random(2) + 1;
			}
			else if( nItemLevel >= 6 ) {
				// Stealth Field Generator --> Exchange Shadow Caster
				if( nItemLevel >= 10 && Random(2) == 0 )
					nRoll = 10;
				// Stealth Field Generator --> Aratech SD Belt
				else
					nRoll = 6;
			}
			else
				nItemNum = nRoll;
			break;

		case 4: // Czerka Utility Belt --> Tech Specialist Belt
			if( nItemLevel >= 24 )
				nRoll = 24;
			else
				nItemNum = nRoll;
			break;
		
		case 6: // Aratech SD Belt
			// No stealth belts on Peragus, to make the one in the security locker matter
			if( GetStringRight(GetModuleName(), 3) == "PER" ) {
				nRoll = Random(5) + 1;
				if( nRoll >= 3 )
					nRoll += 1;
			}
			break;
		
		case 7: // Strength Enhancer
			if( nItemLevel >= 15 ) {
				// Strength Enhancer --> GNS Strength Enhancer
				if( nItemLevel >= 26 && Random(2) == 0 )
					nRoll = 26;
				// Strength Enhancer --> CNS Strength Enhancer
				else
					nRoll = 15;
			}
			else
				nItemNum = nRoll;
			break;
		case 9: // Hyper Adrenaline Amplifier --> Adrenaline Stimulator
			if( nItemLevel >= 18 )
				nRoll = 18;
			else
				nItemNum = nRoll;
			break;
		
		case 10: // Exchange Shadow Caster
			// No stealth belts on Peragus, to make the one in the security locker matter
			if( GetStringRight(GetModuleName(), 3) == "PER" ) {
				nRoll = Random(7) + 1;
				if( nRoll >= 3 )
					nRoll += 1;
				if( nRoll >= 6 )
					nRoll += 1;
			}
			break;
		
		case 14: // Eriadu Stealth Unit --> Defel Mimicker
			if( nItemLevel >= 22 )
				nRoll = 22;
			else
				nItemNum = nRoll;
			break;
		case 22: // Defel Mimicker --> Aratech Echo Belt
			if( nItemLevel >= 29 )
				nRoll = 29;
			else
				nItemNum = nRoll;
			break;

		case 20: // Jal Shey Belt --> Jal Shey Mentor Belt
			if( nItemLevel >= 30 )
				nRoll = 30;
			else
				nItemNum = nRoll;
			break;

		case 27: // *Qel-Droma Belt*
			// If it was found before, replace with Jal Shey Mentor Belt
			if( LOOT_GetUniqueFound(311, nRoll) )
				nRoll = 30;
			else {
				LOOT_SetUniqueFound(311, 27, TRUE);
				nItemNum = nRoll;
			}
			break;
		
		default:
			nItemNum = nRoll;
			break;
		}
	} while( nItemNum <= 0 );

	return nItemNum;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetGloveNum()

	Generates item variation number for gloves.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetGloveNum(int nItemLevel) {
	// Gloves have 30 variations
	int nRoll = LOOT_D(nItemLevel);	
	int nItemNum = 0;
	
	// Replacement table for if a better version of what we rolled is available
	do {
		switch( nRoll ) {
		case 2: // Exchange Casual Gloves --> Exchange Work Gloves
			if( nItemLevel >= 7 )
				nRoll = 7;
			else
				nItemNum = nRoll;
			break;

		case 3: // Strength Gauntlets --> Eriadu Strength Amplifier
			if( nItemLevel >= 14 )
				nRoll = 14;
			else
				nItemNum = nRoll;
			break;
		case 14: // Eriadu Strength Amplifier --> Sith Power Gauntlets
			if( nItemLevel >= 17 )
				nRoll = 17;
			else
				nItemNum = nRoll;
			break;
		case 17: // Sith Power Gauntlets --> Dominator Gloves
			if( nItemLevel >= 25 )
				nRoll = 25;
			else
				nItemNum = nRoll;
			break;

		case 4: // Taris Survival Gloves --> Karakan Gauntlets
			if( nItemLevel >= 15 )
				nRoll = 15;
			else
				nItemNum = nRoll;
			break;

		case 9: // Detonator Gloves --> Bothan Precision Gloves
			if( nItemLevel >= 16 )
				nRoll = 16;
			else
				nItemNum = nRoll;
			break;

		case 12: // Jal Shey Perception Gloves --> Jal Shey Meditation Gloves
			if( nItemLevel >= 22 )
				nRoll = 22;
			else
				nItemNum = nRoll;
			break;

		case 21: // Automation Gloves --> Improved Automation Gloves
			if( nItemLevel >= 29 )
				nRoll = 29;
			else
				nItemNum = nRoll;
			break;

		case 27: // *Ossluk's Gloves*
			// If it was found before, replace with a random high level item
			if( LOOT_GetUniqueFound(321, nRoll) ) {
				nRoll = Random(8) + 22;
				if( nRoll == 27 )
					nRoll = 30;
			}
			else {
				LOOT_SetUniqueFound(321, 27, TRUE);
				nItemNum = nRoll;
			}
			break;
		
		default:
			nItemNum = nRoll;
			break;
		}
	} while( nItemNum <= 0 );

	return nItemNum;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetHeadgearNum()

	Generates item variation number for headgear.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetHeadgearNum(int nItemLevel) {
	// Headgear have 30 variations
	int nRoll = LOOT_D(nItemLevel);	
	int nItemNum = 0;
	int nLevel;
	
	// Replacement table for if a better version of what we rolled is available
	do {
		switch( nRoll ) {
		case 1: // Neural Band --> Matukai Meditation Band
			if( nItemLevel >= 23 )
				nRoll = 23;
			else
				nItemNum = nRoll;
			break;

		case 2: // No Breath Mask on Peragus, to make the one in the dormitory matter
			if( GetStringRight(GetModuleName(), 3) == "PER" ) {
				nRoll = LOOT_D(nItemLevel - 1);
				if( nRoll >= 2 )
					++nRoll;
			}
			break;

		case 3: // Rakatan Band --> Meditation Band
			if( nItemLevel >= 12 )
				nRoll = 12;
			else
				nItemNum = nRoll;
			break;
		case 12: // Meditation Band --> Matukai Meditation Band
			if( nItemLevel >= 23 )
				nRoll = 23;
			else
				nItemNum = nRoll;
			break;

		case 5: // Bothan Perception Visor --> Bothan Sensory Visor
			if( nItemLevel >= 13 )
				nRoll = 13;
			else
				nItemNum = nRoll;
			break;

		case 6: // Sonic Nullifiers --> Absorbtion Visor
			if( nItemLevel >= 29 )
				nRoll = 29;
			else
				nItemNum = nRoll;
			break;

		case 9: // Shielding Visor --> Enhanced Shielding Visor
			if( nItemLevel >= 27 )
				nRoll = 27;
			else
				nItemNum = nRoll;
			break;

		case 10: // Spacer's Sensor --> Combat Sensor
			if( nItemLevel >= 15 )
				nRoll = 15;
			else
				nItemNum = nRoll;
			break;

		case 25: // *Circlet of Saresh*
			// If it was found before, replace it
			if( LOOT_GetUniqueFound(331, 25) ) {
				// Bindo's Band if that hasn't been found
				if( !LOOT_GetUniqueFound(331, 26) ) {
					LOOT_SetUniqueFound(331, 26, TRUE);
					nItemNum = 26;
				}
				// Matukai Meditation Band
				else if( Random(2) == 0 )
					nRoll = 23;
				// Force Focusing Visor
				else
					nRoll = 30;
			}
			else {
				LOOT_SetUniqueFound(331, 25, TRUE);
				nItemNum = nRoll;
			}
			break;

		case 26: // *Bindo's Band*
			// If it was found before, replace it
			if( LOOT_GetUniqueFound(331, 26) ) {
				// Circlet of Saresh if that hasn't been found
				if( !LOOT_GetUniqueFound(331, 25) ) {
					LOOT_SetUniqueFound(331, 25, TRUE);
					nItemNum = 25;
				}
				// Matukai Meditation Band
				else if( Random(2) == 0 )
					nRoll = 23;
				// Force Focusing Visor
				else
					nRoll = 30;
			}
			else {
				LOOT_SetUniqueFound(331, 26, TRUE);
				nItemNum = nRoll;
			}
			break;
		
		default:
			nItemNum = nRoll;
			break;
		}
	} while( nItemNum <= 0 );

	return nItemNum;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetImplantTier()

	Determines which implant tier to use.

	Implant tiers have a sort of bell curve distribution. You're more likely to
	get implants matching your current Constitution score, or one level higher
	or lower. However, it's possible to get any implant level with	any score,
	so there's a chance of getting items to give to party members with higher
	or lower Constitution than your own.

	I've also incorporated the item level to skew the results towards higher
	quality	items as the game progresses. The target values for each implant
	tier are fixed, based on your Constitution score, but the die size is
	determined by the item level. It can be anything from a d96 (level 1) to
	a d125 (level 30+).

	Implant Level:    1       2       3       4
	----------------------------------------------
	Target range
		   CON 12:   1-60    1-20    1-10    1-10
		   CON 14:  61-80   21-70   11-30   11-20
		   CON 15:  81-90   71-90   31-80   21-40
		   CON 18:   91+     91+     81+     41+

	Probability with a d100 roll
		   CON 12:   60%     20%     10%     10%
		   CON 14:   20%     50%     20%     10%
		   CON 16:   10%     20%     50%     20%
		   CON 18:   10%     10%     20%     60%

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetImplantTier(int nItemLevel) {
	int nRoll = Random(95 + nItemLevel);
	int nCON = GetAbilityModifier(ABILITY_CONSTITUTION, GetFirstPC());

	if( nCON <= 1 ) {
		if( nRoll < 60 )
			return 1;
		if( nRoll < 80 )
			return 2;
		if( nRoll < 90 )
			return 3;
		return 4;
	}
	else if( nCON == 2 ) {
		if( nRoll < 20 )
			return 1;
		if( nRoll < 70 )
			return 2;
		if( nRoll < 90 )
			return 3;
		return 4;
	}
	else if( nCON == 3 ) {
		if( nRoll < 10 )
			return 1;
		if( nRoll < 30 )
			return 2;
		if( nRoll < 80 )
			return 3;
		return 4;
	}
	else {
		if( nRoll < 10 )
			return 1;
		if( nRoll < 20 )
			return 2;
		if( nRoll < 40 )
			return 3;
		return 4;
	}
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetImplantNum()

	Generates item variation number for all implant tiers.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetImplantNum(int nItemLevel) {
	// Implants have 10 variations
	return LOOT_D((nItemLevel + 2) / 3);
}


////////////////////////////////////////////////////////////////////////////////
//	ARMOR
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetLightArmorNum()

	Generates item variation number for light armor.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	JC 2024-05-25                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetArmorType() {
	// No Jedi robes on Peragus
	string sMod = GetStringRight(GetModuleName(), 3);
	if(  sMod == "PER" || sMod == "HAR" )
		return 400 + 10 * (Random(3) + 1);
	return 400 + 10 * (Random(4) + 1);
}

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetLightArmorNum()

	Generates item variation number for light armor.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetLightArmorNum(int nItemLevel) {
	// Armors have 15 variations
	int nRoll = LOOT_D((nItemLevel + 1) / 2);	
	int nItemNum = 0;
	
	// Replacement table for if a better version of what we rolled is available
	if( nRoll <= 3 && nItemLevel > 5 ) // Light Combat Suit, Combat Suit, & Heavy Combat Suit
		nRoll = Random(nItemLevel - 4) + 5;
	do {
		switch( nRoll ) {
		case 4: // Mandalorian Combat Suit --> Mandalorian Heavy Suit
			if( nItemLevel >= 9 )
				nRoll = 9;
			else
				nItemNum = nRoll;
			break;

		case 10: // Zabrak Battle Armor --> Zabrak Field Armor
			if( nItemLevel >= 14 )
				nRoll = 14;
			else
				nItemNum = nRoll;
			break;

		case 13: // Reinforced Fiber Mesh --> Zabrak Field Armor
			if( nItemLevel >= 14 )
				nRoll = 14;
			else
				nItemNum = nRoll;
			break;

		case 15: // *Ulic Qel-Droma's Mesh Suit*
			// If it was found before, replace with a random high level item
			if( LOOT_GetUniqueFound(411, 15) )
				nRoll = 14 - Random(6);
			else {
				LOOT_SetUniqueFound(411, 15, TRUE);
				nItemNum = nRoll;
			}
			break;
		
		default:
			nItemNum = nRoll;
			break;
		}
	} while( nItemNum <= 0 );

	return nItemNum;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetMediumArmorNum()

	Generates item variation number for medium armor.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetMediumArmorNum(int nItemLevel) {
	// Armors have 15 variations
	int nRoll = LOOT_D((nItemLevel + 1) / 2);	
	int nItemNum = 0;
	
	// Replacement table for if a better version of what we rolled is available
	if( nRoll <= 3 && nItemLevel > 5 ) // Military Suit, Light Battle Armor, & Echani Battle Armor
		nRoll = Random(nItemLevel - 4) + 5;
	do {
		switch( nRoll ) {
		case 4: // Cinnagar War Suit --> Heavy Cinnagar War Suit
			if( nItemLevel >= 12 )
				nRoll = 12;
			else
				nItemNum = nRoll;
			break;

		case 6: // Bronzium Light Battle Armor --> Powered Light Battle Armor
			if( nItemLevel >= 9 )
				nRoll = 9;
			else
				nItemNum = nRoll;
			break;

		case 7: // Verpine Fiber Mesh --> Exar Kun's Light Battle Suit
			if( nItemLevel >= 11 )
				nRoll = 11;
			else
				nItemNum = nRoll;
			break;
		case 11: // *Exar Kun's Light Battle Suit*
			// Replace with Verpine Fiber Ultramesh based on item level OR
			// if it was found before
			if( nItemLevel >= 13 || LOOT_GetUniqueFound(421, 11) )
				nRoll = 13;
			else {
				LOOT_SetUniqueFound(421, 11, TRUE);
				nItemNum = nRoll;
			}
			break;

		case 8: // Krath Heavy Armor --> Krath Holy Battle Suit
			if( nItemLevel >= 10 )
				nRoll = 10;
			else
				nItemNum = nRoll;
			break;

		case 15: // *Jamoh Hogra's Battle Armor*
			// If it was found before, replace with Powered Light Batle Armor
			if( LOOT_GetUniqueFound(421, 15) )
				nRoll = 9;
			else {
				LOOT_SetUniqueFound(421, 15, TRUE);
				nItemNum = nRoll;
			}
			break;
		
		default:
			nItemNum = nRoll;
			break;
		}
	} while( nItemNum <= 0 );

	return nItemNum;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetHeavyArmorNum()

	Generates item variation number for heavy armor.

	Replaces certain items when better versions are available.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetHeavyArmorNum(int nItemLevel) {
	// Armors have 15 variations
	int nRoll = LOOT_D((nItemLevel + 1) / 2);
	
	// Replacement table for if a better version of what we rolled is available
	if( nRoll <= 2 && nItemLevel > 5 )
		nRoll = Random(nItemLevel - 2) + 3; // Battle Armor & Heavy Battle Armor
	if( nRoll >= 3 && nRoll <= 4 && nItemLevel >= 7 )
		nRoll = Random(nItemLevel - 4) + 5; // Echani Heavy Armor & Durasteel Heavy Armor
	if( nRoll == 5 && nItemLevel >= 11 )
		nRoll = 11; // Powered Battle Armor --> Corellian Powersuit

	return nRoll;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetRobeNum()

	Generates item variation number for robes.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2021-01-03                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetRobeNum(int nItemLevel) {
	// Item level is reduced because the scaling for robes has to be slowed
	// down on account of how you can't roll for robes at all until after
	// Peragus.
	nItemLevel -= 5;
	if( nItemLevel < 1 )
		nItemLevel = 1;
	// Robes have 30 variations
	int nRoll = LOOT_D(nItemLevel);
	int nItemNum = 0;
	int nGlobal;
	int i;
	int j;
	
	// Replacement table for if a better version of what we rolled is available
	do {
		switch( nRoll ) {
		case 1: // No clothing ever
			nRoll = 2;
		case 2: // Padawan --> Jedi
			if( nItemLevel >= 8 )
				nRoll = 8;
			else
				nItemNum = nRoll;
			break;
		case 8: // Jedi --> Jedi Knight
			if( nItemLevel >= 13 )
				nRoll = 13;
			else
				nItemNum = nRoll;
			break;
		case 13: // Jedi Knight --> Jedi Master
			if( nItemLevel >= 17 )
				nRoll = 17;
			else
				nItemNum = nRoll;
			break;

		case 3: // Dark Padawan --> Dark Jedi
			if( nItemLevel >= 9 )
				nRoll = 9;
			else
				nItemNum = nRoll;
			break;
		case 9: // Dark Jedi --> Dark Jedi Knight
			if( nItemLevel >= 14 )
				nRoll = 14;
			else
				nItemNum = nRoll;
			break;
		case 14: // Dark Jedi Knight --> Dark Jedi Master
			if( nItemLevel >= 18 )
				nRoll = 18;
			else
				nItemNum = nRoll;
			break;

		case 4: // Baran Do Novice
			if( nItemLevel >= 10 ) {
				// Baran Do Novice --> Baran Do Sage
				if( nItemLevel >= 19 )
					nRoll = 19;
				// Baran Do Novice --> Baran Do Advisor
				else
					nRoll = 10;
			}
			else
				nItemNum = nRoll;
			break;

		case 5: // Matukai Apprentice --> Matukai Adept
			if( nItemLevel >= 15 )
				nRoll = 15;
			else
				nItemNum = nRoll;
			break;

		case 6: // Zeison Sha Initiate --> Zeison Sha Warrior
			if( nItemLevel >= 16 )
				nRoll = 16;
			else
				nItemNum = nRoll;
			break;

		case 7: // Jal Shey Neophyte --> Jal Shey Advisor
			if( nItemLevel >= 11 )
				nRoll = 11;
			else
				nItemNum = nRoll;
			break;
		case 11: // Jal Shey Advisor --> Jal Shey Mentor
			if( nItemLevel >= 20 )
				nRoll = 20;
			else
				nItemNum = nRoll;
			break;
		
		default:
			nItemNum = nRoll;
			break;
		}
	} while( nItemNum <= 0 );
	
	// If we rolled a unique item, we have to check if we found it before
	if( nItemNum >= 23 ) {
		nGlobal = LOOT_GetUniqueGlobalState(441);
		// If we found it before, replace it
		if( nGlobal >> LOOT_UniqueItemID(441, nItemNum) ) {
			if( nGlobal == 255 )
				nItemNum = 0;
			else {
				i = nRoll - 1;
				j = nRoll + 1;
				nItemNum = 0;
				// Start with numbers less than what we rolled and look for a
				// unique item we haven't found yet
				while( i >= 23 ) {
					if( !(nGlobal >> LOOT_UniqueItemID(441, i)) ) {
						nItemNum = i;
						i = 0;
					}
					else
						--i;
				}
				// If none were found, increase the number until we find one
				while( i > 0 && j <= 30 ) {
					if( !(nGlobal >> LOOT_UniqueItemID(441, j)) ) {
						nItemNum = j;
						i = 0;
					}
					else
						++j;
				}
			}
			// If all unique items have been found, roll for a non-unique item
			// (outputs a value of 15-22)
			if( nItemNum < 23 )
				nItemNum = 22 - Random(8);
			// Otherwise, set that whatever we got was found
			else
				LOOT_SetUniqueFound(441, nItemNum, TRUE);
		}
		// Otherwise, it's a new item, so set that we found it 
		else
			LOOT_SetUniqueFound(441, nItemNum, TRUE);
	}

	return nItemNum;
}


////////////////////////////////////////////////////////////////////////////////
//	DROID ITEMS
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidItemType()

	Determines droid item type.

	* 1/8 chance ARMOR
	* 1/8 chance UTILITY
	* 2/8 chance INTERFACE
	* 2/8 chance SHIELD
	* 2/8 chance DEVICE

	JC 2024-05-18                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidItemType() {
	switch( Random(8) ) {
	case 0:
		return 530; // Droid Armor
	case 1:
		return 520; // Droid Utility
	case 2:
	case 3:
		return 510; // Droid Interface
	case 4:
	case 5:
		return 540; // Droid Shield
	}
	return 550; // Droid Device
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidInterfaceNum()

	Generates item variation for droid interfaces.

	Replaces certain items when better versions are available.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidInterfaceNum(int nItemLevel) {
	// Droid interfaces have 15 variations
	int nRoll = LOOT_D((nItemLevel + 1) / 2);
	int nItemNum = 0;
	
	// Replacement table for if a better version of what we rolled is available
	do {
		switch( nRoll ) {
		case 1: // Droid Optimized Interface --> Droid Lockout Bypass
			if( nItemLevel >= 4 )
				nRoll = 4;
			else
				nItemNum = nRoll;
				break;
		case 4: // Droid Lockout Bypass --> Droid Exchange Interface
			if( nItemLevel >= 10 )
				nRoll = 10;
			else
				nItemNum = nRoll;
				break;

		case 3: // Droid Machine Interface --> Droid Scavenger Upgrade
			if( nItemLevel >= 13 )
				nRoll = 13;
			else
				nItemNum = nRoll;
				break;

		case 5: // Droid Parabolic Guides --> Droid Agility Upgrade
			if( nItemLevel >= 8 )
				nRoll = 8;
			else
				nItemNum = nRoll;
				break;

		case 7: // Droid Durability Upgrade --> Droid Scavenger Upgrade
			if( nItemLevel >= 13 )
				nRoll = 13;
			else
				nItemNum = nRoll;
				break;
		
		default:
			nItemNum = nRoll;
		}
	} while( nItemNum <= 0);

	return nItemNum;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidUtilityNum()

	Generates item variation for droid utilities.

	Replaces certain items when better versions are available.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidUtilityNum(int nItemLevel) {
	// Droid utilities have 15 variations
	int nRoll = LOOT_D((nItemLevel + 1) / 2);
	int nItemNum = 0;
	
	// Replacement table for if a better version of what we rolled is available
	do {
		switch( nRoll ) {
		case 1: // Droid Motion Tracker --> Droid Perception Sensors
			if( nItemLevel >= 8 )
				nRoll = 8;
			else
				nItemNum = nRoll;
			break;
		
		case 2: // Droid Upgrade Slot isn't needed after level 7
			if( nItemLevel >= 7 ) {
				nRoll = Random(nItemLevel - 1) + 1;
				if( nRoll == 2 )
					nRoll = nItemLevel;
			}
			else
				nItemNum = nRoll;
			break;
		case 4: // Droid Advanced Upgrade Slot isn't needed after level 13
			if( nItemLevel >= 13 ) {
				nRoll = Random(nItemLevel - 2) + 1;
				if( nRoll == 2 )
					nRoll = nItemLevel - 1;
				else if( nRoll == 4 )
					nRoll = nItemLevel;
			}
			else
				nItemNum = nRoll;
			break;

		case 10: // Droid Warfare Upgrade --> Droid Battle Upgrade
			if( nItemLevel >= 11 )
				nRoll = 11;
			else
				nItemNum = nRoll;
			break;
		
		default:
			nItemNum = nRoll;
			break;
		}
	} while( nItemNum <= 0 );

	return nItemNum;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidArmorNum()

	Generates item variation for droid armor.

	Replaces certain items when better versions are available.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidArmorNum(int nItemLevel) {
	// Droid armors have 15 variations
	int nRoll = LOOT_D((nItemLevel + 1) / 2);
	int nItemNum = 0;
	
	// Reroll 14 & 15 for variety since the last three are all Energized Armor
	if( nRoll == 14 || nRoll == 15 ) {
		nRoll = 13 - Random(10);
	}
	
	// Modular Plating III replaced at higher levels
	if( nRoll == 7 && nItemLevel >= 14 )
		nRoll = Random(nItemLevel - 10) + 8;
	
	// Replacement table for if a better version of what we rolled is available
	do {
		switch( nRoll ) {
		case 1: // Impact Armor I --> Impact Armor II
			if( nItemLevel >= 4 ) {
				if( nItemLevel >= 7 || Random(2) == 0 )
					nRoll = 3;
				else
					nItemNum = nRoll;
			}
			else
				nItemNum = nRoll;
			break;
		case 3: // Impact Armor II --> Impact Armor III
			if( nItemLevel >= 5 ) {
				if( nItemLevel >= 13 || Random(2) == 0 )
					nRoll = 5;
				else
					nItemNum = nRoll;
			}
			else
				nItemNum = nRoll;
			break;
		case 5: // Impact Armor III --> Modular Plating II
			if( nItemLevel >= 10 && nItemLevel < 13 )
				nRoll = 6;
			else
				nItemNum = nRoll;
			break;
		case 2: // Modular Plating I --> Modular Plating II
			if( nRoll != 6 ) { // if we didn't fall through from case 5
				if( nItemLevel >= 6 ) {
					if( nItemLevel >= 7 || Random(2) == 1 )
						nRoll = 6;
					else
						nItemNum = nRoll;
				}
				else
					nItemNum = nRoll;
			}
			else
				nItemNum = nRoll;
			break;
		case 6: // Modular Plating II --> Modular Plating III
			if( nItemLevel >= 7 ) {
				if( nItemLevel >= 13 || Random(2) == 0 )
					nRoll = 7;
				else
					nItemNum = nRoll;
			}
			else
				nItemNum = nRoll;
			break;

		case 9: // Dura Plating I --> Dura Plating II
			if( nItemLevel >= 20 )
				nRoll = 11;
			else
				nItemNum = nRoll;
			break;

		case 13: // Energized Armor I --> Energized Armor II
			if( nItemLevel >= 26 )
				nRoll = 14;
			else
				nItemNum = nRoll;
			break;
		
		case 14: // Energized Armor II --> Energized Armor III
			if( nItemLevel >= 28 )
				nRoll = 15;
			else
				nItemNum = nRoll;
			break;
		
		default:
			nItemNum = nRoll;
			break;
		}
	} while( nItemNum <= 0 );

	return nItemNum;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidShieldSubtype()

	Generates subtype for droid shields.

	Droid shields are divided into two subtypes, based on the sorts of damage
	they block - ENERGY for Energy, Electric, and Ion damage, and ENVIRONMENTAL
	for Energy, Sonic, Cold, Heat, and Ion damagee.

	JC 2019-02-11                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidShieldSubtype() {
	return 540 + Random(2) + 1;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidShieldTier()

	Determines item tier for droid shields. Both shield subtypes have three
	tiers.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidShieldTier(int nItemLevel) {
	if( nItemLevel >= 13 )
		return 3;
	if( nItemLevel >= 7 )
		return 2;
	return 1;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidShieldNum()

	Generates item variation for droid shields.

	Droid shields have two subtypes, ENERGY and ENVIRONMENTAL, but they share
	the same item prefix (d_shield_) so the item proper item number has to be
	extracted.

	Droid shields have the following item progression:
	* ENERGY:
	  Deflector Mark I --> Deflector Mark II --> Deflector Mark III
	* ENVIRONMENTAL:
	  Defense Barrier --> Energy Collector --> Unity Grid

	- nItemLevel: Item level determining the quality of the items we can get
	- nItemType: Item type (item classifications, droid shields only)
	- nItemTier: Optional number to specify an item tier

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidShieldNum(int nItemLevel, int nItemType, int nItemTier) {
	// If shield subtype isn't known, randomly generate it
	if( nItemType != 541 &&
		nItemType != 542 ) {
		nItemType = 540 + Random(2) + 1;
	}
	// If the item tier isn't known, randomly generate it
	if( nItemTier < 1 || nItemTier > 3 ) {
		nItemTier = LOOT_GetDroidShieldTier(nItemLevel);
	}

	switch( nItemType ) {
	case 541: // Droid Shield - Energy
		switch( nItemTier ) {
		case 1: // Deflector Mark I
			return 1;
		case 2: // Deflector Mark II
			return 2;
		case 3: // Deflector Mark III
			return 5;
		}
		break;
	case 542: // Droid Shield - Environmental
		switch( nItemTier ) {
		case 1: // Defense Barrier
			return 3;
		case 2: // Energy Collector
			return 4;
		case 3: // Unity Grid
			return 6;
		}
		break;
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidDeviceNum()

	Generates item variation for droid devices.

	Replaces certain items when better versions are available.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidDeviceNum(int nItemLevel) {
	// Droid devices have 15 variations
	int nRoll = LOOT_D((nItemLevel + 1) / 2);
	int nItemNum = 0;
	
	// Replace 14 for variety, since there are three Ion Blasts
	if( nRoll == 14 && nItemLevel < 15 )
		nRoll = Random(13) + 1; // Reroll
	else if( nItemLevel >= 15 )
		nRoll = 15; // Ion Blast Mark III --> Multi-Spectral Emitter
	
	// Replacement table for if a better version of what we rolled is available
	do {
		switch( nRoll ) {
		case 1: // Neural Pacifier --> Neural Scrambler
			if( nItemLevel >= 5 )
				nRoll = 5;
			else
				nItemNum = nRoll;
			break;

		case 3: // Flame Thrower --> Molten Cannon
			if( nItemLevel >= 7 )
				nRoll = 7;
			else
				nItemNum = nRoll;
			break;

		case 4: // Toxin Emitter --> Bio-Assault Spray
			if( nItemLevel >= 10 )
				nRoll = 10;
			else
				nItemNum = nRoll;
			break;

		case 6: // Ion Striker --> Plasma Thrower
			if( nItemLevel >= 9 )
				nRoll = 9;
			else
				nItemNum = nRoll;
			break;

		case 8: // Carbonite Projector --> Carbonite Emitter
			if( nItemLevel >= 11 )
				nRoll = 11;
			else
				nItemNum = nRoll;
			break;

		case 12: // Ion Blast Mark I --> Ion Blast Mark II
			if( nItemLevel >= 13 )
				nRoll = 13;
			else
				nItemNum = nRoll;
			break;
		case 13: // Ion Blast Mark II --> Ion Blast Mark III
			if( nItemLevel >= 14 )
				nRoll = 14;
			else
				nItemNum = nRoll;
			break;
		
		default:
			nItemNum = nRoll;
			break;
		}
	} while( nItemNum <= 0 );

	return nItemNum;
}


////////////////////////////////////////////////////////////////////////////////
//	DISPOSABLE ITEMS
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	GetDisposableType()

	Determines disposable item type.
	
	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int GetDisposableType() {
	int nRange;
	// Limited selection early on (no skill items or grenades)
	if( GetGlobalNumber("G_PC_LEVEL") < 6 )
		nRange = 6;
	// No rockets if no Mira
	else if( !IsAvailableCreature(NPC_MIRA) )
		nRange = 8;
	// All access
	else
		nRange = 9;
	return 900 + 10 * (Random(nRange) + 1);
}

////////////////////////////////////////////////////////////////////////////////
/*	GetDisposableSubtype()

	Determines disposable item subtype.

	- nItemLevel: Item level determining the quality of the items we can get
	- nItemType: Type of item (item classifications, shields only)

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int GetDisposableSubtype(int nItemLevel, int nItemType) {
	switch( nItemType ) {
	case 920: // Components & Chemicals
		return LOOT_GetComponentChemicalSubtype();
	case 930: // Shields
		return LOOT_GetShieldSubtype();
	case 940: // Medical Items
		return LOOT_GetMedicalSubtype();
	case 950: // Stimulants
		return LOOT_GetStimSubtype();
	case 970: // Grenades
		return LOOT_GetGrenadeSubtype(nItemLevel);
	case 980: // Skill Items
		return LOOT_GetSkillSubtype();
	}
	return nItemType + 1;
}


int LOOT_GetComponentChemicalSubtype() {
	return 920 + Random(2) + 1;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetShieldSubtype()

	Generates subtype for shields.

	I've split the shields up into three types, based on what sort of damage
	they absorb: ENERGY for Energy and Electrical damage; ENVIRONMENTAL for
	Energy and Electrical damage as well as Sonic, Heat, and Cold at higher
	tiers; and MELEE for Bludgeoning, Slashing, and Piercing as	well as Energy
	at higher tiers.

	JC 2019-02-12                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetShieldSubtype() {
	return 930 + Random(3) + 1;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetShieldTier()

	Determines item tier for shields.

	Each shield subtype has 4 tiers, all based on the same level scale.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetShieldTier(int nItemLevel) {
	if( nItemLevel >= 23 )
		return 4;
	if( nItemLevel >= 19 )
		return 3;
	if( nItemLevel >= 7 )
		return 2;
	return 1;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetShieldNum()

	Generates item variation for shields.

	Each shield subtype has 4 tiers with the following progression:
	* ENERGY
	  Energy Shield --> Echani Shield --> Echani Dueling Shield --> Verpine
	  Prototype Shield
	* ENVIRONMENTAL
	  Energy Shield --> Arkanian Energy Shield --> 1d2 x Arkanian Energy Shield
	  --> Verpine Prototype Shield
	* MELEE
	  Mandalorian Melee Shield --> Mandalorian Power Shield --> 1d2 x
	  Mandalorian Power Shield --> 1d3 x Mandalorian Power Shield

	Item quantities are handled through the LOOT_GetShieldQuantity() function.

	- nItemLevel: Item level determining the quality of the items we can get
	- nItemType: Type of item (item classifications, shields only)
	- nItemTier: Optional number to specify an item tier

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetShieldNum(int nItemLevel, int nItemType, int nItemTier) {
	// If the item type isn't known, randomly generate it
	if( nItemType != 931 &&
		nItemType != 932 &&
		nItemType != 933 ) {
		nItemType = LOOT_GetShieldSubtype();
	}
	// If the item tier isn't known, randomly generate it
	if( nItemTier < 1 || nItemTier > 4 ) {
		nItemTier = LOOT_GetShieldTier(nItemLevel);
	}
	switch( nItemType ) {
	case 931: // Shield - Energy
		switch( nItemTier ) {
		case 1:
			return 1; // Energy Shield
		case 2:
			return 4; // Echani Shield
		case 3:
			return 6; // Echani Dueling Shield
		case 4:
			return 7; // Verpine Prototype Shield
		}
		break;
	case 932: // Shield - Enviro
		switch( nItemTier ) {
		case 1:
			return 1; // Energy Shield
		case 2:
		case 3:
			return 3; // Arkanian Energy Shield
		case 4:
			return 7; // Verpine Prototype Shield
		}
		break;
	case 933: // Shield - Melee
		switch( nItemTier ) {
		case 1:
			return 2; // Mandalorian Melee Shield
		case 2:
		case 3:
		case 4:
			return 5; // Mandalorian Power Shield
		}
		break;
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetShieldQuantity()

	Determines amount of shields to give, based on type.

	Each shield subtype has 4 tiers with the following progression:
	* ENERGY
	  Energy Shield --> Echani Shield --> Echani Dueling Shield --> Verpine
	  Prototype Shield
	* ENVIRONMENTAL
	  Energy Shield --> Arkanian Energy Shield --> 1d2 x Arkanian Energy Shield
	  --> Verpine Prototype Shield
	* MELEE
	  Mandalorian Melee Shield --> Mandalorian Power Shield --> 1d2 x
	  Mandalorian Power Shield --> 1d3 x Mandalorian Power Shield

	- nItemLevel: Item level determining the quality of the items we can get
	- nItemType: Type of item (item classifications, shields only)

	JC 2019-08-02                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetShieldQuantity(int nItemLevel, int nItemType, int nItemTier) {
	// If the item tier isn't known, randomly generate it
	if( nItemTier < 1 && nItemTier > 4 )
		nItemTier = LOOT_GetShieldTier(nItemLevel);
	// Enviro
	if( nItemType == 932 && nItemTier == 3 )
		return Random(2) + 1;
	// Melee
	if( nItemType == 933 ) {
		if( nItemTier == 3 )
			return Random(2) + 1;
		if( nItemTier == 4 )
			return Random(3) + 1;
	}
	return 1; // default to 1
}

int LOOT_GetMedicalSubtype() {
	return 940 + Random(2) + 1;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetMedpacTier()

	Determines item tier for medical items (medpacs and repair kits).

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-08-02                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetMedpacTier(int nItemLevel) {
	if( nItemLevel < 9 )
		return 1;
	if( nItemLevel < 16 )
		return 2;
	return 3;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetStimSubtype()

	Generates subtype for stimulants.

	Stims are divided into four subtypes:
	* Constitution (CON)
	* Dexterity (DEX)
	* Strength (STR)
	* Battle (BAT)

	- nFilter: Used to exlude certain results if desired
	  * 0: Everything
	  * 1: Stimulants only, no medpacs
	  * 2: STR, DEX, and CON stimulants only, no battle stimulants or medpacs

	JC 2019-08-02                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetStimSubtype(int nFilter) {
	int nRange;
	if( nFilter == 2 )
		nRange = 3; // Stats
	else if( nFilter == 1 )
		nRange = 4; // Drugs
	else
		nRange = 5; // Any
	return 950 + Random(nRange) + 1;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetStimTier()

	Determines item tier for stimulants.

	Battle stimulants have 3 tiers. CON, DEX, and STR stimulants have only 2
	tiers, but this function will output up to 3 for them anyway. This gets
	fixed in the LOOT_GetStimNum() function.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-08-02                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetStimTier(int nItemLevel) {
	if( nItemLevel < 12 )
		return 1;
	if( nItemLevel < 22 )
		return 2;
	return 3;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetStimNum()

	Generates item variation number for stimulants.

	CON, DEX, and STR stimulants have two tiers and share an item prefx, so the
	proper number has to be extracted. Battle stimulants have three tiers and
	a separate item prefix.

	- nItemLevel: Item level determining the quality of the items we can get
	- nItemType: Type of item (item classifications, stims only)
	- nItemTier: Optional number to specify an item tier

	JC 2019-08-02                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetStimNum(int nItemLevel, int nItemType, int nItemTier) {
	// If the item type isn't known, randomly generate it
	if( !(nItemType >= 951 && nItemType <= 953) && nItemType != 955 )
		nItemType = LOOT_GetStimSubtype(1);
	// If the tier isn't known, randomly generate it
	if( nItemTier < 1 || nItemTier > 3 )
		nItemTier = LOOT_GetStimTier(nItemLevel);	
	// Stat stimulants are weird
	// STR
	if( nItemType == 951 ) {
		if( nItemTier == 1 )
			return 3;
		return 6;
	}
	// DEX
	else if( nItemType == 952 ) {
		if( nItemTier == 1 )
			return 2;
		return 5;
	}
	// CON
	else if( nItemType == 953 ) {
		if( nItemTier == 1 )
			return 1;
		return 4;
	}
	// Battle stimulants are fine
	else
		return nItemTier;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetGrenadeSubtype()

	Determines grenade subtype (ADHESIVE, CONCUSSION, CRYOBAN, FRAG, ION,
	PLASMA, POISON, SONIC, or THERMAL DETONATOR).

	I've separated the grenades into four rarity categories:
	 * very common (frag)
	 * common (adhesive, concussion)
	 * less common (CryoBan, ion, plasma, poison)
	 * rare (thermal detonator)

	Certain grenades have level checks - they won't appear unless you roll a
	certain item level.

	Item Level:   1     4     7    11    15
	----------------------------------------
	  Adhesive:  10%   10%   15%   15%   15%
	Concussion:   0%   10%   15%   15%   15%
	   CryoBan:   0%    0%    0%   10%   10%
		  Frag:  75%   65%   30%   20%   15%
		   Ion:   5%    5%   10%   10%   10%
		Plasma:   5%    5%   10%   10%   10%
		Poison:   0%    0%   10%   10%   10%
		 Sonic:   5%    5%   10%   10%   10%
			TD:   0%    0%    0%    0%    5%

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetGrenadeSubtype(int nItemLevel) {
	int nRoll = Random(20);	
	// Level 1-3
	if( nItemLevel < 4 ) {
		switch( nRoll ) {
		case 0:
			return 978; // Sonic
		case 1:
			return 975; // Plasma
		case 2:
			return 976; // Ion
		case 3:
		case 4:
			return 971; // Adhesive
		default:
			return 979; // Frag;
		}
	}
	// Level 4-6
	else if( nItemLevel < 7 ) {
		switch( nRoll ) {
		case 0:
			return 978; // Sonic
		case 1:
			return 975; // Plasma
		case 2:
			return 976; // Ion
		case 3:
		case 4:
			return 972; // Concussion
		case 5:
		case 6:
			return 971; // Adhesive
		default:
			return 979; // Frag
		}
	}
	// Level 7-10
	else if( nItemLevel < 11 ) {
		switch( nRoll ) {
		case 0:
		case 1:
			return 978; // Sonic
		case 2:
		case 3:
			return 977; // Poison
		case 4:
		case 5:
			return 975; // Plasma
		case 6:
		case 7:
			976; // Ion
		case 8:
		case 9:
		case 10:
			return 972; // Concussion
		case 11:
		case 12:
		case 13:
			return 971; // Adhesive
		default:
			return 979; // Frag
		}
	}
	// Level 11-14
	else if( nItemLevel < 15 ) {
		switch( nRoll ) {
		case 0:
		case 1:
			return 978; // Sonic
		case 2:
		case 3:
			return 977; // Poison
		case 4:
		case 5:
			return 975; // Plasma
		case 6:
		case 7:
			return 976; // Ion
		case 8:
		case 9:
			return 973; // CryoBan
		case 10:
		case 11:
		case 12:
			return 972; // Concussion
		case 13:
		case 14:
		case 15:
			return 971; // Adhesive
		default:
			return 979; // Frag
		}
	}
	// Level 15+
	else {
		switch( nRoll ) {
		case 0:
			return 974; // Thermal Detonator
		case 1:
		case 2:
			return 978; // Sonic
		case 3:
		case 4:
			return 977; // Poison
		case 5:
		case 6:
			return 975; // Plasma
		case 7:
		case 8:
			return 976; // Ion
		case 9:
		case 10:
			return 973; // CryoBan
		case 11:
		case 12:
		case 13:
			return 972; // Concussion
		case 14:
		case 15:
		case 16:
			return 971; // Adhesive
		default:
			979; // Frag
		}
	}
	return 979;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetGrenadeQuantity()

	Determines amount of grenades to give, based on type.

	At higher levels, the quantity of common and less common grenades is
	increased to 1d2 and the quantity of very common grenades up to 2d2.

	- nItemLevel: Item level determining the quantity of items we get
	- nItemType: Type of item (item classifications, grenades only)

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetGrenadeQuantity(int nItemLevel, int nItemType) {
	// If the item type isn't known, randomly generate it
	if( nItemType < 971 && nItemType > 979 )
		nItemType = LOOT_GetGrenadeSubtype(nItemLevel);
	switch( nItemType ) {
	case 971: // Adhesive
	case 972: // Concussion
	case 973: // CryoBan
	case 975: // Plasma
	case 976: // Ion
	case 977: // Poison
	case 978: // Sonic
		if( nItemLevel >= 7 )
			return Random(2) + 1;
		break;
	case 979: // Frag
		if( nItemLevel < 7 )
			return Random(2) + 1;
		if( nItemLevel < 11 )
			return Random(3) + 1;
		if( nItemLevel < 15 )
			return Random(4) + 1;
		return Random(2) + Random(2) + 2;
	}
	return 1; // default to 1 item
}

int LOOT_GetSkillSubtype() {
	return 980 + Random(3) + 1;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetSecuritySpikeTier()

	Determines security spike tier.

	Security spikes have two tiers: Security Tunnelers grant a +5 bonus	and
	Security Spike Tunnelers grant a +10 bonus.

	This function rolls a d10 and adds it to the item level; at level 10, the
	player will have a chance of getting Security Spike Tunnelers and after
	level 20 they will always receive them.

	- nItemLevel: Item level determining the quality of items we can get

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetSecuritySpikeTier(int nItemLevel) {
	if( (nItemLevel + Random(10) + 1) % 10 < 2 )
		return 1;
	return 2;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetRocketNum()

	Determines item variation for Mira's rockets.

	Replaces certain items when better versions are available.

	- nItemLevel: Item level determining the quality of items we can get

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetRocketNum(int nItemLevel) {
	// AOE rockets are only available at higher levels
	int nRange;
	if( nItemLevel < 10 )
		nRange = 4;
	else nRange = 8;
	// Roll for rocket type
	int nRoll = Random(nRange);
	int nItemNum;
	switch( nRoll ) {
	case 0: // Tranquilizer Dart
		nItemNum = 2;
		break;
	case 1: // Poison Dart
		nItemNum = 7;
		break;
	case 2: // Piercing Dart
		break;
	case 3: // Concussion Rocket
		nItemNum = 11;
		break;
	case 4: // Poison Rocket
		nItemNum = 6;
		break;
	case 5: // Explosive Rocket
		nItemNum = 1;
		break;
	case 6: // Ion Rocket
		nItemNum = 10;
		break;
	case 7: // Plasma Rocket
		nItemNum = 5;
		break;
	}
	// Replacement table for if a better version of what we rolled is available
	if( nItemLevel >= 10 ) {
		if( nItemNum == 2 ) // Tranquilizer Dart --> Paralysis Dart
			nItemNum = 9;
		else if( nItemNum == 6 ) // Poison Dart --> Kyber Dart
			nItemNum = 4;
		else if( nItemNum == 8 ) // Piercing Dart --> Buster Rocket
			nItemNum = 3;
	}
	return nItemNum;
}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDisposableLateGame()

	Determines disposable item type for loot rolled late in the game.

	Only certain item types are included due to party restrictions and the lack
	of merchants, lab stations, etc.

	Stimulants:	15% chance
	Shields:	15% chance
	Grenades:	30% chance
	Medpacs		40% chance

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDisposableLateGame(int nItemLevel) {
	int nRoll = Random(100);
	if( nRoll < 15 )
		return LOOT_GetStimSubtype(1); // Drugs only
	if( nRoll < 30 )
		return LOOT_GetShieldSubtype();
	if( nRoll < 60 )
		return LOOT_GetGrenadeSubtype(nItemLevel);
	return 941; // Medpac
}


////////////////////////////////////////////////////////////////////////////////
//	ITEM TEMPLATES
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetItemPrefix()

	Returns a string for item templates, without the suffix for the item
	variation number.

	JC 2024-04-27                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetItemPrefix(int nItemType) {
	switch( nItemType ) {
	case 111: return "w_blaste_";
	case 121: return "w_brifle_";
	case 131: return "w_melee_";
	case 141: return "g_w_lghtsbr";
	case 142: return "g_w_shortsbr";
	case 143: return "g_w_dblsbr0";
	case 151: return "mininglaser";
	case 152: return "advancedminingla";
	case 153: return "heavymininglaser";
	case 154: return "vibrocutter";
	case 155: return "guidonbeacon";
	case 211: return "u_r_targ_";
	case 212: return "u_r_firi_";
	case 213: return "u_r_powe_";
	case 221: return "u_m_grip_";
	case 222: return "u_m_edge_";
	case 223: return "u_m_cell_";
	case 231: return "u_a_over_";
	case 232: return "u_a_unde_";
	case 241: return "u_l_emit_";
	case 242: return "u_l_lens_";
	case 243: return "u_l_cell_";
	case 244: return "u_l_crys_";
	case 245: return "u_l_colo_";
	case 311: return "a_belt_";
	case 321: return "a_gloves_";
	case 331: return "a_helmet_";
	case 341: return "e_imp1_";
	case 342: return "e_imp2_";
	case 343: return "e_imp3_";
	case 344: return "e_imp4_";
	case 351: return "a_band_";
	case 411: return "a_light_";
	case 421: return "a_medium_";
	case 431: return "a_heavy_";
	case 441: return "a_robe_";
	case 511: return "d_tool_";
	case 521: return "d_interface_";
	case 531: return "d_armor_";
	case 541: return "d_shield_";
	case 542: return "d_shield_";
	case 551: return "d_device_";
	}
	return "";
}

////////////////////////////////////////////////////////////////////////////////
/*	GetTreasureSpecific()

	Generates template string for random loot.

	- nItemLevel: Item level determining the quality of the items we can get
	- nItemType: Type of item (item classifications)

	JC 2024-04-27                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetTreasureSpecific(int nItemLevel, int nItemType) {
	int class = nItemType;
	int type = nItemType;
	int subtype = nItemType;
	// SendMessageToPC(GetFirstPC(), "Treasure Specific (" + IntToString(nItemLevel) + ", " + IntToString(nItemType) + ")");
	// Cap the item level to avoid incidents
	if( nItemLevel > 30 )
		nItemLevel = 30;
	// Determine item type if not known
	if( nItemType < 100 ) {
		nItemType = LOOT_GetSpecificClass(nItemLevel);
		class = nItemType;
	}
	if( (nItemType % 100) < 10 ) {
		nItemType = LOOT_GetSpecificType(nItemLevel, nItemType);
		type = nItemType;
	}
	if( nItemType % 10 < 1 ) {
		nItemType = LOOT_GetSpecificSubtype(nItemLevel, nItemType);
		subtype = nItemType;
	}
	int nItemVariation = LOOT_GetSpecificVariation(nItemLevel, nItemType);
	string sTemplate = GetItemPrefix(nItemType) + LOOT_Suffix(nItemVariation);
	LOOT_DebugItem(class, type, subtype, nItemVariation, sTemplate);
	return sTemplate;
}

////////////////////////////////////////////////////////////////////////////////
/*	GetBundlePrefix

	Generates the exact treasure blob for a bundle of disposable items.	A
	treasure blob encodes both the item template and the amount of items in a
	single string.

	e.g. 3 thermal detonators will output as: g_w_thermldet01[0003]

	- nItemLevel: Item level determining the quality of the items we can get
	- nItemType: Type of item (item classifications, disposables only)

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetBundlePrefix(int nItemLevel, int nItemType) {
	// Limited selection late in the game
	if( LOOT_IsLateGame() )
		nItemType = LOOT_GetDisposableLateGame(nItemLevel);
	// Legacy support to filter out scrubbed rocket IDs, just in case
	if( nItemType >= 992 && nItemType <= 995 )
		nItemType = 991;

	string sTemplate = "";
	string sPrefix = "";
	int nItemNum = 1;
	int nItemQuantity = 1; // default to 1 item

	switch( nItemType ) {
	case 911: // Credits
		sTemplate = "g_i_credits015";
		nItemQuantity = Random(10 * nItemLevel) + Random(50) + 20;
		break;
	case 921:// Components
		sTemplate = "compont_00001";
		nItemQuantity = Random(nItemLevel) + Random(nItemLevel) + 1;
		break;
	case 922: // Chemicals
		sTemplate = "chem_00001";
		nItemQuantity = Random(nItemLevel) + Random(nItemLevel) + 1;
		break;
	case 931: // Shield - Energy
		sPrefix = "a_shield_";
		nItemNum = LOOT_GetShieldNum(nItemLevel, nItemType);
		nItemQuantity = LOOT_GetShieldQuantity(nItemLevel, nItemType);
		break;
	case 932: // Shield - Enviro
		sPrefix = "a_shield_";
		nItemNum = LOOT_GetShieldNum(nItemLevel, nItemType);
		nItemQuantity = LOOT_GetShieldQuantity(nItemLevel, nItemType);
		break;
	case 933: // Shield - Melee
		sPrefix = "a_shield_";
		nItemNum = LOOT_GetShieldNum(nItemLevel, nItemType);
		nItemQuantity = LOOT_GetShieldQuantity(nItemLevel, nItemType);
		break;
	case 941: // Medpac
		sPrefix = "g_i_medeqpmnt";
		nItemNum = LOOT_GetMedpacTier(nItemLevel);
		break;
	case 942:// Repair Kit
		sPrefix = "g_i_drdrepeqp0";
		nItemNum = LOOT_GetMedpacTier(nItemLevel);
		break;
	case 951: // Stim - Constitution
		sPrefix = "g_i_adrnaline0";
		nItemNum = LOOT_GetStimNum(nItemLevel, nItemType);
		break;
	case 952: // Stim - Dexterity
		sPrefix = "g_i_adrnaline0";
		nItemNum = LOOT_GetStimNum(nItemLevel, nItemType);
		break;
	case 953: // Stim - Strength
		sPrefix = "g_i_adrnaline0";
		nItemNum = LOOT_GetStimNum(nItemLevel, nItemType);
		break;
	case 954: // Extra Medpacs
		sPrefix = "g_i_medeqpmnt";
		nItemNum = LOOT_GetMedpacTier(nItemLevel);
		break;
	case 955: // Stim - Battle
		sPrefix = "g_i_cmbtshot0";
		nItemNum = LOOT_GetStimNum(nItemLevel, nItemType);
		break;
	case 961: // Extra Credits
		sTemplate = "g_i_credits015";
		nItemQuantity = Random(2 * nItemLevel) + Random(50) + 10;
		break;
	case 971: // Grenade - Adhesive
		sTemplate = "g_w_adhsvgren001";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	case 972: // Grenade - Concussion
		sTemplate = "g_w_stungren01";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	case 973: // Grenade - CryoBan
		sTemplate = "g_w_cryobgren001";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	case 974: // Grenade - Thermal Detonator
		sTemplate = "g_w_thermldet01";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	case 975: // Grenade - Plasma
		sTemplate = "g_w_firegren001";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	case 976: // Grenade - Ion
		sTemplate = "g_w_iongren01";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	case 977: // Grenade - Poison
		sTemplate = "g_w_poisngren01";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	case 978: // Grenade - Sonic
		sTemplate = "g_w_sonicgren01";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	case 979: // Grenade - Frag
		sTemplate = "g_w_fraggren01";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	case 981: // Parts
		sTemplate = "g_i_parts01";
		break;
	case 982: // Computer Spikes
		sTemplate = "g_i_progspike01";
		break;
	case 983: // Security Spikes
		sPrefix = "g_i_secspike";
		nItemNum = LOOT_GetSecuritySpikeTier(nItemLevel);
		break;
	case 991: // Rockets
		sPrefix = "w_rocket_";
		nItemNum = LOOT_GetRocketNum(nItemLevel);
		break;
	}
	
	// If we don't have a template string yet, add the item prefix and number to
	// get our template.
	if( sTemplate == "" )
		sTemplate = sPrefix + LOOT_Suffix(nItemNum);

	return sTemplate + SWTR_GetQuantity(nItemQuantity);
}

////////////////////////////////////////////////////////////////////////////////
/*	GetTreasureBundle()

	Generates template string for disposable items.

	- nItemLevel: Item level determining the quality of the items we can get
	- nItemType: Type of item (item classifications, disposables only)

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetTreasureBundle(int nItemLevel, int nItemType) {
	int class = nItemType;
	int type = nItemType;
	int subtype = nItemType;
	// SendMessageToPC(GetFirstPC(), "Treasure Bundle (" + IntToString(nItemLevel) + ", " + IntToString(nItemType) + ")");
	// Cap the item level to avoid incidents
	if( nItemLevel > 30 )
		nItemLevel = 30;
	// Limited selection late in the game
	if( LOOT_IsLateGame() )
		nItemType = LOOT_GetDisposableLateGame(nItemLevel);
	if( (nItemType % 100) < 10) {
		nItemType = GetDisposableType();
		type = nItemType;
	}
	if( nItemType % 10 < 1 ) {
		nItemType = GetDisposableSubtype(nItemLevel, nItemType);
		subtype = nItemType;
	}
	string sTemplate = GetBundlePrefix(nItemLevel, nItemType);
	LOOT_DebugItem(class, type, subtype, 0, sTemplate);
	return sTemplate;
}

////////////////////////////////////////////////////////////////////////////////
/*	GetTreasureNormal()

	Generates a template string for an item of normal quality.

	- nItemLevel: Item level determining the quality of items we can get
	- nItemType: Item type (item classifications)

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetTreasureNormal(int nItemLevel, int nItemType) {
	return GetTreasureSpecific(nItemLevel, nItemType);
}

////////////////////////////////////////////////////////////////////////////////
/*	GetTreasureRare()

	Generates a template string for an item of higher quality than the player's
	current level (+5 bonus).

	- nItemLevel: Item level determining the quality of items we can get
	- nItemType: Item type (item classifications)

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetTreasureRare(int nItemLevel, int nItemType) {
	// SendMessageToPC(GetFirstPC(), "RARE!");
	return GetTreasureSpecific(nItemLevel + 5, nItemType);
}


////////////////////////////////////////////////////////////////////////////////
//	ITEM PLACEMENT
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	PlaceTreasureDisposable()

	Places disposable items in a container.

	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place
	- nItemType: Type of item (item classifications, disposables only)

	JC 2024-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasureDisposable(object oContainer, int numberOfItems, int nItemType) {
	int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
	int nItemLevel;
	int nItemQuantity;
	string sItem;
	int i;
	int j;		
	if( !GetLocalBoolean(oContainer, 57) ) {
		SetLocalBoolean(OBJECT_SELF, 57, TRUE);		
		// Item level is based on the player's current level
		nItemLevel = nPCLevel + Random(6) - 4;
		if( nItemLevel < 1 )
			nItemLevel = 1;
		// Loop for all items
		for( i = 1; i <= numberOfItems; ++i ) {
			sItem = GetTreasureBundle(nItemLevel, nItemType);
			nItemQuantity = 1; // default to 1
			// Parse the treasure blob to separate the template and quantity
			j = FindSubString(sItem, "[");
			if( j >= 0 ) {
				nItemQuantity = StringToInt(GetSubString(sItem, j + 1, 4));
				sItem = GetSubString(sItem, 0, j);
			}			
			//Place the item in the container
			CreateItemOnObject(sItem, oContainer, nItemQuantity);
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
/*	PlaceTreasure()

	Places treasure in a container.

	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place
	- nItemType: Type of item (item classifications)

	JC 2021-01-16                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasure(object oContainer, int numberOfItems, int nItemType) {
	int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
	if( nPCLevel == 1 )
		nPCLevel = 2; // Increases variety of items found at level 1
	int nRoll;
	string sItem;
	int nItemLevel;
	int nItemQuantity;
	int nAlignment;
	int i;
	int j;		
	if( !GetLocalBoolean(oContainer, 57) ) {
		SetLocalBoolean(OBJECT_SELF, 57, TRUE);
		for( i = 1; i <= numberOfItems; ++i ) {
			// Item level is based on the player's current level
			nItemLevel = nPCLevel + Random(8) - 5;
			if( nItemLevel < 1 )
				nItemLevel = 1;		
			// Random number determines chance of getting a rare or disposable
			// item
			nRoll = Random(95) + GetGlobalNumber("000_RareItemChance");
			
			// Determine item template & quantity
			nItemQuantity = 1;
			if( nRoll > 100 ) {
				// We found a rare item!
				sItem = GetTreasureRare(nItemLevel, nItemType);
				// Reset the probability for next time
				SetGlobalNumber("000_RareItemChance", 0);
			}
			else {
				// We didn't roll a rare item
				// Increase the chance of getting one next time
				IncrementGlobalNumber("000_RareItemChance", 3);
				// We rolled a normal item, or item type was specified
				if( nRoll > 85 || (nItemType > 0 && nItemType < 900) )
					sItem = GetTreasureNormal(nItemLevel, nItemType);
				// Otherwise, we rolled a disposable item
				else
					sItem = GetTreasureBundle(nItemLevel, nItemType);
			}
			// Parse the treasure blob to separate the template and quantity
			j = FindSubString(sItem, "[");
			if( j >= 0 ) {
				nItemQuantity = StringToInt(GetSubString(sItem, j + 1, 4));
				sItem = GetSubString(sItem, 0, j);
			}			
			// Place the item in the container
			CreateItemOnObject(sItem, oContainer, nItemQuantity);
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
/*	PlaceCritterTreasure()

	Places treasure on a creature.

	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place
	- nItemType: Type of item (item classifications)

	JC 2021-01-16                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceCritterTreasure(object oContainer, int numberOfItems, int nItemType) {
	object oContainer = OBJECT_SELF;
	int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
	// Increase variety of items found at level 1
	if( nPCLevel == 1 )
		nPCLevel = 2;
	int nRoll;
	string sItem;
	int nItemLevel;
	int nItemQuantity;
	int i;
	int j;
	for( i = 1; i <= numberOfItems; ++i ) {
		// Item level is based on the player's current level
		nItemLevel = nPCLevel + Random(8) - 5;
		if( nItemLevel < 1 )
			nItemLevel = 1;		
		// Random number determines chance of getting a rare or disposable item
		nRoll = Random(95) + GetGlobalNumber("000_RareItemChance");		
		// Determine item template & quantity
		nItemQuantity = 1;
		if( nRoll > 100 ) {
			// We found a rare item!
			sItem = GetTreasureRare(nItemLevel, nItemType);
			// Reset the probability for next time
			SetGlobalNumber("000_RareItemChance", 0);
		}
		else {
			// We didn't roll a rare item
			// Increase the chance of getting one next time
			IncrementGlobalNumber("000_RareItemChance", 3);
			// We rolled a normal item, or item type was specified
			if( nRoll > 85 || (nItemType > 0 && nItemType < 900) )
				sItem = GetTreasureNormal(nItemLevel, nItemType);
			// Otherwise, we rolled a disposable item
			else
				sItem = GetTreasureBundle(nItemLevel, nItemType);
		}
		// Parse the treasure blob to separate the template and quantity
		j = FindSubString(sItem, "[");
		if( j >= 0 ) {
			nItemQuantity = StringToInt(GetSubString(sItem, j + 1, 4));
			sItem = GetSubString(sItem, 0, j);
		}		
		// Place the item in the container
		CreateItemOnObject(sItem, oContainer, nItemQuantity);
	}
}

////////////////////////////////////////////////////////////////////////////////
/*	PlaceTreasureJedi()

	Places Jedi-themed treasure.

	10% chance lightsaber upgrades, any
	10% chance lightsaber upgrades, power crystals only
	10% chance robes
	10% chance equipment
	60% chance disposables
	Rare items more likely

	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasureJedi(object oContainer, int numberOfItems) {
	int nRoll;
	int nItemType;
	int i;
	for( i = 1; i <= numberOfItems; ++i ) {
		// Increase chance of rare items for Jedi loot
		IncrementGlobalNumber("000_RareItemChance", 3);		
		// Roll for item type
		nRoll = Random(10);
		switch( nRoll ) {
		case 0:
			nItemType = 240; // Lightsaber Upgrades (any)
			break;
		case 1:
			nItemType = 244; // Power Crystal
			break;
		case 2:
			nItemType = 441; // Robes
			break;
		case 3:
			nItemType = 300; // Equipment
			break;
		default:
			nItemType = 900; // Disposables
			break;
		}		
		// Place the Treasure
		PlaceCritterTreasure(oContainer, 1, nItemType);
	}
}

////////////////////////////////////////////////////////////////////////////////
/*	PlaceTreasureDroid()

	Places Droid-themed treasure.

	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place
	- nItemType: Type of item (item classifications, droid items only)

	JC 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasureDroid(object oContainer, int numberOfItems, int nItemType) {
	PlaceTreasure(oContainer, numberOfItems, 500);
}

////////////////////////////////////////////////////////////////////////////////
/*	PlaceTreasurePeragus()

	Places treasure on Peragus.

	12% chance equipment
	5% chance Peragus weapons
	1% chance ranged upgrades
	1% chance melee upgrades
	1% chance armor underlays

	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place
	- nItemType: Type of item (item classifications)

	JC 2022-05-26                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasurePeragus(object oContainer, int numberOfItems, int nItemType) {
	int nRoll;	
	// If the input item type is valid, use it
	if( nItemType / 100 == 3 || nItemType / 10 == 15 || nItemType == 232 ) {
		PlaceTreasure(oContainer, numberOfItems, nItemType);
	}
	// Otherwise, roll for item type
	else {
		nRoll = Random(100) + GetGlobalNumber("000_RareItemChance");
		// I believe it is intentional that the rare item chance is not reset
		if( nRoll >= 88 )
			PlaceTreasure(oContainer, numberOfItems, 300); // Equipment
		else if( nRoll >= 83 )
			PlaceTreasure(oContainer, numberOfItems, 150); // Peragus weapons
		else if( nRoll >= 82 )
			PlaceTreasure(oContainer, numberOfItems, 210); // Ranged upgrades
		else if( nRoll >= 81 )
			PlaceTreasure(oContainer, numberOfItems, 220); // Melee upgrades
		else if( nRoll >= 80 )
			PlaceTreasure(oContainer, numberOfItems, 232); // Underlays
		// Disposables
		else {
			IncrementGlobalNumber("000_RareItemChance", 3);
			PlaceTreasureDisposable(oContainer, numberOfItems); // Disposables
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
/*	Code copied from TSLRCM for legacy support
*/
////////////////////////////////////////////////////////////////////////////////
void PlaceHKFactoryTreasure(object oContainer, int numberOfItems, int nItemType) {
	int nRoll = Random(100);
	if( nRoll > 70 ) {
		// Shield
		PlaceTreasure(oContainer, numberOfItems, 541);
	}
	else if( nRoll > 40 ) {
		// Special Weaponry
		PlaceTreasure(oContainer, numberOfItems, 551);
	}
	else {
		PlaceTreasureDisposable(oContainer, numberOfItems, 942);
	}
}