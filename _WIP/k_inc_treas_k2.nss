
#include "k_inc_q_crystal"
#include "k_inc_treasure"


////////////////////////////////////////////////////////////////////////////////
//	CONFIGURATION
////////////////////////////////////////////////////////////////////////////////

// Sets how many saber colors to add to the base amount. This is here to add
// support for the cut bronze color, but it will work for more if they stick to
// the naming scheme.
int nExtraSaberColors = 0;


////////////////////////////////////////////////////////////////////////////////
//	CONSTANTS
////////////////////////////////////////////////////////////////////////////////

// Item classification index

// Weapons 100
int LOOT_CLASS_WEAPONS = 100;
// Weapon - Blaster Pistol 110
int LOOT_WEAPON_TYPE_BLASTER_PISTOL = 110;
int LOOT_BLASTER_PISTOL = 111;
// Weapon - Blaster Rifle 120
int LOOT_WEAPON_TYPE_BLASTER_RIFLE = 120;
int LOOT_BLASTER_RIFLE = 121;
// Weapon - Melee 130
int LOOT_WEAPON_TYPE_MELEE = 130;
int LOOT_MELEE = 131;
// Weapon - Lightsaber 140
int LOOT_WEAPON_TYPE_LIGHTSABER = 140;
int LOOT_LIGHTSABER_STANDARD = 141;
int LOOT_LIGHTSABER_SHORT = 142;
int LOOT_LIGHTSABER_DOUBLE_BLADED = 143;
// Weapon - Peragus 150
int LOOT_WEAPON_TYPE_PERAGUS = 150;
int LOOT_MINING_LASER = 151;
int LOOT_ADVANCED_MINING_LASER = 152;
int LOOT_VIBROCUTTER = 153;
int LOOT_GUIDON_BEACON = 154;

// Upgrades 200
int LOOT_CLASS_UPGRADES = 200;
// Upgrades - Ranged 210
int LOOT_UPGRADE_TYPE_RANGED = 210;
int LOOT_UPGRADE_R_TARGETING_SCOPE = 211;
int LOOT_UPGRADE_R_FIRING_CHAMBER = 212;
int LOOT_UPGRADE_R_POWER_PACK = 213;
// Upgrades - Melee 220
int LOOT_UPGRADE_TYPE_MELEE = 220;
int LOOT_UPGRADE_M_GRIP = 221;
int LOOT_UPGRADE_M_EDGE = 222;
int LOOT_UPGRADE_M_ENERGY_CELL = 223;
// Upgrades - Armor 230
int LOOT_UPGRADE_TYPE_ARMOR = 230;
int LOOT_UPGRADE_A_OVERLAY = 231;
int LOOT_UPGRADE_A_UNDERLAY = 232;
// Upgrades - Lightsaber 240
int LOOT_UPGRADE_TYPE_LIGHTSABER = 240;
int LOOT_UPGRADE_L_EMITTER = 241;
int LOOT_UPGRADE_L_LENS = 242;
int LOOT_UPGRADE_L_ENERGY_CELL = 243;
int LOOT_UPGRADE_L_POWER_CRYSTAL = 244;
int LOOT_UPGRADE_L_COLOR_CRYSTAL = 245;

// Equipment 300
int LOOT_CLASS_EQUIPMENT = 300;
// Equipment - Belt 310
int LOOT_EQUIPMENT_TYPE_BELT = 310;
int LOOT_BELT = 311;
// Equipment - Gloves 320
int LOOT_EQUIPMENT_TYPE_GLOVES = 320;
int LOOT_GLOVES = 321;
// Equipment - Headgear 330
int LOOT_EQUIPMENT_TYPE_HEADGEAR = 330;
int LOOT_HEADGEAR = 331;
// Equipment - Implant 340
int LOOT_EQUIPMENT_TYPE_IMPLANT = 340;
int LOOT_IMPLANT_LEVEL_1 = 341;
int LOOT_IMPLANT_LEVEL_2 = 342;
int LOOT_IMPLANT_LEVEL_3 = 343;
int LOOT_IMPLANT_LEVEL_4 = 344;
// Equipment - Armband 350
int LOOT_EQUIPMENT_TYPE_ARMBAND = 350;
int LOOT_ARMBAND = 351;

// Armor 400
int LOOT_CLASS_ARMOR = 400;
// Armor - Light Armor 410
int LOOT_ARMOR_TYPE_LIGHT = 410;
int LOOT_LIGHT_ARMOR = 411;
// Armor - Medium Armor 420
int LOOT_ARMOR_TYPE_MEDIUM = 420;
int LOOT_MEDIUM_ARMOR = 421;
// Armor - Heavy Armor 430
int LOOT_ARMOR_TYPE_HEAVY = 430;
int LOOT_HEAVY_ARMOR = 431;
// Armor - Robes 440
int LOOT_ARMOR_TYPE_ROBES = 440;
int LOOT_ROBES = 441;

// Droid Items 500
int LOOT_CLASS_DROID = 500;
// Droid - Interface 510
int LOOT_DROID_TYPE_INTERFACE = 510;
int LOOT_DROID_INTERFACE = 511;
// Droid - Utility 520
int LOOT_DROID_TYPE_UTILITY = 520;
int LOOT_DROID_UTILITY = 521;
// Droid - Armor 530
int LOOT_DROID_TYPE_ARMOR = 530;
int LOOT_DROID_ARMOR = 531;
// Droid - Shield 540
int LOOT_DROID_TYPE_SHIELD = 540;
int LOOT_DROID_SHIELD_ENERGY = 541;
int LOOT_DROID_SHIELD_ENVIRO = 542;
// Droid - Devices 550
int LOOT_DROID_TYPE_DEVICES = 550;
int LOOT_DROID_DEVICE = 551;

// Disposables 900
int LOOT_CLASS_DISPOSABLE = 900;
// Credits 910
int LOOT_TYPE_CREDITS = 910;
int LOOT_CREDITS = 911;
// Components 920
int LOOT_TYPE_COMPONENTS = 920;
int LOOT_COMPONENTS = 921;
int LOOT_CHEMICALS = 922;
// Shields 930
int LOOT_TYPE_SHIELD = 930;
int LOOT_SHIELD_ENERGY = 931;
int LOOT_SHIELD_ENVIRO = 932;
int LOOT_SHIELD_MELEE = 933;
// Medical Items 940
int LOOT_TYPE_MEDICAL = 940;
int LOOT_MEDPAC = 941;
int LOOT_REPAIR_KIT = 942;
// Stimulants 950
int LOOT_TYPE_STIMS = 950;
int LOOT_STIM_STR = 951;
int LOOT_STIM_DEX = 952;
int LOOT_STIM_CON = 953;
int LOOT_MEDPAC_II = 954;
int LOOT_STIM_BAT = 955;
// Extra Credits
int LOOT_TYPE_EXTRA_CREDITS = 960;
int LOOT_CREDITS_II = 961;
// Grenades 970
int LOOT_TYPE_GRENADES = 970;
int LOOT_GRENADE_ADHESIVE = 971;
int LOOT_GRENADE_CONCUSSION = 972;
int LOOT_GRENADE_CRYOBAN = 973;
int LOOT_GRENADE_THERMAL_DETONATOR = 974;
int LOOT_GRENADE_PLASMA = 975;
int LOOT_GRENADE_ION = 976;
int LOOT_GRENADE_POISON = 977;
int LOOT_GRENADE_SONIC = 978;
int LOOT_GRENADE_FRAG = 979;
// Skill Items 980
int LOOT_TYPE_SKILL_ITEMS = 980;
int LOOT_PARTS = 981;
int LOOT_COMPUTER_SPIKE = 982;
int LOOT_SECURITY_SPIKE = 983;
// Rockets 990
int LOOT_TYPE_ROCKETS = 990;
int LOOT_ROCKET = 991;


// Dice pool types

int LOOT_DICE_POOL_NONE = 0;
int LOOT_DICE_POOL_MILD = 1;
int LOOT_DICE_POOL_MODERATE = 2;
int LOOT_DICE_POOL_EXTREME = 3;


// Filters

// Upgade Type
int LOOT_UPGRADE_ANY = 0;
int LOOT_UPGRADE_NO_SABER = 1;
int LOOT_UPGRADE_NO_ARMOR = 2;
int LOOT_UPGRADE_SIMPLE_WEAPON = 3;

// Upgrade Subtype - Lightsaber
int LOOT_SABER_UPGRADE_ANY = 0;
int LOOT_SABER_UPGRADE_PARTS = 1;
int LOOT_SABER_UPGRADE_CRYSTALS = 2;
int LOOT_SABER_UPGRADE_NO_COLOR = 3;

// Saber Color
int LOOT_SABER_COLOR_ANY = -1;
int LOOT_SABER_COLOR_WEIGHTED = 0;
int LOOT_SABER_COLOR_COMMON = 1;
int LOOT_SABER_COLOR_RARE = 2;

// Disposable Subtype - Stims
int LOOT_STIM_SUBTYPE_ANY = 0;
int LOOT_STIM_SUBTYPE_DRUGS = 1;
int LOOT_STIM_SUBTYPE_STATS = 2;


// Unique item index

// Weapons & Armor - LOOT_U_ARMS
int LOOT_U_ARMOR_QEL_DROMA = 1;
int LOOT_U_ARMOR_EXAR_KUN = 2;
int LOOT_U_ARMOR_JAMOH_HOGRA = 4;
int LOOT_U_BLASTER_ONASI = 8;
int LOOT_U_BLASTER_ONASI_II = 16;
int LOOT_U_BLASTER_NADD = 32;
int LOOT_U_MELEE_FREYYR = 64;
// Equipment - LOOT_U_EQUIP
int LOOT_U_BELT_QEL_DROMA = 1;
int LOOT_U_ARMBAND_VAO = 2;
int LOOT_U_GLOVE_OSSUK = 4;
int LOOT_U_HEADGEAR_SARESH = 8;
int LOOT_U_HEADGEAR_BINDO = 16;
int LOOT_U_CRYSTAL_SOLARI = 32;
// Robes - LOOT_U_ROBES
int LOOT_U_ROBE_ARCA = 1;
int LOOT_U_ROBE_ALEEMA = 2;
int LOOT_U_ROBE_SYLVAR = 4;
int LOOT_U_ROBE_MALAK = 8;
int LOOT_U_ROBE_JOLEE = 16;
int LOOT_U_ROBE_THON = 32;
int LOOT_U_ROBE_CRADO = 64;
int LOOT_U_ROBE_NOMI = 128;


////////////////////////////////////////////////////////////////////////////////
//	DECLARATIONS
////////////////////////////////////////////////////////////////////////////////

int LOOT_GetUniqueFound(int nItemType, int nItemNum);
void LOOT_SetUniqueFound(int nItemType, int nItemNum, int nState);
string GetItemPrefix(int nItemType);


////////////////////////////////////////////////////////////////////////////////
//	UTILITY FUNCTIONS
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_DicePool()
	
	Rolls a number of dice and outputs the sum of all rolls.
	
	- nNumDice: Number of dice to roll
	- nDiceSize: How many sides each die has (d6, d8, d20, etc)
	
	JC 2019-01-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_DicePool(int nNumDice, int nDiceSize) {

int nScore = 0;
int i;
for( i = 1; i <= nNumDice; i++ ) {
	nScore = nScore + Random(nDiceSize) + 1;
	}

return nScore;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_DiceResult()
	
	Rolls to determine item variation.
	
	This uses a dice pool to generate odds that peak around the player's current
	level. First, we roll a number of dice to get a large range of possible
	values. The ultimate score we're aiming for is going to have a range only
	half the size of the original dice pool's maximum roll. If we roll outside
	this range, we disregard the result.
	
	The most probable rolls are close to the dice pool's midpoint (the average
	of the smallest and largest possible rolls). If we set our target range's
	minimum value at the midpoint, the most probable rolls will be close to our
	minimum value and output low scores. As we move the target range and reduce
	our minimum value, the midpoint will shift closer to our maximum value and
	the most probable rolls will output higher scores.
	
	(Note that the amount we can offset the midpoint is a little smaller than
	our target range, because we have to account for how our original dice pool
	can't roll anything less than the number of dice in it. So the midpoint can
	be at the target range's minimum value, but it won't quite reach the maximum
	value.)
	
	There are four different options for the dice pool, with different types and
	amounts of dice that result in different probability distributions:
	
	 * LOOT_DICE_POOL_NONE - No bell curve, no dice pool used. Instead, the item
	   level determines the die size (up to 1d30) and everything that can be
	   rolled has equal chances.
	 * LOOT_DICE_POOL_MILD - Mild bell curve, 2d30. Probabilities range from
	   approximately 1.5% to 5% at max level.
	 * LOOT_DICE_POOL_MODERATE - Moderate bell curve, 6d10. Probabilities range
	   from approximately 1% to 6.5% at max level.
	 * LOOT_DICE_POOL_EXTREME - Extreme bell curve, 10d6. Probabilities range
	   from approximately 0.5% to 7.5% at max level.
	
	This allows for different types of items to have probability distributions
	that suit them. For some types, the higher-numbered items are definitely
	better,	so we want an extreme distribution that favors items of our level.
	n other	cases, though, the lower-numbered items may not be so bad, or there
	may be an advantage to having a variety of items rather than copies of one;
	here, a less extreme distribution may be more appropriate.
	
	- nItemLevel: Item level determining the quality of the items we can get
	- nDiceType: What sort of dice to roll, determining probability distribution
				 (LOOT_DICE_POOL_*)
	
	JC 2019-01-21                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_DiceResult(int nItemLevel, int nDiceType) {

if( nItemLevel < 1 ) nItemLevel = 1;
int nRange = nItemLevel; // initial definition
// Dice mechanic definitions
int nNumDice;
int nDiceSize;
switch( nDiceType ) {
	// Mild dice pool
	case 1:
		nNumDice = 3;
		nDiceSize = 20;
		break;
	// Moderate dice pool
	case 2:
		nNumDice = 6;
		nDiceSize = 10;
		break;
	// Extreme dice pool
	case 3:
		nNumDice = 10;
		nDiceSize = 6;
		break;
	// Default option doesn't use dice pool
	default:
		nNumDice = 1;
		nDiceSize = 30;
		break;
	}
// Roll for item variation
int nRoll = 0;
int nOutput = 1; // default to 1
// Weighted odds for dice pools
if( nNumDice != 1 ) {
	// Target range is (a little more than) half the size of the dice pool
	int nDicePool = nNumDice * nDiceSize;
	int nHalfPool = nDicePool / 2;
	if( nRange > nHalfPool ) nRange = nHalfPool;
	// The midpoint is rounded up for odd dice pool sizes so we stay positive
	// after subtracting the offset.
	int nMid = ( ( nDicePool + nNumDice ) / 2 ) + ( nNumDice % 2 );
	// Item level offsets the min and max values of the target range
	int nOffset = nItemLevel;
	if( nOffset > nMid - nNumDice ) nOffset = nMid - nNumDice;
	int nMin = nMid + 1 - nOffset;
	int nMax = nMid + nHalfPool - nOffset;
	// Initial dice pool
	nRoll = LOOT_DicePool(nNumDice, nDiceSize);
	nOutput = nRoll - nMin + 1;
	// We ignore any roll outside the target range and do a roll with even odds
	// that will definitely fall inside our target range if necessary
	if( nRoll < nMin || nRoll > nMax || nOutput > nRange ) {
		nOutput = Random(nRange) + 1;
		}
	}
// No dice pool, even odds
else {
	if( nRange > nDiceSize ) nRange = nDiceSize;
	nOutput = Random(nRange) + 1;
	}

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_Suffix()
	
	Converts an item number to a string to get the final item variation suffix.
	
	JC 2019-02-11                                                             */
////////////////////////////////////////////////////////////////////////////////
string LOOT_Suffix(int nItemNum) {

if( nItemNum < 0 ) nItemNum = 1;
if( nItemNum > 99 ) nItemNum = 1;
string sSuffix = IntToString(nItemNum);
if( nItemNum < 10 ) sSuffix = "0" + sSuffix;
if( nItemNum == 0 ) sSuffix = "";

return sSuffix;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_IsLateGame()
	
	Checks whether it's late in the game (after boarding the Ravager).
	
	JC 2019-02-12                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_IsLateGame() {

string sModule = GetModuleName();
if( sModule == "851NIH" ||
	sModule == "852NIH" ||
	sModule == "901MAL" ||
	sModule == "902MAL" ||
	sModule == "903MAL" ||
	sModule == "904MAL" ||
	sModule == "905MAL" ||
	sModule == "906MAL" ) {
	return TRUE;
	}
return FALSE;

}



////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetAreaAlignment()
	
	Returns the alignment of the area we're in.
	(0 == EVIL, 50 == NEUTRAL, 100 = GOOD)
	
	JC 2019-02-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetAreaAlignment() {

string sModule = GetModuleName();
// Light areas
if( sModule == "204TEL" ||
	sModule == "262TEL" ||
	sModule == "601DAN" ||
	sModule == "602DAN" ||
	sModule == "604DAN" ||
	sModule == "605DAN" ||
	sModule == "610DAN" ||
	sModule == "650DAN" ) {
	return 100;
	}
// Dark areas
else if( sModule == "410DXN" ||
	sModule == "411DXN" ||
	sModule == "701KOR" ||
	sModule == "702KOR" ||
	sModule == "710KOR" ||
	sModule == "711KOR" ||
	sModule == "851NIH" ||
	sModule == "852NIH" ||
	sModule == "901MAL" ||
	sModule == "902MAL" ||
	sModule == "903MAL" ||
	sModule == "904MAL" ||
	sModule == "905MAL" ||
	sModule == "906MAL" ) {
	return 0;
	}
// Neutral for everything else
else {
	return 50;
	}

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_UniqueItemID()
	
	Returns an ID for a unique item so its corresponding global can be set or
	checked.
	
	- int nItemType: Item type (LOOT_* item classifications)
	- int nItemNum: Item variation number
	
	JC 2019-01-17                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_UniqueItemID(int nItemType, int nItemNum) {

int nItemID = 0;
switch( nItemType ) {
	// Light Armor
	case 411:
		nItemID = LOOT_U_ARMOR_QEL_DROMA;
		break;
	// Medium Armor
	case 421:
		switch( nItemNum ) {
			case 11:
				nItemID = LOOT_U_ARMOR_EXAR_KUN;
				break;
			case 15:
				nItemID = LOOT_U_ARMOR_JAMOH_HOGRA;
				break;
			}
		break;
	// Blaster Pistol
	case 111:
		switch( nItemNum ) {
			case 22:
				nItemID = LOOT_U_BLASTER_ONASI;
				break;
			case -1:
				// Second Onasi blaster requires spooky non-existent item number
				nItemID = LOOT_U_BLASTER_ONASI_II;
				break;
			case 30:
				nItemID = LOOT_U_BLASTER_NADD;
				break;
			}
		break;
	// Melee
	case 131:
		nItemID = LOOT_U_MELEE_FREYYR;
		break;
	// Armband
	case 351:
		// The Vao Armband doesn't have a proper item number, but since it's the
		// only armband in random loot, this should be ok
		nItemID = LOOT_U_ARMBAND_VAO;
		break;
	// Belt
	case 311:
		nItemID = LOOT_U_BELT_QEL_DROMA;
		break;
	// Gloves
	case 321:
		nItemID = LOOT_U_GLOVE_OSSUK;
		break;
	// Headgear
	case 331:
		switch( nItemNum ) {
			case 25:
				nItemID = LOOT_U_HEADGEAR_SARESH;
				break;
			case 26:
				nItemID = LOOT_U_HEADGEAR_BINDO;
				break;
			}
		break;
	// Upgrade - Lightsaber - Power Crystal
	case 244:
		nItemID = LOOT_U_CRYSTAL_SOLARI;
		break;
	// Robes
	case 441:
		switch( nItemNum ) {
			case 23:
				nItemID = LOOT_U_ROBE_ARCA;
				break;
			case 24:
				nItemID = LOOT_U_ROBE_ALEEMA;
				break;
			case 25:
				nItemID = LOOT_U_ROBE_SYLVAR;
				break;
			case 26:
				nItemID = LOOT_U_ROBE_MALAK;
				break;
			case 27:
				nItemID = LOOT_U_ROBE_JOLEE;
				break;
			case 28:
				nItemID = LOOT_U_ROBE_THON;
				break;
			case 29:
				nItemID = LOOT_U_ROBE_CRADO;
				break;
			case 30:
				nItemID = LOOT_U_ROBE_NOMI;
				break;
			}
		break;
	}

return nItemID;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_UniqueItemTag()

	Returns the tag of a unique item.
	
	- int nItemType: Item type (LOOT_* item classifications)
	- int nItemNum: Item variation number
	
	JC 2019-02-24                                                             */
////////////////////////////////////////////////////////////////////////////////
string LOOT_UniqueItemTag(int nItemType, int nItemNum) {

string sTag;
// Exception for Vao Armband
if( nItemType == LOOT_ARMBAND ) {
	sTag = "a_band_x02";
	}
// Exception for 2nd Onasi Blaster
else if( nItemType == LOOT_BLASTER_PISTOL && nItemNum == -1 ) {
	sTag = "w_blaste_22";
	}
// Otherwise, prefix + suffix
else {
	sTag = GetItemPrefix(nItemType) + LOOT_Suffix(nItemNum);
	}

return sTag;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_UniqueGlobal()

	Returns a string for the global that keeps track of the specified unique
	item type.
	
	Three globals are needed to keep track of them all:
	* LOOT_U_EQUIP - armbands, belts, headgear, and crystals
	* LOOT_U_ARMS - weapons and armor (except for robes)
	* LOOT_U_ROBES - robes
	
	- nItemType: Item type (LOOT_* item classifications)
	- nItemID: Unique item ID (LOOT_U_*)
	
	JC 2019-01-17                                                             */
////////////////////////////////////////////////////////////////////////////////
string LOOT_UniqueGlobal(int nItemType, int nItemID) {

string sGlobal = "";
if( nItemType == LOOT_ROBES ) {
	sGlobal = "LOOT_U_ROBES";
	}
else if( nItemType == LOOT_LIGHT_ARMOR ||
	nItemType == LOOT_MEDIUM_ARMOR ||
	nItemType == LOOT_BLASTER_PISTOL ||
	nItemType == LOOT_MELEE ) {
	sGlobal = "LOOT_U_ARMS";
	}
else if( nItemType == LOOT_ARMBAND ||
	nItemType == LOOT_BELT ||
	nItemType == LOOT_GLOVES ||
	nItemType == LOOT_HEADGEAR ||
	nItemType == LOOT_UPGRADE_L_POWER_CRYSTAL ) {
	sGlobal = "LOOT_U_EQUIP";
	}

return sGlobal;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_CountItemsEquipped()

	Checks if an item is in any of the specified creature's equipment slots and
	returns how many are found.
	
	- oCreature: Creature to check
	- sItem: Tag of the item to look for
	
	JC 2019-02-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_CountItemsEquipped(object oCreature, string sItem) {

int i;
int j = 0;
object oItem;
string sTag;
for( i = 0; i <= 19; i++ ) {
	oItem = GetItemInSlot(i, oCreature);
	if( GetIsObjectValid(oItem) ) sTag = GetTag(oItem);
	else sTag = "";
	if( sTag == sItem ) j++;
	}

return j;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_HasEnoughItems()

	Counts how many of a given item are possessed by the party. Checks the
	individual party members' equipment slots as well as their shared inventory.
	
	- oCreature: Creature to check
	- sItem: Tag of the item to look for
	
	JC 2019-02-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_HasEnoughItems(string sItem, int nAmount) {

object oPC = GetFirstPC();
object oPM1 = OBJECT_INVALID;
object oPM2 = OBJECT_INVALID;

int i = 1;
int j = FALSE;
while( j == FALSE ) {
	object oNearest = GetNearestObject(OBJECT_TYPE_CREATURE, oPC, i);
	if( GetIsObjectValid(oNearest) ){
		if( IsObjectPartyMember(oNearest) ) {
			if( oPM1 == OBJECT_INVALID ) {
				oPM1 = oNearest;
				}
			else {
				oPM2 = oNearest;
				j = TRUE;
				}
			}
		i++;
		}
	else j = TRUE;
	}
int nCount = LOOT_CountItemsEquipped(GetFirstPC(), sItem);
object oItem;
int k = 0;
while( nCount < nAmount && k <= 3 ) {
	switch( k ) {
		case 0:
			if( GetIsObjectValid(oPM1) ) nCount = nCount + LOOT_CountItemsEquipped(oPM1, sItem);
			break;
		case 1:
			if( GetIsObjectValid(oPM2) ) nCount = nCount + LOOT_CountItemsEquipped(oPM2, sItem);
			break;
		case 2:
			oItem = GetItemPossessedBy(GetFirstPC(), sItem);
			if( GetIsObjectValid(oItem) ) nCount = nCount + GetItemStackSize(oItem);
			break;
		case 3:
			oItem = GetItemPossessedBy(OBJECT_SELF, sItem);
			if( GetIsObjectValid(oItem) ) nCount = nCount + GetItemStackSize(oItem);
			break;
		}
	k++;
	}
if( nCount >= nAmount ) return TRUE;
return FALSE;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetUniqueFound()

	Checks if a unique item has already been found.
	
	- nItemType: Item type (LOOT_* item classifications)
	- nItemID: Unique item ID (LOOT_U_*)
	
	JC 2019-02-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetUniqueFound(int nItemType, int nItemNum) {

int nItemID = LOOT_UniqueItemID(nItemType, nItemNum);
int nGlobal = GetGlobalNumber(LOOT_UniqueGlobal(nItemType, nItemID));
// 128 is stored as -128 for reasons, so the global has to be converted first if
// it has a negative value
if( nGlobal < 0 ) nGlobal = nGlobal + 256;
// Mod operation will tell us if our item ID is in there
int nRemainder = nGlobal % ( nItemID * 2 );
// Check if item has been found
int nOutput;
// First, check the global
if( nRemainder >= nItemID ) {
	nOutput = TRUE;
	}
// If the global hasn't been set, check the party equipment & inventory to see
// if the item is in there anyway
else {
	int nAmount = 1;
	if( nItemType == LOOT_BLASTER_PISTOL &&
		nItemID == LOOT_U_BLASTER_ONASI_II ) {
		nAmount = 2; // allow 2 Onasi Blasters
		}
	string sItem = LOOT_UniqueItemTag(nItemType, nItemNum);
	if( LOOT_HasEnoughItems(sItem, nAmount) ) {
		LOOT_SetUniqueFound(nItemType, nItemNum, TRUE);
		nOutput = TRUE;
		}
	else {
		nOutput = FALSE;
		}
	}

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_SetUniqueFound()

	Sets whether a unique item has been found.
	
	- nItemType: Item type (LOOT_* item classifications)
	- nItemID: Unique item ID (LOOT_U_*)
	- nState: Set whether it's been found or not (TRUE or FALSE);
	
	JC 2019-01-17                                                             */
////////////////////////////////////////////////////////////////////////////////
void LOOT_SetUniqueFound(int nItemType, int nItemNum, int nState) {

string sGlobal = LOOT_UniqueGlobal(nItemType, nItemNum);
int nGlobal = GetGlobalNumber(sGlobal);
int nItemID = LOOT_UniqueItemID(nItemType, nItemNum);
// 2 Onasi Blasters are permitted, so we have to switch IDs for the second
if( ( nItemType == LOOT_BLASTER_PISTOL &&
	nItemID == LOOT_U_BLASTER_ONASI ) &&
	LOOT_GetUniqueFound(LOOT_BLASTER_PISTOL, 22) == TRUE ) {
	nItemID = nItemID * 2;
	}
int nValue;
if( nState == TRUE ) nValue = nGlobal + nItemID;
else nValue = nGlobal - nItemID;

SetGlobalNumber(sGlobal, nValue);

}


////////////////////////////////////////////////////////////////////////////////
//	WEAPONS
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetPistolNum()
	
	Generates item variation number for blaster pistols.
	
	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetPistolNum(int nItemLevel) {

int nRoll = LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_EXTREME);
// Replacement table for if a better version of what we rolled is available
if( nRoll == 1 && nItemLevel >= 9 ) nRoll = 9; // Blaster Pistol --> Republic Blaster
if( nRoll == 2 && nItemLevel >= 10 ) nRoll = 10; // Ion Blaster --> Aratech Droid Oxidizer
if( nRoll == 3 && nItemLevel >= 7 ) nRoll = 7; // Field Survival Pistol --> Scout Enforcer
if( nRoll == 4 && nItemLevel >= 8 ) nRoll = 8; // Sonic Pistol --> Systech Aural Blaster
if( nRoll == 5 && nItemLevel >= 15 ) nRoll = 15; // Disruptor Pistol --> Sith Disruptor
if( nRoll == 6 && nItemLevel >= 11 ) nRoll = 11; // Heavy Blaster Pistol --> Arkanian Heavy Pistol
if( nRoll == 7 && nItemLevel >= 18 ) nRoll = 18; // Scout Enforcer --> Watchman Blaster
if( nRoll == 8 && nItemLevel >= 14 ) nRoll = 14; // Systech Aural Blaster --> Arkanian Sonic Blaster
if( nRoll == 9 && nItemLevel >= 12 ) nRoll = 12; // Republic Blaster --> Mandalorian Blaster
if( nRoll == 10 && nItemLevel >= 21 ) nRoll = 21; // Aratech Droid Oxidizer --> Aratech Ionmaster
if( nRoll == 11 && nItemLevel >= 16 ) nRoll = 16; // Arkanian Heavy Pistol --> Mandalorian Heavy Blaster
if( nRoll == 12 && nItemLevel >= 22 ) nRoll = 22; // Mandalorian Blaster --> Onasi Blaster
if( nRoll == 13 && nItemLevel >= 25 ) nRoll = 25; // Systech Static Blaster --> Systech Electric Blaster
if( nRoll == 15 && nItemLevel >= 20 ) nRoll = 20; // Sith Disruptor --> Mandalorian Ripper
if( nRoll == 16 && nItemLevel >= 24 ) nRoll = 24; // Mandalorian Heavy Blaster --> Zabrak Heavy Blaster
if( nRoll == 18 && nItemLevel >= 27 ) nRoll = 27; // Watchman Blaster --> Elite Watchman Blaster
if( nRoll == 20 && nItemLevel >= 28 ) nRoll = 28; // Mandalorian Ripper --> Mandalorian Disintegrator
if( nRoll == 22 && nItemLevel >= 26 ) nRoll = 26; // Onasi Blaster --> Micro-Pulse Blaster
// Replace Onasi Blaster if two have been found before (if it wasn't already
// replaced due to item level)
if( nRoll == 22 && LOOT_GetUniqueFound(LOOT_BLASTER_PISTOL, -1) == TRUE ) {
	nRoll == 26;
	}
// Replace Freedon Nadd's Blaster if it was found before
if( nRoll == 30 && LOOT_GetUniqueFound(LOOT_BLASTER_PISTOL, nRoll) == TRUE ) {
	nRoll == Random(6) + 24;
	}
// Set globals for unique items if we rolled any
if( nRoll == 22 || nRoll == 30 ) {
	LOOT_SetUniqueFound(LOOT_BLASTER_PISTOL, nRoll, TRUE);
	}

return nRoll;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetRifleNum()
	
	Generates item variation number for blaster pistols.
	
	Replaces certain items when better versions are available.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetRifleNum(int nItemLevel) {

int nRoll = LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_EXTREME);
// Replacement table for if a better version of what we rolled is available
if( nRoll == 1 && nItemLevel >= 6 ) nRoll = 6; // Blaster Carbine --> Repeating Blaster Carbine
if( nRoll == 2 && nItemLevel >= 7 ) nRoll = 7; // Ion Carbine --> Ion Rifle
if( nRoll == 3 && nItemLevel >= 9 ) nRoll = 9; // Sonic Carbine --> Sonic Rifle
if( nRoll == 4 && nItemLevel >= 12 ) nRoll = 12; // Blaster Rifle --> Arkanian Blaster Rifle
if( nRoll == 5 && nItemLevel >= 11 ) nRoll = 11; // Bowcaster --> War Bowcaster
if( nRoll == 6 && nItemLevel >= 17 ) nRoll = 17; // Repeating Blaster Carbine --> Heavy Repeating Blaster Carbine
if( nRoll == 7 && nItemLevel >= 15 ) nRoll = 15; // Ion Rifle --> Bothan Droid Disruptor
if( nRoll == 8 && nItemLevel >= 13 ) nRoll = 13; // Disruptor Carbine --> Disruptor Rifle
if( nRoll == 9 && nItemLevel >= 27 ) nRoll = 27; // Sonic Rifle --> Sonic Disruptor
if( nRoll == 10 && nItemLevel >= 22 ) nRoll = 22; // Repeating Blaster Rifle --> Heavy Repeating Rifle
if( nRoll == 14 && nItemLevel >= 25 ) nRoll = 25; // Argazdan Riot Buster --> Slavemaster Stun Carbine
if( nRoll == 15 && nItemLevel >= 20 ) nRoll = 20; // Bothan Droid Disruptor --> Verpine Droid Disruptor
if( nRoll == 20 && nItemLevel >= 29 ) nRoll = 29; // Verpine Droid Disruptor --> Verpine Droid Disintegrator
if( nRoll == 22 && nItemLevel >= 26 ) nRoll = 26; // Heavy Repeating Rifle --> Mandalorian Heavy Repeater

return nRoll;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetMeleeNum()
	
	Generates item variation number for melee weapons.
	
	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetMeleeNum(int nItemLevel) {

int nRoll = LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_EXTREME);
// Replacement table for if a better version of what we rolled is available
if( nRoll == 1 && nItemLevel >= 5 ) nRoll = 5; // Short Sword --> Vibroblade
if( nRoll == 2 && nItemLevel >= 6 ) nRoll = 6; // Long Sword --> Vibrosword
if( nRoll == 3 && nItemLevel >= 8 ) nRoll = 8; // Energy Baton --> Exchange Negotiator
if( nRoll == 4 && nItemLevel >= 14 ) nRoll = 14; // Quarterstaff --> Force Pike
if( nRoll == 5 && nItemLevel >= 10 ) nRoll = 10; // Vibroblade --> Zabrak Vibroblade
if( nRoll == 6 && nItemLevel >= 21 ) nRoll = 21; // Vibrosword --> Echani Vibrosword
if( nRoll == 7 && nItemLevel >= 15 ) nRoll = 15; // Double-Bladed Sword --> Vibro Double-Blade
if( nRoll == 8 && nItemLevel >= 18 ) nRoll = 18; // Exchange Negotiator --> Gand Silencer
if( nRoll == 11 && nItemLevel >= 17 ) nRoll = 17; // Rodian Blade --> Rodian Death Blade
if( nRoll == 12 && nItemLevel >= 22 ) nRoll = 22; // Sith War Sword --> Sith Tremor Sword
if( nRoll == 14 && nItemLevel >= 23 ) nRoll = 23; // Force Pike --> Gand Shockstaff
if( nRoll == 18 && nItemLevel >= 29 ) nRoll = 29; // Gand Silencer --> Gand Discharger
// Replace Freyyr's Warblade if it was found before
if( nRoll == 30 && LOOT_GetUniqueFound(LOOT_MELEE, nRoll) == TRUE ) {
	nRoll = Random(10) + 20;
	}
// Set globals for unique items if we rolled any
if( nRoll == 30 ) {
	LOOT_SetUniqueFound(LOOT_MELEE, nRoll, TRUE);
	}

return nRoll;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetSaberSubtype()
	
	Determines lightsaber subtype (STANDARD, SHORT, or DOUBLE-BLADED).
	
	Standard lightsabers are more common than short and double-bladed, with a
	3:1:1 ratio.
	
	JC 2019-02-11                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetSaberSubtype() {

int nRoll = Random(5) + 1;
int nOutput;
if( nRoll == 5 ) nOutput = LOOT_LIGHTSABER_DOUBLE_BLADED;
else if( nRoll == 4 ) nOutput = LOOT_LIGHTSABER_SHORT;
else nOutput = LOOT_LIGHTSABER_STANDARD;

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetSaberColor()
	
	Determines the color for a lightsaber with different rolls depending on
	which option is input.
	
	The colors are grouped into two categories:
	* COMMON (blue, red, green, yellow, violet)
	* RARE (cyan, silver, orange, viridian, and any additional colors added with
	       nExtraSaberColors)
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
	* 7 = BRONZE (extra color #1)
	* 8 = ORANGE
	* 9 = SILVER
	* 10 = CYAN
	* 11 = VIRIDIAN
	
	And if more extra colors are added, this will return 12+ without any more
	weird rules. 12 = extra color #2, etc.
	
	- nItemLevel: Item level determining the quality of the items we can get
	- nColorType: Which color algorithm to use (LOOT_L_COLOR_*)
	
	JC 2019-01-25                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetSaberColor(int nItemLevel, int nColorType = 0) {

if( nItemLevel > 20 ) nItemLevel = 20; // caps the die at d100
int nColor;
// If we're using weighted odds, determine common or rare
if( nColorType == LOOT_SABER_COLOR_WEIGHTED ) {
	// Roll to get common or rare
	int nRoll = Random(nItemLevel * 5);
	if( nRoll < 75 ) nColorType = LOOT_SABER_COLOR_COMMON;
	else nColorType = LOOT_SABER_COLOR_RARE;
	}
// Role for common colors
if( nColorType == LOOT_SABER_COLOR_COMMON ) {
	nColor = ( Random(9) + 1 ) / 2;
	}
// Roll for rare colors
else if( nColorType == LOOT_SABER_COLOR_RARE ) {
	nColor = Random(4 + nExtraSaberColors) + 6;
	}
// Roll for even odds
else {
	nColor = Random(9 + nExtraSaberColors) + 1;
	}
// Get the real number
// No #6 (Malak's saber). No #7 (bronze) if no extra saber colors are used.
int nOutput;
if( nColor >= 6 && nExtraSaberColors < 1 ) nOutput = nColor + 2;
else if( nColor >= 6 && nExtraSaberColors >= 1 ) nOutput = nColor + 1;
else nOutput = nColor;

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_HasUpgradeSaber()
	
	Returns true if the player has completed the "Crafting a Lightsaber" quest
	with Bao-Dur, or if they have a lightsaber in their inventory.
	
	Visas Marr's Lightsaber and Freedon Nadd's Short Lightsaber are excluded
	from the check,	as they cannot be upgraded.
	
	JC 2019-02-14                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_HasUpgradeSaber() {

int nOutput = FALSE;
if( GetJournalEntry("LightsaberQuest") >= 50 ) nOutput = TRUE;
object oItem = GetFirstItemInInventory(GetFirstPC());
while( nOutput == FALSE && oItem != OBJECT_INVALID ) {
	if( ( GetBaseItemType(oItem) == BASE_ITEM_LIGHTSABER ||
		  GetBaseItemType(oItem) == BASE_ITEM_SHORT_LIGHTSABER ||
		  GetBaseItemType(oItem) == BASE_ITEM_LIGHTSABER ) &&
		GetTag(oItem) != "w_ls_x01" &&
		GetTag(oItem) != "w_sls_x02" ) {
		nOutput = TRUE;
		}
	else oItem = GetNextItemInInventory(GetFirstPC());
	}

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetPeragusWeapon()
	
	Determines weapon type for loot on Peragus.
	
	Regular weapons are excluded from Peragus lot and only location-specific
	weapons will drop:
	* Mining Laser
	* Advanced Mining Laser
	* Vibrocutter
	* Guidon Beacon
	
	JC 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetPeragusWeapon() {

int nOutput;
int nRoll = Random(6) + 1;
if( nRoll == 1 || nRoll == 2 ) nOutput = LOOT_MINING_LASER;
else if( nRoll == 3 || nRoll == 4 ) nOutput = LOOT_ADVANCED_MINING_LASER;
else if( nRoll == 5 ) nOutput = LOOT_VIBROCUTTER;
else nOutput = LOOT_GUIDON_BEACON;

return nOutput;

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
	  * LOOT_UPGRADE_ANY: Any upgade type
	  * LOOT_UPGRADE_NO_SABER: Armor, ranged, or melee, but no lightsaber
	  * LOOT_UPGRADE_NO_ARMOR: Ranged, melee, or lightsaber, but no armor
	  * LOOT_UPGRADE_SIMPLE_WEAPON: Ranged or melee, no armor or lightsaber
	
	JC 2019-02-14                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetUpgradeType(int nFilter = 0) {

int nRoll;
// No lightsaber upgrades if that's specified
if( nFilter == LOOT_UPGRADE_NO_SABER ) {
	nRoll = Random(5) + 1;
	}
// No armor option
else if( nFilter == LOOT_UPGRADE_NO_ARMOR ) {
	nRoll = Random(4) + 3;
	}
// Ranged & melee only option
else if( nFilter == LOOT_UPGRADE_SIMPLE_WEAPON ) {
	nRoll = Random(3) + 3;
	}
// All upgrades
else {
	nRoll = Random(6) + 1;
	}
// Check the roll to determine type
int nOutput;
if( nRoll == 1 || nRoll == 2 ) nOutput = LOOT_UPGRADE_TYPE_ARMOR;
else if( nRoll == 3 || nRoll == 4 ) nOutput = LOOT_UPGRADE_TYPE_RANGED;
else if( nRoll == 5 ) nOutput = LOOT_UPGRADE_TYPE_MELEE;
else nOutput = LOOT_UPGRADE_TYPE_LIGHTSABER;

return nOutput;

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
	
	- nItemType: Item type (LOOT_UPGRADE_TYPE_*)
	- nFilter: Used to exclude certain results if desired
	  LIGHTSABER
	  * LOOT_SABER_UPGRADE_ANY: Any lightsaber upgrade
	  * LOOT_SABER_UPGRADE_PARTS: Emitter, energy cell, or lens only
	  * LOOT_SABER_UPGRADE_CRYSTALS: Color crystal or power crystal only
	  * LOOT_SABER_UPGRADE_NO_COLOR: No color crystal, but anything else
	
	JC 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetUpgradeSubtype(int nItemType, int nFilter = 0) {

// If upgrade type isn't known, randomly generate it
if( nItemType != LOOT_UPGRADE_TYPE_RANGED &&
	nItemType != LOOT_UPGRADE_TYPE_MELEE &&
	nItemType != LOOT_UPGRADE_TYPE_ARMOR &&
	nItemType != LOOT_UPGRADE_TYPE_LIGHTSABER ) {
	nItemType = LOOT_GetUpgradeType();
	}
// Different upgrades have different rules
int nRoll;
int nOutput;
switch( nItemType) {
	// Ranged
	case 210:
		nRoll = Random(12) + 1;
		if( nRoll <= 5 ) nOutput = LOOT_UPGRADE_R_TARGETING_SCOPE;
		else if( nRoll <= 9 ) nOutput = LOOT_UPGRADE_R_FIRING_CHAMBER;
		else nOutput = LOOT_UPGRADE_R_POWER_PACK;
		break;
	// Melee
	case 220:
		nRoll = Random(8) + 1;
		if( nRoll <= 3 ) nOutput = LOOT_UPGRADE_M_EDGE;
		else if( nRoll <= 6 ) nOutput = LOOT_UPGRADE_M_GRIP;
		else nOutput = LOOT_UPGRADE_M_ENERGY_CELL;
		break;
	// Armor
	case 230:
		nRoll = Random(5) + 1;
		if( nRoll <= 3 ) nOutput = LOOT_UPGRADE_A_UNDERLAY;
		else nOutput = LOOT_UPGRADE_A_OVERLAY;
		break;
	// Lightsaber
	case 240:
		// Parts only option
		if( nFilter == LOOT_SABER_UPGRADE_PARTS ) {
			nRoll = Random(15) + 1;
			}
		// Crystals only option
		else if( nFilter == LOOT_SABER_UPGRADE_CRYSTALS ) {
			nRoll = Random(5) + 16;
			}
		// No color crystal option
		else if( nFilter == LOOT_SABER_UPGRADE_NO_COLOR ) {
			nRoll = 18;
			}
		// All saber upgrades
		else {
			nRoll = Random(20) + 1;
			}
		// Check the roll to determine subtype
		if( nRoll <= 5 ) nOutput = LOOT_UPGRADE_L_EMITTER;
		else if( nRoll <= 10 ) nOutput = LOOT_UPGRADE_L_ENERGY_CELL;
		else if( nRoll <= 15 ) nOutput = LOOT_UPGRADE_L_LENS;
		else if( nRoll <= 18 ) nOutput = LOOT_UPGRADE_L_POWER_CRYSTAL;
		else nOutput = LOOT_UPGRADE_L_COLOR_CRYSTAL;
		break;
	}

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_ColorCrystalNum()
	
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
	
	JC 2019-01-25                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_ColorCrystalNum(int nInput) {

int nOutput;
switch( nInput ) {
	// Red
	case 2:
		nOutput = 4;
		break;
	// Green
	case 3:
		nOutput = 2;
		break;
	// Yellow
	case 4:
		nOutput = 3;
		break;
	// Bronze
	case 7:
		nOutput = 10;
		break;
	// Silver
	case 9:
		nOutput = 7;
		break;
	// Cyan
	case 10:
		nOutput = 6;
		break;
	// Viridian
	case 11:
		nOutput = 9;
		break;
	// No weird rules for anything else
	default:
		nOutput = nInput;
	}

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetPowerCrystalNum()
	
	Generates item variation number for lightsaber power crystals.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-27                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetPowerCrystalNum(int nItemLevel) {

// Power crystals have 25 variations
if( nItemLevel > 25 ) nItemLevel = 25;
int nRoll = LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_MILD);
// Replace the Solari Crystal if it's been found before
if( nRoll == 21 && LOOT_GetUniqueFound(LOOT_UPGRADE_L_POWER_CRYSTAL, nRoll) == TRUE ) {
	nRoll = LOOT_DiceResult(nItemLevel - 1, LOOT_DICE_POOL_MILD);
	if( nRoll >= 21 ) nRoll = nRoll + 1;
	}
// Set globals for unique items if we found any
if( nRoll == 21 ) {
	LOOT_SetUniqueFound(LOOT_UPGRADE_L_POWER_CRYSTAL, nRoll, TRUE);
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
	- nItemType: Item type (LOOT_UPGRADE_* full item type)
	- nItemTier: Optional number to specify an item tier
	
	JC 2019-01-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetUpgradeNum(int nItemLevel, int nItemType, int nItemTier = 0) {

// Different upgrade types have their items grouped in different amounts
int nNumTiers;
int nItemsPerTier;
switch( nItemType ) {
	// Ranged - Targeting Scope
	case 211:
		nNumTiers = 4;
		nItemsPerTier = 4;
		break;
	// Ranged - Firing Chamber
	case 212:
		nNumTiers = 3;
		nItemsPerTier = 5;
		break;
	// Ranged - Power Pack
	case 213:
		nNumTiers = 5;
		nItemsPerTier = 3;
		break;
	// Melee - Grip
	case 221:
		nNumTiers = 3;
		nItemsPerTier = 5;
		break;
	// Melee - Edge
	case 222:
		nNumTiers = 4;
		nItemsPerTier = 4;
		break;
	// Melee - Energy Cell
	case 223:
		nNumTiers = 4;
		nItemsPerTier = 4;
		break;
	// Armor - Overlay
	case 231:
		nNumTiers = 4;
		nItemsPerTier = 8;
		break;
	// Armor - Underlay
	case 232:
		nNumTiers = 5;
		nItemsPerTier = 6;
		break;
	// Lightsaber - Emitter
	case 241:
		nNumTiers = 4;
		nItemsPerTier = 4;
		break;
	// Lightsaber - Lens
	case 242 :
		nNumTiers = 3;
		nItemsPerTier = 5;
		break;
	// Lightsaber - Energy Cell
	case 243:
		nNumTiers = 4;
		nItemsPerTier = 4;
		break;
	}
// Determine tier based on player level if it isn't known
if( nItemTier < 1 || nItemTier > nNumTiers ) {
	// Item level scales to match the total number of items
	int nNumItems = nNumTiers * nItemsPerTier;
	int nItemScale;
	if( nNumItems == 30 ) {
		nItemScale = nItemLevel;
		}
	else if( 30 % nNumItems == 0 ) {
		nItemScale = ( nItemLevel + ( 30 / nNumItems ) - 1 ) / ( 30 / nNumItems );
		}
	else if( nNumItems < 30 ) {
		nItemScale = ( ( nItemLevel * nNumItems ) + 30 - nNumItems ) / 30;
		}
	else {
		nItemScale = ( nItemLevel * nNumItems ) / 30;
		}
	nItemTier = ( nItemScale + nItemsPerTier - 1 ) / nItemsPerTier;
	}
// Roll to get a 2-digit item ID
// (tens digit for the tier, ones digit for the variation)
int nItemID = ( nItemTier * 10 ) + Random(nItemsPerTier) + 1;
// Exceptions to pad out tiers with fewer items
switch( nItemType ) {
	// Ranged - Targeting Scope
	case 211:
		if( nItemID == 44 ) nItemID = 34;
		break;
	// Melee - Edge
	case 221:
		if( nItemID == 44 ) nItemID = 32 ;
		break;
	// Melee - Energy Cell
	case 223:
		if( nItemID == 44 ) nItemID = 34;
		break;
	// Armor - Overlay
	case 231:
		if( nItemID == 47 ) nItemID = 36;
		if( nItemID == 48 ) nItemID = 38;
		break;
	// Lightsaber - Emitter
	case 241:
		if( nItemID == 42 ) nItemID = 31;
		if( nItemID == 43 ) nItemID = 32;
		if( nItemID == 44 ) nItemID = 34;
		break;
	// Lightsaber - Lens
	case 242:
		if( nItemID == 34 ) nItemID = 24;
		if( nItemID == 35 ) nItemID = 25;
		break;
	// Lightsaber - Energy Cell
	case 243:
		if( nItemID == 42 ) nItemID = 31;
		if( nItemID == 43 ) nItemID = 33;
		if( nItemID == 44 ) nItemID = 34;
		break;
	}
// Convert item ID to a real item variation
int nOutput = ( ( ( nItemID / 10 ) - 1 ) * nItemsPerTier ) + ( nItemID % 10 );

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
//	EQUIPMENT
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetBeltNum()
	
	Generates item variation number for belts.
	
	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetBeltNum(int nItemLevel) {

int nRoll = LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_EXTREME);
// Replacement table for if a better version of what we rolled is available
if( nRoll == 1 && nItemLevel >= 5 ) nRoll = 5; // Adrenaline Amplifier --> Avanced Adrenaline Amplifier
if( nRoll == 2 && nItemLevel >= 8 ) nRoll = 8; // Cardio-Regulator --> Systech Cardio-Regulator
if( nRoll == 3 && nItemLevel >= 6 && nItemLevel < 10 ) nRoll = 6; // Stealth Field Generator --> Aratech SD Belt
if( nRoll == 3 && nItemLevel >= 10 ) {
	if( Random(2) == 0 ) nRoll = 6; // Stealth Field Generator --> Aratech SD Belt OR
	else nRoll = 10; // Stealth Field Generator --> Exchange Shadow Caster
	}
if( nRoll == 4 && nItemLevel >= 24 ) nRoll = 24; // Czerka Utility Belt --> Tech Specialist Belt
if( nRoll == 5 && nItemLevel >= 9 ) nRoll = 9; // Advanced Adrenaline Amplifier --> Hyper Adrenaline Amplifier
if( nRoll == 7 && nItemLevel >= 15 && nItemLevel < 26 ) nRoll = 15; // Strength Enhancer --> CNS Strength Enhancer
if( nRoll == 7 && nItemLevel >= 26 ) {
	if( Random(2) == 0 ) nRoll = 15; // Strength Enhancer --> CNS Strength Enhancer OR
	else nRoll = 26; // Strength Enhancer --> GNS Strength Enhancer
	}
if( nRoll == 8 && nItemLevel >= 25 ) nRoll = 25; // Systech Cardio-Regulator --> Aratech Cardio-Regulator
if( nRoll == 9 && nItemLevel >= 18 ) nRoll = 18; // Hyper Adrenaline Amplifier --> Adrenaline Stimulator
if( nRoll == 14 && nItemLevel >= 22 ) nRoll = 22; // Eriadu Stealth Unit --> Defel Mimicker
if( nRoll == 20 && nItemLevel >= 30 ) nRoll = 30; // Jal Shey Belt --> Jal Shey Mentor Belt
if( nRoll == 22 && nItemLevel >= 29 ) nRoll = 29; // Defel Mimicker --> Aratech Echo Belt
// If Qel-Droma Belt was already found, replace it with Jal Shey Mentor Belt
if( nRoll == 27 && LOOT_GetUniqueFound(LOOT_BELT, nRoll) == TRUE ) {
	nRoll = 30;
	}
// Set globals for unique items if we rolled any
if( nRoll == 27 ) {
	LOOT_SetUniqueFound(LOOT_BELT, nRoll, TRUE);
	}

return nRoll;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetGloveNum()
	
	Generates item variation number for gloves.
	
	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-23                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetGloveNum(int nItemLevel) {

int nRoll = LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_MODERATE);
// Replacement table for if a better version of what we rolled is available
if( nRoll == 2 && nItemLevel >= 7 ) nRoll = 7; // Exchange Casual Gloves --> Exchange Work Gloves
if( nRoll == 3 && nItemLevel >= 14 ) nRoll = 14; // Strength Gauntlets --> Eriadu Strength Amplifier
if( nRoll == 4 && nItemLevel >= 15 ) nRoll = 15; // Taris Survival Gloves --> Karakan Gauntlets
if( nRoll == 9 && nItemLevel >= 16 ) nRoll = 16; // Detonator Gloves --> Bothan Precision Gloves
if( nRoll == 12 && nItemLevel >= 22 ) nRoll = 22; // Jal Shey Perception Gloves --> Jal Shey Meditation Gloves
if( nRoll == 14 && nItemLevel >= 17 ) nRoll = 17; // Eriadu Strength Amplifier --> Sith Power Gauntlets
if( nRoll == 17 && nItemLevel >= 25 ) nRoll = 25; // Sith Power Gauntlets --> Dominator Gloves
if( nRoll == 21 && nItemLevel >= 29 ) nRoll = 29; // Automation Gloves --> Improved Automation Gloves
// If Ossluk's Gloves were already found, replace them
if( nRoll == 27 && LOOT_GetUniqueFound(LOOT_GLOVES, nRoll) == TRUE ) {
	nRoll = Random(8) + 22;
	if( nRoll == 27 ) nRoll = 30;
	}
// Set globals for unique items if we rolled any
if( nRoll == 27 ) {
	LOOT_SetUniqueFound(LOOT_GLOVES, nRoll, TRUE);
	}

return nRoll;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetHeadgearNum()
	
	Generates item variation number for headgear.
	
	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetHeadgearNum(int nItemLevel) {

int nRoll = LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_MODERATE);
// No Breath Mask in Peragus dormitories
if( nRoll == 2 && GetModuleName() == "105PER" ) {
	nRoll = LOOT_DiceResult(nItemLevel - 1, LOOT_DICE_POOL_MODERATE);
	if( nRoll >= 2 ) nRoll = nRoll + 1;
	}
// Replacement table for if a better version of what we rolled is available
if( nRoll == 1 && nItemLevel >= 23 ) nRoll = 23; // Neural Band --> Matukai Meditation Band
if( nRoll == 3 && nItemLevel >= 12 ) nRoll = 12; // Rakatan Band --> Meditation Band
if( nRoll == 5 && nItemLevel >= 13 ) nRoll = 13; // Bothan Perception Visor --> Bothan Sensory Visor
if( nRoll == 6 && nItemLevel >= 29 ) nRoll = 29; // Sonic Nullifiers --> Absorbtion Visor
if( nRoll == 9 && nItemLevel >= 27 ) nRoll = 27; // Shielding Visor --> Enhanced Shielding Visor
if( nRoll == 10 && nItemLevel >= 15 ) nRoll = 15; // Spacer's Sensor --> Combat Sensor
if( nRoll == 12 && nItemLevel >= 23 ) nRoll = 23; // Meditation Band --> Matukai Meditation Band
// If the Circlet of Saresh has already been found, replace it
if( nRoll == 25 && LOOT_GetUniqueFound(LOOT_HEADGEAR, nRoll) == TRUE ) {
	if( LOOT_GetUniqueFound(LOOT_HEADGEAR, 26) == FALSE ) nRoll = 26; // Bindo's Band if it hasn't been found
	else if( Random(2) == 0 ) nRoll = 23; // Matukai Meditation Band
	else nRoll = 30; // Force Focusing Visor
	}
if( nRoll == 26 && LOOT_GetUniqueFound(LOOT_HEADGEAR, nRoll) == TRUE ) {
	if( LOOT_GetUniqueFound(LOOT_HEADGEAR, 25) == FALSE ) nRoll = 25; // Circlet of Saresh if it hasn't been found
	else if( Random(2) == 0 ) nRoll = 23; // Matukai Meditation Band
	else nRoll = 30; // Force Focusing Visor
	}
// Set globals for unique items if we rolled any
if( nRoll == 25 || nRoll == 26 ) {
	LOOT_SetUniqueFound(LOOT_HEADGEAR, nRoll, TRUE);
	}

return nRoll;

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
	
	JC 2019-01-15                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetImplantTier(int nItemLevel) {

if( nItemLevel > 30 ) nItemLevel = 30;
int nCON = GetAbilityModifier(ABILITY_CONSTITUTION, GetFirstPC());
int nRoll = Random(95 + nItemLevel) + 1;
int nOutput;
if( nCON <= 1 ) {
	if( nRoll <= 60 ) nOutput = 1;
	else if( nRoll <= 80 ) nOutput = 2;
	else if( nRoll <= 90 ) nOutput = 3;
	else nOutput = 4;
	}
else if( nCON == 2 ) {
	if( nRoll <= 20 ) nOutput = 1;
	else if( nRoll <= 70 ) nOutput = 2;
	else if( nRoll <= 90 ) nOutput = 3;
	else nOutput = 4;
	}
else if( nCON == 3 ) {
	if( nRoll <= 10 ) nOutput = 1;
	else if( nRoll <= 30 ) nOutput = 2;
	else if( nRoll <= 80 ) nOutput = 3;
	else nOutput = 4;
	}
else {
	if( nRoll <= 10 ) nOutput = 1;
	else if( nRoll <= 20 ) nOutput = 2;
	else if( nRoll <= 40 ) nOutput = 3;
	else nOutput = 4;
	}

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetImplantNum()
	
	Generates item variation number for all implant tiers.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-23                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetImplantNum(int nItemLevel) {

// Implants have 10 variations
int nRoll = ( LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_MILD) + 2 ) / 3;

return nRoll;

}


////////////////////////////////////////////////////////////////////////////////
//	ARMOR
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetLightArmorNum()
	
	Generates item variation number for light armor.
	
	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetLightArmorNum(int nItemLevel) {

// Armors have 15 variations
int nRoll = ( LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_MODERATE) + 1 ) / 2;
int nItemScale = ( ( nItemLevel + 1 ) / 2 );
if( nItemScale > 15 ) nItemScale = 15;
// Replacement table for if a better version of what we rolled is available
if( nRoll <= 3 && nItemScale > 5 ) nRoll = Random(nItemScale - 4) + 5; // Light Combat Suit, Combat Suit, & Heavy Combat Suit
if( nRoll == 4 && nItemScale >= 9 ) nRoll = 9; // Mandalorian Combat Suit --> Mandalorian Heavy Suit
if( nRoll == 10 && nItemScale >= 14 ) nRoll = 14; // Zabrak Battle Armor --> Zabrak Field Armor
if( nRoll == 13 && nItemScale >= 14 ) nRoll = 14; // Reinforced Fiber Mesh --> Zabrak Field Armor
// If Ulic Qel-Droma's Mesh Suit has already been found, replace it
if( nRoll == 15 && LOOT_GetUniqueFound(LOOT_LIGHT_ARMOR, nRoll) == TRUE ) {
	nRoll = 14 - Random(6);
	}
// Set globals for unique items if we rolled any
if( nRoll == 15 ) {
	LOOT_SetUniqueFound(LOOT_LIGHT_ARMOR, nRoll, TRUE);
	}

return nRoll;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetMediumArmorNum()
	
	Generates item variation number for medium armor.
	
	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetMediumArmorNum(int nItemLevel) {

// Armors have 15 variations
int nRoll = ( LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_MODERATE) + 1 ) / 2;
int nItemScale = ( ( nItemLevel + 1 ) / 2 );
if( nItemScale > 15 ) nItemScale = 15;
// Replacement table for if a better version of what we rolled is available
if( nRoll <= 3 && nItemScale > 5 ) nRoll = Random(nItemScale - 4) + 5; // Military Suit, Light Battle Armor, & Echani Battle Armor
if( nRoll == 4 && nItemScale >= 12 ) nRoll = 12; // Cinnagar War Suit --> Heavy Cinnagar War Suit
if( nRoll == 6 && nItemScale >= 9 ) nRoll = 9; // Bronzium Light Battle Armor --> Powered Light Battle Armor
if( nRoll == 7 && nItemScale >= 11 ) nRoll = 11; // Verpine Fiber Mesh --> Exar Kun's Light Battle Suit
if( nRoll == 8 && nItemScale >= 10 ) nRoll = 10; // Krath Heavy Armor --> Krath Holy Battle Suit
if( nRoll == 11 && nItemScale >= 13 ) nRoll = 13; // Exar Kun's Light Battle Suit --> Verpine Fiber Ultramesh
// If Exar Kun's Light Battle Suit has already been found, replace it with
// Verpine Fiber Ultramesh (if it wasn't already replaced due to item level)
if( nRoll == 11 && LOOT_GetUniqueFound(LOOT_MEDIUM_ARMOR, nRoll) == TRUE ) {
	nRoll = 13;
	}
// If Jamoh Hogra's Battle Armor has already been found, replace it with
// Powered Light Batle Armor
if( nRoll == 15 && LOOT_GetUniqueFound(LOOT_MEDIUM_ARMOR, nRoll) == TRUE ) {
	nRoll = 9;
	}
// Set globals for unique items if we rolled any
if( nRoll == 11 || nRoll == 15 ) {
	LOOT_SetUniqueFound(LOOT_MEDIUM_ARMOR, nRoll, TRUE);
	}

return nRoll;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetHeavyArmorNum()
	
	Generates item variation number for heavy armor.
	
	Replaces certain items when better versions are available.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetHeavyArmorNum(int nItemLevel) {

// Armors have 15 variations
int nRoll = ( LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_MODERATE) + 1 ) / 2;
int nItemScale = ( ( nItemLevel + 1 ) / 2 );
if( nItemScale > 15 ) nItemScale = 15;
// Replacement table for if a better version of what we rolled is available
if( nRoll <= 2 && nItemScale > 5 ) nRoll = Random(nItemScale - 2) + 3; // Battle Armor & Heavy Battle Armor
if( nRoll >= 3 && nRoll <= 4 && nItemScale >= 7 ) nRoll = Random(nItemScale - 4) + 5; // Echani Heavy Armor	& Durasteel Heavy Armor
if( nRoll == 5 && nItemScale >= 11 ) nRoll = 11; // Powered Battle Armor --> Corellian Powersuit

return nRoll;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetRobeNum()
	
	Generates item variation number for robes.
	
	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetRobeNum(int nItemLevel) {

// Item level is reduced because the scaling for robes has to be slowed down on
// account of how you can't roll for robes at all until after Peragus.
nItemScale = nItemLevel - 2;
if( nItemScale < 1 ) nItemScale = 1;
// Robes have 30 variations
int nRoll = LOOT_DiceResult(nItemScale, LOOT_DICE_POOL_EXTREME);
// Replacement table for if a better version of what we rolled is available
if( nRoll == 1 ) nRoll = 2; // No clothing ever
if( nRoll == 2 && nItemScale >= 8 ) nRoll = 8; // Padawan --> Jedi
if( nRoll == 3 && nItemScale >= 9 ) nRoll = 9; // Dark Padawan --> Dark Jedi
if( nRoll == 4 && nItemScale >= 19 ) nRoll = 19; // Baran Do Novice --> Baran Do Sage
if( nRoll == 5 && nItemScale >= 15 ) nRoll = 15; // Matukai Apprentice --> Matukai Adept
if( nRoll == 6 && nItemScale >= 16 ) nRoll = 16; // Zeison Sha Initiate --> Zeison Sha Warrior
if( nRoll == 7 && nItemScale >= 11 ) nRoll = 11; // Jal Shey Neophyte --> Jal Shey Advisor
if( nRoll == 8 && nItemScale >= 13 ) nRoll = 13; // Jedi --> Jedi Knight
if( nRoll == 9 && nItemScale >= 14 ) nRoll = 14; // Dark Jedi --> Dark Jedi Knight
if( nRoll == 11 && nItemScale >= 20 ) nRoll = 20; // Jal Shey Advisor --> Jal Shey Mentor
if( nRoll == 13 && nItemScale >= 17 ) nRoll = 17; // Jedi Knight --> Jedi Master
if( nRoll == 14 && nItemScale >= 18 ) nRoll = 18; // Dark Jedi Knight --> Dark Jedi Master
// Unique item checks
int nOutput;
// If we rolled a unique item that we found before, replace it with one we haven't found
if( nRoll >= 23 && LOOT_GetUniqueFound(LOOT_ROBES, nRoll) == TRUE ) {
	nOutput = 0;
	int i = nRoll - 1;
	int j = nRoll + 1;
	// Start with numbers less than what we rolled and look for a unique
	// item we haven't found yet
	while ( i >= 23 ) {
		if( LOOT_GetUniqueFound(LOOT_ROBES, i) == FALSE ) {
			nOutput = i;
			i = 0;
			}
		else i--;
		}
	// If none were found, increase the number until we find one
	while ( i != 0 && j <= 30 ) {
		if( LOOT_GetUniqueFound(LOOT_ROBES, j) == FALSE ) {
			nOutput = j;
			i = 0;
			}
		else j++;
		}
	// If all unique items have been found, roll for a non-unique item
	// (outputs a value of 15-22)
	if( nOutput <= 0 ) {
		nOutput = 22 - Random(8);
		}
	}
// Otherwise, stick with what we rolled
else {
	nOutput = nRoll;
	}
// Set globals for unique items if we rolled any
if( nOutput >= 23 ) {
	LOOT_SetUniqueFound(LOOT_ROBES, nOutput, TRUE);
	}

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_AlignmentRobe()
	
	Changes a robe number to match the specified alignment.
	
	Applies to:
	* Padawan Robe / Dark Padawan Robe
	* Jedi Robe / Dark Jedi Robe
	* Jedi Knight Robe / Dark Jedi Knight Robe
	* Jedi Master Robe / Dark Jedi Master Robe
	
	- sItemName = Item template (a_robe_*)
	- nAlignment = Alignment score (0 to 99, dark to light)
	
	JC 2019-02-24                                                             */
////////////////////////////////////////////////////////////////////////////////
string LOOT_AlignmentRobe(string sItemName, int nAlignment) {

int nItemNum = StringToInt(GetStringRight(sItemName, 2));
int nNewNum = nItemNum;
if( nAlignment >= 50 ) {
	switch( nItemNum ) {
		case 3:
			nNewNum = 2;
			break;
		case 9:
			nNewNum = 8;
			break;
		case 14:
			nNewNum = 13;
			break;
		case 18:
			nNewNum = 17;
			break;
		}
	}
else {
	switch( nItemNum ) {
		case 2:
			nNewNum = 3;
			break;
		case 8:
			nNewNum = 9;
			break;
		case 13:
			nNewNum = 14;
			break;
		case 17:
			nNewNum = 18;
			break;
		}
	}

return GetItemPrefix(LOOT_ROBES) + LOOT_Suffix(nNewNum);

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
	
	JC 2019-02-23                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidItemType() {

int nOutput;
int nRoll = Random(8) + 1;
if( nRoll == 1 ) nOutput = LOOT_DROID_TYPE_ARMOR;
else if( nRoll == 2 ) nOutput = LOOT_DROID_TYPE_UTILITY;
else if( nRoll == 3 || nRoll == 4 ) nOutput = LOOT_DROID_TYPE_INTERFACE;
else if( nRoll == 5 || nRoll == 6 ) nOutput = LOOT_DROID_TYPE_SHIELD;
else nOutput = LOOT_DROID_TYPE_DEVICES;

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidInterfaceNum()
	
	Generates item variation for droid interfaces.
	
	Replaces certain items when better versions are available.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidInterfaceNum(int nItemLevel) {

// Droid interfaces have 15 variations
int nRoll = ( LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_MILD) + 1 ) / 2;
// Rescale item level
int nItemScale = ( ( nItemLevel + 1 ) / 2 );
if( nItemScale > 15 ) nItemScale = 15;
// Replacement table for if a better version of what we rolled is available
if( nRoll == 1 && nItemScale >= 4 ) nRoll = 4; // Droid Optimized Interface --> Droid Lockout Bypass
if( nRoll == 3 && nItemScale >= 13 ) nRoll = 13; // Droid Machine Interface --> Droid Scavenger Upgrade
if( nRoll == 4 && nItemScale >= 10 ) nRoll = 10; // Droid Lockout Bypass --> Droid Exchange Interface
if( nRoll == 5 && nItemScale >= 8 ) nRoll = 8; // Droid Parabolic Guides --> Droid Agility Upgrade
if( nRoll == 7 && nItemScale >= 13 ) nRoll = 13; // Droid Durability Upgrade --> Droid Scavenger Upgrade

return nRoll;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidUtilityNum()
	
	Generates item variation for droid utilities.
	
	Replaces certain items when better versions are available.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidUtilityNum(int nItemLevel) {

// Droid utilities have 15 variations
int nRoll = ( LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_MILD) + 1 ) / 2;
int nItemScale = ( ( nItemLevel + 1 ) / 2 );
if( nItemScale > 15 ) nItemScale = 15;
// Replacement table for if a better version of what we rolled is available
if( nRoll == 1 && nItemScale >= 8 ) nRoll = 8; // Droid Motion Tracker --> Droid Perception Sensors
if( nRoll == 2 && nItemScale >= 7 ) {
	// Droid Upgrade Slot isn't needed after level 7
	nRoll = Random(nItemScale - 1) + 1;
	if( nRoll == 2 ) nRoll = nItemScale;
	}
if( nRoll == 4 && nItemScale >= 13 ) {
	// Droid Advanced Upgrade Slot isn't needed after level 13
	nRoll = Random(nItemScale - 2) + 1;
	if( nRoll == 2 ) nRoll = nItemScale - 1;
	if( nRoll == 4 ) nRoll = nItemScale;
	}
if( nRoll == 10 && nItemScale >= 11 ) nRoll = 11; // Droid Warfare Upgrade --> Droid Battle Upgrade

return nRoll;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidArmorNum()
	
	Generates item variation for droid armor.
	
	Replaces certain items when better versions are available.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-24                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidArmorNum(int nItemLevel) {

// Droid armors have 15 variations
int nRoll = ( LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_MILD) + 1 ) / 2;
// Rescale item level
int nItemScale = ( ( nItemLevel + 1 ) / 2 );
if( nItemScale > 15 ) nItemScale = 15;
// Reroll 14 & 15 for variety since the last three are all Energized Armor
if( nRoll == 14 || nRoll == 15 ) {
	nRoll = 13 - Random(10);
	}
// Replacement table for if a better version of what we rolled is available
// Impact Armor I --> Impact Armor II
if( nRoll == 1 && nItemScale >= 4 && nItemScale < 7 ) {
	if( Random(2) == 1 ) nRoll = 3;
	}
if( nRoll == 1 && nItemScale >= 4 && nItemScale >= 7 ) nRoll = 3;
// Modular Plating I --> Modular Plating II
if( nRoll == 2 && nItemScale >= 6 && nItemScale < 7 ) {
	if( Random(2) == 1 ) nRoll = 6;
	}
if( nRoll == 2 && nItemScale >= 6 && nItemScale >= 7 ) nRoll = 6;
// Impact Armor II --> Impact Armor III
if( nRoll == 3 && nItemScale >= 5 && nItemScale < 13 ) {
	if( Random(2) == 1 ) nRoll = 5;
	}
if( nRoll == 3 && nItemScale >= 5 && nItemScale >= 13 ) nRoll = 5;
// Impact Armor III --> Modular Plating II
if( nRoll == 5 && nItemScale >= 10 && nItemScale < 13 ) nRoll = 6;
// Modular Plating II --> Modular Plating III
if( nRoll == 6 && nItemScale >= 7 && nItemScale < 13 ) {
	if( Random(2) == 1 ) nRoll = 7;
	}
if( nRoll == 6 && nItemScale >= 7 && nItemScale >= 13 ) nRoll = 7;
// Modular Plating III replaced at higher levels
if( nRoll == 7 && nItemScale >= 14 ) nRoll = Random(nItemScale - 10) + 8;
// Dura Plating I --> Dura Plating II
if( nRoll == 9 && nItemScale >= 20 ) nRoll = 11;
// Energized Armor I --> Energized Armor II
if( nRoll == 13 && nItemScale >= 26 ) nRoll = 14;
// Energized Armor II --> Energized Armor III
if( nRoll == 14 && nItemScale >= 28 ) nRoll = 15;

return nRoll;

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

return LOOT_DROID_TYPE_SHIELD + Random(2) + 1;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidShieldTier()
	
	Determines item tier for droid shields. Both shield subtypes have three
	tiers.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-02-13                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidShieldTier(int nItemLevel) {

int nOutput;
if( nItemLevel >= 13 ) nOutput = 3;
else if( nItemLevel >= 7 ) nOutput = 2;
else nOutput = 1;

return nOutput;

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
	- nItemType: Item type (LOOT_DROID_SHIELD_*)
	- nItemTier: Optional number to specify an item tier
	
	JC 2019-02-13                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidShieldNum(int nItemLevel, int nItemType = 0, int nItemTier = 0) {

// If shield subtype isn't known, randomly generate it
if( nItemType != LOOT_DROID_SHIELD_ENERGY &&
	nItemType != LOOT_DROID_SHIELD_ENVIRO ) {
	nItemType = LOOT_DROID_TYPE_SHIELD + Random(2) + 1;
	}
// If the item tier isn't known, randomly generate it
if( nItemTier < 1 || nItemTier > 3 ) {
	nItemTier = LOOT_GetDroidShieldTier(nItemLevel);
	}

int nOutput = 1; // default to 1
switch( nItemType ) {
	// Droid Shield - Energy
	case 541:
		switch( nItemTier ) {
			case 1:
				nOutput = 1; // Deflector Mark I
				break;
			case 2:
				nOutput = 2; // Deflector Mark II
				break;
			case 3:
				nOutput = 5; // Deflector Mark III
				break;
			}
		break;
	// Droid Shield - Environmental
	case 542:
		switch( nItemTier ) {
			case 1:
				nOutput = 3; // Defense Barrier
				break;
			case 2:
				nOutput = 4; // Energy Collector
				break;
			case 3:
				nOutput = 6; // Unity Grid
				break;
			}
		break;
	}

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidDeviceNum()
	
	Generates item variation for droid devices.
	
	Replaces certain items when better versions are available.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-01-25                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidDeviceNum(int nItemLevel) {

// Droid devices have 15 variations
int nRoll = ( LOOT_DiceResult(nItemLevel, LOOT_DICE_POOL_MILD) + 1 ) / 2;
// Rescale item level
int nItemScale = ( ( nItemLevel + 1 ) / 2 );
if( nItemScale > 15 ) nItemScale = 15;
// Replace 14 for variety, since there are three Ion Blasts
if( nRoll == 14 && nItemScale < 15 ) nRoll = Random(13) + 1; // Reroll
if( nRoll == 14 && nItemScale >= 15 ) nRoll = 15; // Ion Blast Mark III --> Multi-Spectral Emitter
// Replacement table for if a better version of what we rolled is available
if( nRoll == 1 && nItemScale >= 5 ) nRoll = 5; // Neural Pacifier --> Neural Scrambler
if( nRoll == 3 && nItemScale >= 7 ) nRoll = 7; // Flame Thrower --> Molten Cannon
if( nRoll == 4 && nItemScale >= 10 ) nRoll = 10; // Toxin Emitter --> Bio-Assault Spray
if( nRoll == 6 && nItemScale >= 9 ) nRoll = 9; // Ion Striker --> Plasma Thrower
if( nRoll == 8 && nItemScale >= 11 ) nRoll = 11; // Carbonite Projector --> Carbonite Emitter
if( nRoll == 12 && nItemScale >= 13 ) nRoll = 13; // Ion Blast Mark I --> Ion Blast Mark II
if( nRoll == 13 && nItemScale >= 14 ) nRoll = 14; // Ion Blast Mark II --> Ion Blast Mark III

return nRoll;

}


////////////////////////////////////////////////////////////////////////////////
//	DISPOSABLES
////////////////////////////////////////////////////////////////////////////////

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

return LOOT_TYPE_SHIELD + Random(3) + 1;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetShieldTier()
	
	Determines item tier for shields.
	
	Each shield subtype has 4 tiers, all based on the same level scale.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-02-12                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetShieldTier(int nItemLevel) {

int nOutput;
if( nItemLevel >= 23 ) nOutput = 4;
else if( nItemLevel >= 19 ) nOutput = 3;
else if( nItemLevel >= 7 ) nOutput = 2;
else nOutput = 1;

return nOutput;

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
	- nItemType: Type of item (LOOT_SHIELD_*)
	- nItemTier: Optional number to specify an item tier
	
	JC 2019-02-12                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetShieldNum(int nItemLevel, int nItemType = 0, int nItemTier = 0) {

// If the item type isn't known, randomly generate it
if( nItemType != LOOT_SHIELD_ENERGY &&
	nItemType != LOOT_SHIELD_ENVIRO &&
	nItemType != LOOT_SHIELD_MELEE ) {
	nItemType = LOOT_GetShieldSubtype();
	}
// If the item tier isn't known, randomly generate it
if( nItemTier < 1 && nItemTier > 4 ) {
	nItemTier = LOOT_GetShieldTier(nItemLevel);
	}

int nItemNum;
switch( nItemType ) {
	// Shield - Energy
	case 931:
		switch( nItemTier ) {
			case 1:
				nItemNum = 1; // Energy Shield
				break;
			case 2:
				nItemNum = 4; // Echani Shield
				break;
			case 3:
				nItemNum = 6; // Echani Dueling Shield
				break;
			case 4:
				nItemNum = 7; // Verpine Prototype Shield
				break;
			}
		break;
	// Shield - Enviro
	case 932:
		switch( nItemTier ) {
			case 1:
				nItemNum = 1; // Energy Shield
				break;
			case 2:
				nItemNum = 3; // Arkanian Energy Shield
				break;
			case 3:
				nItemNum = 3; // Arkanian Energy Shield
				break;
			case 4:
				nItemNum = 7; // Verpine Prototype Shield
				break;
		}
		break;
	// Shield - Melee
	case 933:
		switch( nItemTier ) {
			case 1:
				nItemNum = 2; // Mandalorian Melee Shield
				break;
			case 2:
				nItemNum = 5; // Mandalorian Power Shield
				break;
			case 3:
				nItemNum = 5; // Mandalorian Power Shield
				break;
			case 4:
				nItemNum = 5; // Mandalorian Power Shield
				break;
			}
		break;
	}

return nItemNum;

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
	- nItemType: Type of item (LOOT_SHIELD_*)
	
	JC 2019-02-12                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetShieldQuantity(int nItemLevel, int nItemType, int nItemTier = 0) {

// If the item tier isn't known, randomly generate it
if( nItemTier < 1 && nItemTier > 4 ) {
	nItemTier = LOOT_GetShieldTier(nItemLevel);
	}

int nOutput = 1; // default to 1 item
// Enviro 3
if( nItemType == 932 && nItemTier == 3 ) {
	nOutput = Random(2) + 1;
	}
// Melee 3
if( nItemType == 933 && nItemTier == 3 ) {
	nOutput = Random(2) + 1;
	}
// Melee 4
if( nItemType == 933 && nItemTier == 4 ) {
	nOutput = Random(3) + 1;
	}

return nOutput;

}

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetMedpacTier()
	
	Determines item tier for medical items (medpacs and repair kits).
	
	- nItemLevel: Item level determining the quality of the items we can get
		
	JC 2019-02-13                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetMedpacTier(int nItemLevel) {

int nOutput;
if( nItemLevel < 9 ) nOutput = 1;
else if( nItemLevel < 16 ) nOutput = 2;
else nOutput = 3;

return nOutput;

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
	  * LOOT_STIM_SUBTYPE_ANY: Everything
	  * LOOT_STIM_SUBTYPE_DRUGS: Stimulants only, no medpacs
	  * LOOT_STIM_SUBTYPE_STATS: STR, DEX, and CON stimulants only, no battle
								 stimulants or medpacs
		
	JC 2019-02-12                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetStimSubtype(int nFilter) {

int nRange;
if( nFilter == LOOT_STIM_SUBTYPE_STATS ) nRange = 3;
else if( nFilter == LOOT_STIM_SUBTYPE_DRUGS ) nRange = 4;
else nRange = 5;
int nRoll = Random(nRange) + 1;
int nOutput;
if( nRoll == 1 ) nOutput = LOOT_STIM_CON;
else if( nRoll == 2 ) nOutput = LOOT_STIM_DEX;
else if( nRoll == 3 ) nOutput = LOOT_STIM_STR;
else if( nRoll == 4 ) nOutput = LOOT_STIM_BAT;
else nOutput = LOOT_MEDPAC_II;

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetStimTier()
	
	Determines item tier for stimulants.
	
	Battle stimulants have 3 tiers. CON, DEX, and STR stimulants have only 2
	tiers, but this function will output up to 3 for them anyway. This gets
	fixed in the LOOT_GetStimNum() function.
	
	- nItemLevel: Item level determining the quality of the items we can get
	
	JC 2019-02-13                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetStimTier(int nItemLevel) {

int nOutput;
if( nItemLevel < 12 ) nOutput = 1;
else if( nItemLevel < 22 ) nOutput = 2;
else nOutput = 3;

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetStimNum()
	
	Generates item variation number for stimulants.
	
	CON, DEX, and STR stimulants have two tiers and share an item prefx, so the
	proper number has to be extracted. Battle stimulants have three tiers and
	a separate item prefix.
	
	- nItemLevel: Item level determining the quality of the items we can get
	- nItemType: Type of item (LOOT_STIM_* full item type)
	- nItemTier: Optional number to specify an item tier
	
	JC 2019-02-13                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetStimNum(int nItemLevel, int nItemType = 0, int nItemTier = 0) {

// If the item type isn't known, randomly generate it
if( nItemType != LOOT_STIM_CON &&
	nItemType != LOOT_STIM_DEX &&
	nItemType != LOOT_STIM_STR &&
	nItemType != LOOT_STIM_BAT ) {
	nItemType = LOOT_GetStimSubtype(LOOT_STIM_SUBTYPE_DRUGS);
	}
// If the tier isn't known, randomly generate it
if( nItemTier < 1 || nItemTier > 3 ) {
	nItemTier = LOOT_GetStimTier(nItemLevel);
	}
// Determine item number
int nOutput;
// CON, DEX, and STR stimulants are weird
if( nItemType == LOOT_STIM_CON ) {
	if( nItemTier == 1 ) nOutput = 1;
	else nOutput = 4;
	}
else if( nItemType == LOOT_STIM_DEX ) {
	if( nItemTier == 1 ) nOutput = 2;
	else nOutput = 5;
	}
else if( nItemType == LOOT_STIM_STR ) {
	if( nItemTier == 1 ) nOutput = 3;
	else nOutput = 6;
	}
// Battle stimulants are fine
else {
	nOutput = nItemTier;
	}

return nOutput;

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
	
	JC 2019-02-12                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetGrenadeSubtype(int nItemLevel) {

int nRoll = Random(20) + 1;
int nOutput;
// Level 1-3
if( nItemLevel < 4 ) {
	if( nRoll <= 15 ) {
		nOutput = LOOT_GRENADE_FRAG;
		}
	else if( nRoll == 16 || nRoll == 17 ) {
		nOutput = LOOT_GRENADE_ADHESIVE;
		}
	else if( nRoll == 18 ) {
		nOutput = LOOT_GRENADE_ION;
		}
	else if( nRoll == 19 ) {
		nOutput = LOOT_GRENADE_PLASMA;
		}
	else {
		nOutput = LOOT_GRENADE_SONIC;
		}
	}
// Level 4-6
else if( nItemLevel < 7 ) {
	if( nRoll <= 13 ) {
		nOutput = LOOT_GRENADE_FRAG;
		}
	else if( nRoll == 14 || nRoll == 15 ) {
		nOutput = LOOT_GRENADE_ADHESIVE;
		}
	else if( nRoll == 16 || nRoll == 17 ) {
		nOutput = LOOT_GRENADE_CONCUSSION;
		}
	else if( nRoll == 18 ) {
		nOutput = LOOT_GRENADE_ION;
		}
	else if( nRoll == 19 ) {
		nOutput = LOOT_GRENADE_PLASMA;
	}
	else {
		nOutput = LOOT_GRENADE_SONIC;
		}
	}
// Level 7-10
else if( nItemLevel < 11 ) {
	if( nRoll <= 6 ) {
		nOutput = LOOT_GRENADE_FRAG;
		}
	else if( nRoll == 7 || nRoll == 8 || nRoll == 9 ) {
		nOutput = LOOT_GRENADE_ADHESIVE;
		}
	else if( nRoll == 10 || nRoll == 11 || nRoll == 12 ) {
		nOutput = LOOT_GRENADE_CONCUSSION;
		}
	else if( nRoll == 13 || nRoll == 14 ) {
		nOutput = LOOT_GRENADE_ION;
		}
	else if( nRoll == 15 || nRoll == 16 ) {
		nOutput = LOOT_GRENADE_PLASMA;
		}
	else if( nRoll == 17 || nRoll == 18 ) {
		nOutput = LOOT_GRENADE_POISON;
		}
	else {
		nOutput = LOOT_GRENADE_SONIC;
		}
	}
// Level 11-14
else if( nItemLevel < 15 ) {
	if( nRoll <= 4 ) {
		nOutput = LOOT_GRENADE_FRAG;
		}
	else if( nRoll == 5 || nRoll == 6 || nRoll == 7 ) {
		nOutput = LOOT_GRENADE_ADHESIVE;
		}
	else if( nRoll == 8 || nRoll == 9 || nRoll == 10 ) {
		nOutput == LOOT_GRENADE_CONCUSSION;
		}
	else if( nRoll == 11 || nRoll == 12 ) {
		nOutput = LOOT_GRENADE_CRYOBAN;
		}
	else if( nRoll == 13 || nRoll == 14 ) {
		nOutput = LOOT_GRENADE_ION;
		}
	else if( nRoll == 15 || nRoll == 16 ) {
		nOutput = LOOT_GRENADE_PLASMA;
		}
	else if( nRoll == 17 || nRoll == 18 ) {
		nOutput = LOOT_GRENADE_POISON;
		}
	else {
		nOutput = LOOT_GRENADE_SONIC;
		}
	}
// Level 15+
else {
	if( nRoll <= 3 ) {
		nOutput = LOOT_GRENADE_FRAG;
		}
	else if( nRoll == 4 || nRoll == 5 || nRoll == 6 ) {
		nOutput = LOOT_GRENADE_ADHESIVE;
		}
	else if( nRoll == 7 || nRoll == 8 || nRoll == 9 ) {
		nOutput == LOOT_GRENADE_CONCUSSION;
		}
	else if( nRoll == 10 || nRoll == 11 ) {
		nOutput = LOOT_GRENADE_CRYOBAN;
		}
	else if( nRoll == 12 || nRoll == 13 ) {
		nOutput = LOOT_GRENADE_ION;
		}
	else if( nRoll == 14 || nRoll == 15 ) {
		nOutput = LOOT_GRENADE_PLASMA;
		}
	else if( nRoll == 16 || nRoll == 17 ) {
		nOutput = LOOT_GRENADE_POISON;
		}
	else if( nRoll == 18 || nRoll == 19 ) {
		nOutput = LOOT_GRENADE_SONIC;
		}
	else {
		nOutput = LOOT_GRENADE_THERMAL_DETONATOR;
		}
	}

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetGrenadeQuantity()
	
	Determines amount of grenades to give, based on type.

	At higher levels, the quantity of common and less common grenades is
	increased to 1d2 and the quantity of very common grenades up to 2d2.
	
	- nItemLevel: Item level determining the quantity of items we get
	- nItemType: Type of item (LOOT_GRENADE_*)
	
	JC 2019-02-18                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetGrenadeQuantity(int nItemLevel, int nItemType) {

// If the item type isn't known, randomly generate it
if( nItemType != LOOT_GRENADE_ADHESIVE &&
	nItemType != LOOT_GRENADE_CONCUSSION &&
	nItemType != LOOT_GRENADE_CRYOBAN &&
	nItemType != LOOT_GRENADE_FRAG &&
	nItemType != LOOT_GRENADE_ION &&
	nItemType != LOOT_GRENADE_PLASMA &&
	nItemType != LOOT_GRENADE_POISON &&
	nItemType != LOOT_GRENADE_SONIC &&
	nItemType != LOOT_GRENADE_THERMAL_DETONATOR ) {
	nItemType = LOOT_GetGrenadeSubtype(nItemLevel);
	}

int nOutput = 1; // default to 1 item
if( nItemType == LOOT_GRENADE_FRAG ) {
	if( nItemLevel < 7 ) nOutput = Random(2) + 1;
	else if( nItemLevel >= 7 && nItemLevel < 11 ) nOutput = Random(3) + 1;
	else if( nItemLevel >= 11 && nItemLevel < 15 ) nOutput = Random(4) + 1;
	else nOutput = Random(2) + Random(2) + 2;
	}
if( nItemType == LOOT_GRENADE_ADHESIVE ||
	nItemType == LOOT_GRENADE_CONCUSSION ||
	nItemType == LOOT_GRENADE_CRYOBAN ||
	nItemType == LOOT_GRENADE_ION ||
	nItemType == LOOT_GRENADE_PLASMA ||
	nItemType == LOOT_GRENADE_POISON ||
	nItemType == LOOT_GRENADE_SONIC ) {
	if( nItemLevel >= 7 ) nOutput = Random(2) + 1;
	}

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetSecSpikeTier()
	
	Determines security spike tier.

	Security spikes have two tiers: Security Tunnelers grant a +5 bonus	and
	Security Spike Tunnelers grant a +10 bonus.
	
	This function rolls a d10 and adds it to the item level; at level 10, the
	player will have a chance of getting Security Spike Tunnelers and after
	level 20 they will always receive them.
	
	- nItemLevel: Item level determining the quality of items we can get
	
	JC 2019-02-18                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetSecSpikeTier(int nItemLevel) {

int nOutput = ( nItemLevel + Random(10) + 1 ) % 10;
if( nOutput < 2 ) nOutput = 1;
else nOutput = 2;

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetRocketNum()
	
	Determines item variation for Mira's rockets.
	
	Replaces certain items when better versions are available.
	
	- nItemLevel: Item level determining the quality of items we can get
	
	JC 2019-02-18                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetRocketNum(int nItemLevel) {

// AOE rockets are only available at higher levels
int nRange;
if( nItemLevel < 10 ) nRange = 4;
else nRange = 8;
// Roll for rocket type
int nRoll = Random(nRange) + 1;
int nOutput;
switch( nRoll ) {
	case 1:
		// Tranquilizer Dart
		nOutput = 2;
		break;
	case 2:
		// Poison Dart
		nOutput = 7;
		break;
	case 3:
		// Piercing Dart
		nOutput = 8;
		break;
	case 4:
		// Concussion Rocket
		nOutput = 11;
		break;
	case 5:
		// Poison Rocket
		nOutput = 6;
		break;
	case 6:
		// Explosive Rocket
		nOutput = 1;
		break;
	case 7:
		// Ion Rocket
		nOutput = 10;
		break;
	case 8:
		// Plasma Rocket
		nOutput = 5;
		break;
	}
// Replacement table for if a better version of what we rolled is available
if( nItemLevel >= 10 && nOutput == 2 ) nOutput = 9; // Tranquilizer Dart --> Paralysis Dart
if( nItemLevel >= 10 && nOutput == 6 ) nOutput = 4; // Poison Dart --> Kyber Dart
if( nItemLevel >= 10 && nOutput == 8 ) nOutput = 3; // Piercing Dart --> Buster Rocket

return nOutput;

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
	
	JC 2019-02-12                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDisposableLateGame(int nItemLevel) {

int nRoll = Random(100);
int nOutput;
if( nRoll < 15 ) nOutput = LOOT_GetStimSubtype(LOOT_STIM_SUBTYPE_DRUGS);
else if( nRoll < 30 ) nOutput = LOOT_GetShieldSubtype();
else if( nRoll < 60 ) nOutput = LOOT_GetGrenadeSubtype(nItemLevel);
else nOutput = LOOT_MEDPAC;

return nOutput;

}


////////////////////////////////////////////////////////////////////////////////
//	ITEM TEMPLATES
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetItemPrefix()
	
	Returns a string for item templates, without the suffix for the item
	variation number.
	
	JC 2019-02-19                                                             */
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
	case 153: return "vibrocutter";
	case 154: return "guidonbeacon";
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
	case 411: return "a_light_";
	case 421: return "a_medium_";
	case 431: return "a_heavy_";
	case 441: return "a_robe_";
	case 511: return "d_utility_";
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
	- nItemType: Type of item (LOOT_* item classifications)
	
	JC 2019-02-18                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetTreasureSpecific(int nItemLevel, int nItemType = 0) {

// Cap the item level to avoid incidents
if( nItemLevel > 30 ) nItemLevel = 30;

int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
int nRange = 1;
int nRoll = 0;
int nResult = 0;
string sTemplate = "";
// If we're outside the specific outside range, reset the item type
if( nItemType < 0 || nItemType >= 900 ) nItemType = 0;
// If the item class isn't known, we randomly generate it
if( nItemType == 0 ) {
	// Player shouldn't find armor early on when they're meant to be naked
	if( nItemLevel < 4 ) nRange = 3;
	// Droid items and disposables aren't included in random loot
	else nRange = 4;
	// Roll for item class
	nResult = 100 * ( Random(nRange) + 1 );
	// Equipment more common, upgrades less common
	if( nResult == LOOT_CLASS_UPGRADES & Random(2) == 1 ) {
		nResult = LOOT_CLASS_EQUIPMENT;
		}
	// Now that the item class is known, return to top
	sTemplate = GetTreasureSpecific(nItemLevel, nResult);
	}
else {
	// Item class is known, but the item type isn't
	if( nItemType % 100 == 0 ) {
		switch( nItemType ) {
			// Weapons
			case 100:
				// Only Peragus weapons on Peragus
				if( GetStringRight(GetModuleName(), 3) == "PER" ) {
					nResult = LOOT_WEAPON_TYPE_PERAGUS;
					}
				// Lightsabers aren't included in random loot
				else {
					nRange = 3;
					}
				break;
			// Upgrades
			case 200:
				// No lightsaber upgrades if item level < 6 or PC level < 10
				if( nItemLevel < 6 || nPCLevel < 10 ) {
					nResult = LOOT_GetUpgradeType(LOOT_UPGRADE_NO_SABER);
					}
				else {
					nResult = LOOT_GetUpgradeType(LOOT_UPGRADE_ANY);
					}
				break;
			// Equipment
			case 300:
				// If the Vao Armband hasn't been found, there's a chance to
				// roll for armbands
				if( LOOT_GetUniqueFound(LOOT_ARMBAND, 0) == FALSE ) {
					nRange = 5;
					}
				// Otherwise, armbands aren't included in random loot
				else {
					nRange = 4;
					}
				break;
			// Armor
			case 400:
				// No Jedi robes on Peragus
				if( GetStringRight(GetModuleName(), 3) == "PER" ) {
					nRange = 3;
					}
				else {
					nRange = 4;
					}
				break;
			// Droid
			case 500:
				nResult = LOOT_GetDroidItemType();
				break;
				}
		// Roll for type if we don't know it yet
		if( nResult < 10 ) nResult = 10 * ( Random(nRange) + 1 );
		// Add item class if it's missing
		if( nResult < 100 ) nResult = nResult + nItemType;
		
		// Now item type is known, return to top
		sTemplate = GetTreasureSpecific(nItemLevel, nResult);
		}
	else {
		// Item class and type are known, but the item subtype isn't
		if( nItemType % 10 == 0 ) {
			switch( nItemType ) {
				// Lightsaber
				case 140:
					nResult = LOOT_GetSaberSubtype();
					break;
				// Peragus Weapons
				case 150:
					nResult = LOOT_GetPeragusWeapon();
					break;
				// Upgrade - Ranged
				case 210:
					nResult = LOOT_GetUpgradeSubtype(LOOT_UPGRADE_TYPE_RANGED);
					break;
				// Upgrade - Melee
				case 220:
					nResult = LOOT_GetUpgradeSubtype(LOOT_UPGRADE_TYPE_MELEE);
					break;
				// Upgrade - Armor
				case 230:
					nResult = LOOT_GetUpgradeSubtype(LOOT_UPGRADE_TYPE_ARMOR);
					break;
				// Upgrade - Lightsaber
				case 240:
					nResult = LOOT_GetUpgradeSubtype(LOOT_UPGRADE_TYPE_LIGHTSABER);
					break;
				// Implant
				case 340:
					nResult = LOOT_GetImplantTier(nItemLevel);
					break;
				// Armband
				case 350:
					// If the Vao Armband has already been found, redirect to
					// another equipment item
					if( LOOT_GetUniqueFound(LOOT_ARMBAND, 0) == TRUE ) {
						nResult = LOOT_CLASS_EQUIPMENT + ( 10 * Random(4) );
						}
					else {
						nResult = 1;
						}
					break;
				// Droid Shield
				case 540:
					nResult = LOOT_GetDroidShieldSubtype();
					break;
				// Everything else has only 1 thing per thing
				default:
					nResult = 1;
					break;
				}
			// Convert to full item type if it's not one yet
			if( nResult < 100 ) nResult = nItemType + nResult;
			
			// Entire item type known, return to top
			sTemplate = GetTreasureSpecific(nItemLevel, nResult);
			}
		// Item class, type, & subtype known, generate variation
		else {
			switch( nItemType ) {
				// Blaster Pistol
				case 111:
					nResult = LOOT_GetPistolNum(nItemLevel);
					break;
				// Blaster Rifle
				case 121:
					nResult = LOOT_GetRifleNum(nItemLevel);
					break;
				// Melee
				case 131:
					nResult = LOOT_GetMeleeNum(nItemLevel);
					break;
				// Lightsaber - Standard
				case 141:
					nResult = LOOT_GetSaberColor(nItemLevel);
					break;
				// Lightsaber - Short
				case 142:
					nResult = LOOT_GetSaberColor(nItemLevel);
					break;
				// Lightsaber - Double-Bladed
				case 143:
					nResult = LOOT_GetSaberColor(nItemLevel);
					break;
				// Mining Laser
				case 151:
					nResult = 0;
					break;
				// Advanced Mining Laser
				case 152:
					nResult = 0;
					break;
				// Vibrocutter
				case 153:
					nResult = 0;
					break;
				// Guidon Beacon
				case 154:
					nResult = 0;
					break;
				// Upgrade - Ranged - Targeting Scope
				case 211:
					nResult = LOOT_GetUpgradeNum(nItemLevel, LOOT_UPGRADE_R_TARGETING_SCOPE);
					break;
				// Upgrade - Ranged - Firing Chamber
				case 212:
					nResult = LOOT_GetUpgradeNum(nItemLevel, LOOT_UPGRADE_R_FIRING_CHAMBER);
					break;
				// Upgrade - Ranged - Power Pack
				case 213:
					nResult = LOOT_GetUpgradeNum(nItemLevel, LOOT_UPGRADE_R_POWER_PACK);
					break;
				// Upgrade - Melee - Grip
				case 221:
					nResult = LOOT_GetUpgradeNum(nItemLevel, LOOT_UPGRADE_M_GRIP);
					break;
				// Upgrade - Melee - Edge
				case 222:
					nResult = LOOT_GetUpgradeNum(nItemLevel, LOOT_UPGRADE_M_EDGE);
					break;
				// Upgrade - Melee - Energy Cell
				case 223:
					nResult = LOOT_GetUpgradeNum(nItemLevel, LOOT_UPGRADE_M_ENERGY_CELL);
					break;
				// Upgrade - Overlay
				case 231:
					nResult = LOOT_GetUpgradeNum(nItemLevel, LOOT_UPGRADE_A_OVERLAY);
					break;
				// Upgrade - Underlay
				case 232:
					nResult = LOOT_GetUpgradeNum(nItemLevel, LOOT_UPGRADE_A_UNDERLAY);
					break;
				// Upgrade - Lightsaber - Emitter
				case 241:
					nResult = LOOT_GetUpgradeNum(nItemLevel, LOOT_UPGRADE_L_EMITTER);
					break;
				// Upgrade - Lightsaber - Lens
				case 242:
					nResult = LOOT_GetUpgradeNum(nItemLevel, LOOT_UPGRADE_L_LENS);
					break;
				// Upgrade - Lightsaber - Energy Cell
				case 243:
					nResult = LOOT_GetUpgradeNum(nItemLevel, LOOT_UPGRADE_L_ENERGY_CELL);
					break;
				// Upgrade - Lightsaber - Power Crystal
				case 244:
					nResult = LOOT_GetPowerCrystalNum(nItemLevel);
					break;
				// Upgrade - Lightsaber - Color Crystal
				case 245:
					nResult = LOOT_ColorCrystalNum(LOOT_GetSaberColor(nItemLevel));
					break;
				// Belt
				case 311:
					nResult = LOOT_GetBeltNum(nItemLevel);
					break;
				// Gloves
				case 321:
					nResult = LOOT_GetGloveNum(nItemLevel);
					break;
				// Headgear
				case 331:
					nResult = LOOT_GetHeadgearNum(nItemLevel);
					break;
				// Implant Level 1
				case 341:
					nResult = LOOT_GetImplantNum(nItemLevel);
					break;
				// Implant Level 2
				case 342:
					nResult = LOOT_GetImplantNum(nItemLevel);
					break;
				// Implant Level 3
				case 343:
					nResult = LOOT_GetImplantNum(nItemLevel);
					break;
				// Implant Level 4
				case 344:
					nResult = LOOT_GetImplantNum(nItemLevel);
					break;
				// Armband
				case 351:
					// Vao Armband is the only possible armband
					sTemplate = "a_band_x02";
					break;
				// Light Armor
				case 411:
					nResult = LOOT_GetLightArmorNum(nItemLevel);
					break;
				// Medium Armor
				case 421:
					nResult = LOOT_GetMediumArmorNum(nItemLevel);
					break;
				// Heavy Armor
				case 431:
					nResult = LOOT_GetHeavyArmorNum(nItemLevel);
					break;
				// Robes
				case 441:
					nResult = LOOT_GetRobeNum(nItemLevel);
					break;
				// Droid Interface
				case 511:
					nResult = LOOT_GetDroidInterfaceNum(nItemLevel);
					break;
				// Droid Utility
				case 521:
					nResult = LOOT_GetDroidUtilityNum(nItemLevel);
					break;
				// Droid Armor
				case 531:
					nResult = LOOT_GetDroidArmorNum(nItemLevel);
					break;
				// Droid Shield - Energy
				case 541:
					nResult = LOOT_GetDroidShieldNum(nItemLevel, nItemType);
					break;
				// Droid Shield - Enviro
				case 542:
					nResult = LOOT_GetDroidShieldNum(nItemLevel, nItemType);
					break;
				// Droid Device
				case 551:
					nResult = LOOT_GetDroidDeviceNum(nItemLevel);
					break;
				}

			// If we don't have a template string yet, add the item prefix and
			// number to get our template.
			if( sTemplate == "" ) sTemplate = GetItemPrefix(nItemType) + LOOT_Suffix(nResult);
			}
		}
	}

return sTemplate;

}


////////////////////////////////////////////////////////////////////////////////
/*	GetBundlePrefix
	
	Generates the exact treasure blob for a bundle of disposable items.	A
	treasure blob encodes both the item template and the amount of items in a
	single string.
	
	e.g. 3 thermal detonators will output as: g_w_thermldet01[0003]
	
	- nItemLevel: Item level determining the quality of the items we can get
	- nItemType: Type of item (LOOT_* item classifications, disposable only)
	
	JC 2019-02-18                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetBundlePrefix(int nItemLevel, int nItemType) {

// Limited selection late in the game
if( LOOT_IsLateGame() == TRUE ) nItemType = LOOT_GetDisposableLateGame(nItemLevel);
// Legacy support to filter out scrubbed rocket IDs, just in case
if( nItemType == 992 ||
	nItemType == 993 ||
	nItemType == 994 ||
	nItemType == 995 ) {
	nItemType = LOOT_ROCKET;
	}

string sTemplate = "";
string sPrefix = "";
int nItemNum = 1;
int nItemQuantity = 1; // default to 1 item
switch( nItemType) {
	// Credits
	case 911:
		sTemplate = "g_i_credits015";
	    nItemQuantity = Random(10 * nItemLevel) + Random(50) + 20;
		break;
	// Components
	case 921:
		sTemplate = "compont_00001";
		nItemQuantity = Random(nItemLevel) + Random(nItemLevel) + 1;
		break;
	// Chemicals
	case 922:
		sTemplate = "chem_00001";
		nItemQuantity = Random(nItemLevel) + Random(nItemLevel) + 1;
		break;
	// Shield - Energy
	case 931:
		sPrefix = "a_shield_";
		nItemNum = LOOT_GetShieldNum(nItemLevel, nItemType);
		nItemQuantity = LOOT_GetShieldQuantity(nItemLevel, nItemType);
		break;
	// Shield - Enviro
	case 932:
		sPrefix = "a_shield_";
		nItemNum = LOOT_GetShieldNum(nItemLevel, nItemType);
		nItemQuantity = LOOT_GetShieldQuantity(nItemLevel, nItemType);
		break;
	// Shield - Melee
	case 933:
		sPrefix = "a_shield_";
		nItemNum = LOOT_GetShieldNum(nItemLevel, nItemType);
		nItemQuantity = LOOT_GetShieldQuantity(nItemLevel, nItemType);
		break;
	// Medpac
	case 941:
		sPrefix = "g_i_medeqpmnt";
		nItemNum = LOOT_GetMedpacTier(nItemLevel);
		break;
	// Repair Kit
	case 942:
		sPrefix = "g_i_drdrepeqp0";
		nItemNum = LOOT_GetMedpacTier(nItemLevel);
		break;
	// Stim - Constitution
	case 951:
		sPrefix = "g_i_adrnaline0";
		nItemNum = LOOT_GetStimNum(nItemLevel, nItemType);
		break;
	// Stim - Dexterity
	case 952:
		sPrefix = "g_i_adrnaline0";
		nItemNum = LOOT_GetStimNum(nItemLevel, nItemType);
		break;
	// Stim - Strength
	case 953:
		sPrefix = "g_i_adrnaline0";
		nItemNum = LOOT_GetStimNum(nItemLevel, nItemType);
		break;
	// Extra Medpacs
	case 954:
		sPrefix = "g_i_medeqpmnt";
		nItemNum = LOOT_GetMedpacTier(nItemLevel);
		break;
	// Stim - Battle
	case 955:
		sPrefix = "g_i_cmbtshot0";
		nItemNum = LOOT_GetStimNum(nItemLevel, nItemType);
		break;
	// Extra Credits
	case 961:
		sTemplate = "g_i_credits015";
		nItemQuantity = Random(2 * nItemLevel) + Random(50) + 10;
		break;
	// Grenade - Adhesive
	case 971:
		sTemplate = "g_w_adhsvgren001";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	// Grenade - Concussion
	case 972:
		sTemplate = "g_w_stungren01";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	// Grenade - CryoBan
	case 973:
		sTemplate = "g_w_cryobgren001";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	// Grenade - Thermal Detonator
	case 974:
		sTemplate = "g_w_thermldet01";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	// Grenade - Plasma
	case 975:
		sTemplate = "g_w_firegren001";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	// Grenade - Ion
	case 976:
		sTemplate = "g_w_iongren01";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	// Grenade - Poison
	case 977:
		sTemplate = "g_w_poisngren01";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	// Grenade - Sonic
	case 978:
		sTemplate = "g_w_sonicgren01";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	// Grenade - Frag
	case 979:
		sTemplate = "g_w_fraggren01";
		nItemQuantity = LOOT_GetGrenadeQuantity(nItemLevel, nItemType);
		break;
	// Parts
	case 981:
		sTemplate = "g_i_parts01";
		break;
	// Computer Spikes
	case 982:
		sTemplate = "g_i_progspike01";
		break;
	// Security Spikes
	case 983:
		sPrefix = "g_i_secspike";
		nItemNum = LOOT_GetSecSpikeTier(nItemLevel);
		break;
	// Rockets
	case 991:
		sPrefix = "w_rocket_";
		nItemNum = LOOT_GetRocketNum(nItemLevel);
		break;
}
// If we don't have a template string yet, add the item prefix and number to get
// our template.
if( sTemplate == "" ) sTemplate = sPrefix + LOOT_Suffix(nItemNum);

return sTemplate + SWTR_GetQuantity(nItemQuantity);

}


////////////////////////////////////////////////////////////////////////////////
/*	GetTreasureBundle()
	
	Generates template string for disposable items.
	
	- nItemLevel: Item level determining the quality of the items we can get
	- nItemType: Type of item (LOOT_* item classifications, disposable only)
	
	JC 2019-02-18                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetTreasureBundle(int nItemLevel, int nItemType = 0) {

// Cap the item level to avoid incidents
if( nItemLevel > 30 ) nItemLevel = 30;
// Limited selection late in the game
if( LOOT_IsLateGame() == TRUE ) nItemType = LOOT_GetDisposableLateGame(nItemLevel);

int nRange = 1;
int nRoll = 0;
int nResult = 0;
string sTemplate = "";
// If we aren't in the disposable range, set the item class to disposable items
if( nItemType < 900 || nItemType >= 1000 ) {
	sTemplate = GetTreasureBundle(nItemLevel, LOOT_CLASS_DISPOSABLE);
	}
else {
	// Item class is known, but the item type isn't
	if( nItemType % 100 == 0 ) {
		// Limited selection early on (no skill items or grenades)
		if( GetGlobalNumber("G_PC_LEVEL") < 6 ) {
			nRange = 6;
			}
		// No rockets if no Mira
		else if( !IsAvailableCreature(NPC_MIRA) ) {
			nRange = 8;
			}
		// All access
		else {
			nRange = 9;
			}
		nResult = nItemType + ( 10 * ( Random(nRange) + 1 ) );
		
		// Now item type is known, return to top
		sTemplate = GetTreasureBundle(nItemLevel, nResult);
		}
	else {
		// Item class and type are known, but the item subtype isn't
		if( nItemType % 10 == 0 ) {
			switch( nItemType ) {
				// Components & Chemicals
				case 920:
					nRange = 2;
					break;
				// Shields
				case 930:
					nRange = 3;
					break;
				// Medical Items
				case 940:
					nRange = 2;
					break;
				// Stimulants
				case 950:
					nRange = 5;
					break;
				// Grenades
				case 970:
					nResult = LOOT_GetGrenadeSubtype(nItemLevel);
					break;
				// Everything else has only 1 thing per thing
				default:
					nResult = 1;
					break;
				}
			// Roll for subtype if we don't know it yet
			if( nResult < 1 ) nResult = Random(nRange) + 1;
			// Convert to full item type if it's not one yet
			if( nResult < 100 ) nResult = nItemType + nResult;
			
			// Entire item type known, return to top
			sTemplate = GetBundlePrefix(nItemLevel, nResult);
			}
		// Item class, type, & subtype known, generate template
		else {
			sTemplate = GetBundlePrefix(nItemLevel, nItemType);
			}
		}
	}				

return sTemplate;

}


////////////////////////////////////////////////////////////////////////////////
/*	GetTreasureNormal()
	
	Generates a template string for an item of normal quality.
	
	- nItemLevel: Item level determining the quality of items we can get
	- nItemType: Item type (LOOT_* item classifications)
	
	JC 2019-02-18                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetTreasureNormal(int nItemLevel, int nItemType = 0) {

string sTemplate = GetTreasureSpecific(nItemLevel, nItemType);

return sTemplate;

}


////////////////////////////////////////////////////////////////////////////////
/*	GetTreasureRare()
	
	Generates a template string for an item of higher quality than the player's
	current level (+5 bonus).
	
	- nItemLevel: Item level determining the quality of items we can get
	- nItemType: Item type (LOOT_* item classifications)
	
	JC 2019-02-18                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetTreasureRare(int nItemLevel, int nItemType = 0) {

string sTemplate = GetTreasureSpecific(nItemLevel + 5, nItemType);

return sTemplate;

}


////////////////////////////////////////////////////////////////////////////////
//	ITEM PLACEMENT
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	PlaceTreasureDisposable()
	
	Places disposable items in a container.
	
	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place
	- nItemType: Type of item (LOOT_* item classifications, disposable only)
	
	JC 2019-02-18                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasureDisposable(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 900) {

if( !GetLocalBoolean(oContainer, 57) ) {
	SetLocalBoolean(OBJECT_SELF, 57, TRUE);
	int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
	// If we're not in the disposable range, reset the item type
	if( nItemType < 900 || nItemType >= 1000 ) nItemType = 0;
	// Item level is based on the player's current level
	int nItemLevel = nPCLevel + Random(6) - 4;
	if( nItemLevel < 1 ) nItemLevel = 1;
	// Loop for all items
	int i;
	for( i = 1; i <= numberOfItems; i++ ) {
		string sItem = GetTreasureBundle(nItemLevel, nItemType);
		int nItemQuantity = 1; // default to 1
		string sItemName;
		// Parse the treasure blob to separate the template and quantity
		int j = FindSubString(sItem,"[");
		if( j >= 0 ) {
				nItemQuantity = StringToInt(GetSubString(sItem, j + 1, 4));
				sItemName = GetSubString(sItem, 0 ,j);
			}
		else sItemName = sItem;
		
		//Place the item in the container
		CreateItemOnObject(sItemName, oContainer, nItemQuantity);
		}
	}

}


////////////////////////////////////////////////////////////////////////////////
/*	PlaceTreasure()
	
	Places treasure in a container.
	
	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place
	- nItemType: Type of item (LOOT_* item classifications)
	
	JC 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasure(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0) {

if( !GetLocalBoolean(oContainer, 57) ) {
	SetLocalBoolean(OBJECT_SELF, 57, TRUE);
	int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
	if( nPCLevel == 1 ) nPCLevel = 2; // Increases variety of items found at level 1
	int nRoll;
	int i;
	for( i = 1; i <= numberOfItems; i++ ) {
		// Item level is based on the player's current level
		int nItemLevel = nPCLevel + Random(8) - 5;
		if( nItemLevel < 1 ) nItemLevel = 1;
		// Random number determines chance of getting a rare or disposable item
		int nRandom = Random(100);
		// If an item type was specified, roll at least a 90
		// (this excludes disposable items later)
		if( nItemType > 0 && nItemType < 900 && nRandom < 90 ) nRandom = 90;
		// Rare item chance
		// Base score of 90-94 + the current global value vs DC 100
		if( nRandom > 94 ) nRandom = 90 + ( Random(20) / 4 );
		int nRoll = nRandom + GetGlobalNumber("000_RareItemChance");
		// Determine item template & quantity
		string sItem;
		string sItemName;
		int nItemQuantity = 1;
		if( nRoll >= 100 ) {
			// We found a rare item!
			sItem = GetTreasureRare(nItemLevel, nItemType);
			// Reset the probability for next time
			SetGlobalNumber("000_RareItemChance", 0);
			}
		else {
			// We didn't roll a rare item
			// Increase the chance of getting one next time
			IncrementGlobalNumber("000_RareItemChance", 3);
			// 90% chance of getting a disposable item (if applicable)
			if( nRoll < 90 ) {
				sItem = GetTreasureBundle(nItemLevel, nItemType);
				}
			// Otherwise, we get a normal item
			else {
				sItem = GetTreasureNormal(nItemLevel, nItemType);
				}
			}
		// Parse the treasure blob to separate the template and quantity
		int j = FindSubString(sItem,"[");
		if( j >= 0 ) {
			nItemQuantity = StringToInt(GetSubString(sItem, j + 1, 4));
			sItemName = GetSubString(sItem, 0, j);
			}
		else sItemName = sItem;
		// Make sure robes match the area's alignment
		int nAlignment = LOOT_GetAreaAlignment();
		if( nAlignment != 50 &&
			GetSubString(sItemName, 0, GetStringLength(sItemName) - 2) == GetItemPrefix(LOOT_ROBES) ) {
			sItemName = LOOT_AlignmentRobe(sItemName, nAlignment);
			}
			
		// Place the item in the container
		CreateItemOnObject(sItemName, oContainer, nItemQuantity);
		}
	}

}


////////////////////////////////////////////////////////////////////////////////
/*	PlaceCritterTreasure()
	
	Places treasure on a creature.
	
	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place
	- nItemType: Type of item (LOOT_* item classifications)
	
	JC 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceCritterTreasure(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0) {

object oContainer = OBJECT_SELF;
int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
if( nPCLevel == 1 ) nPCLevel = 2; // Increases variety of items found at level 1
int nRoll;
int i;
for( i = 1; i <= numberOfItems; i++ ) {
	// Item level is based on the player's current level
	int nItemLevel = nPCLevel + Random(8) - 5;
	if( nItemLevel < 1 ) nItemLevel = 1;
	// Random number determines chance of getting a rare or disposable item
	int nRandom = Random(100);
	// If an item type was specified, roll at least a 90
	// (this excludes disposable items later)
	if( nItemType > 0 && nItemType < 900 && nRandom < 90 ) nRandom = 90;
	// Rare item chance
	// Base score of 90-94 + the current global value vs DC 100
	if( nRandom > 94 ) nRandom = 90 + ( Random(20) / 4 );
	int nRoll = nRandom + GetGlobalNumber("000_RareItemChance");
	// Determine item template & quantity
	string sItem;
	string sItemName;
	int nItemQuantity = 1;
	if( nRoll >= 100 ) {
		// We found a rare item!
		sItem = GetTreasureRare(nItemLevel, nItemType);
		// Reset the probability for next time
		SetGlobalNumber("000_RareItemChance", 0);
		}
	else {
		// We didn't roll a rare item
		// Increase the chance of getting one next time
		IncrementGlobalNumber("000_RareItemChance", 3);
		// 90% chance of getting a disposable item (if applicable)
		if( nRoll < 90 ) {
			sItem = GetTreasureBundle(nItemLevel, nItemType);
			}
		// Otherwise, we get a normal item
		else {
			sItem = GetTreasureNormal(nItemLevel, nItemType);
			}
		}
	// Parse the treasure blob to separate the template and quantity
	int j = FindSubString(sItem,"[");
	if( j >= 0 ) {
		nItemQuantity = StringToInt(GetSubString(sItem, j + 1, 4));
		sItemName = GetSubString(sItem, 0, j);
		}
	else sItemName = sItem;
	// Make sure robes match a creature's alignment
	if( GetObjectType(oContainer) == OBJECT_TYPE_CREATURE &&
		GetSubString(sItemName, 0, GetStringLength(sItemName) - 2) == GetItemPrefix(LOOT_ROBES) ) {
		sItemName = LOOT_AlignmentRobe(sItemName, GetGoodEvilValue(oContainer));
		}
	
	// Place the item in the container
	CreateItemOnObject(sItemName, oContainer, nItemQuantity);
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
	
	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place
	
	JC 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasureJedi(object oContainer = OBJECT_SELF, int numberOfItems = 1) {

int nRoll;
int nItemType;
int i;
for ( i = 1; i <= numberOfItems; i++ ) {
	// Increase chance of rare items for Jedi loot
	IncrementGlobalNumber("000_RareItemChance", 3);
	// Roll for item type
	nRoll = Random(10) + 1;
	if( nRoll == 1 ) nItemType = LOOT_UPGRADE_TYPE_LIGHTSABER;
	else if( nRoll == 2 ) nItemType = LOOT_UPGRADE_L_POWER_CRYSTAL;
	else if( nRoll == 3 ) nItemType = LOOT_ROBES;
	else if( nRoll == 4 ) nItemType = LOOT_CLASS_EQUIPMENT;
	else nItemType = LOOT_CLASS_DISPOSABLE;
	
	// Place the Treasure
	PlaceCritterTreasure(oContainer, 1, nItemType);
	}
}


////////////////////////////////////////////////////////////////////////////////
/*	PlaceTreasureDroid()
	
	Places Droid-themed treasure.
	
	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place
	- nItemType: Type of item (LOOT_* item classifications, droid items only)
	
	JC 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasureDroid(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0) {

PlaceTreasure(oContainer, numberOfItems, 500);

}


////////////////////////////////////////////////////////////////////////////////
/*	PlaceTreasurePeragus()
	
	Places treasure on Peragus.
	
	12% chance equipment
	5% chance Peragus weapons
	3% chance armor underlays	   
	Rare items more likely
	
	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place
	- nItemType: Type of item (LOOT_* item classifications)
	
	JC 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasurePeragus(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0) {

int nRoll = Random(100) + GetGlobalNumber("000_RareItemChance");

// If the input item type is valid, use it
if( nItemType / 100 == 3 ||
	nItemType / 10 == 15 ||
	nItemType == LOOT_UPGRADE_A_UNDERLAY ) {
	PlaceTreasure(oContainer, numberOfItems, nItemType);
	}
// Otherwise, roll for item type
if( nRoll >= 88 ) {
	PlaceTreasure(oContainer, numberOfItems, LOOT_CLASS_EQUIPMENT);
	}
else if( nRoll >= 83 ) {
	PlaceTreasure(oContainer, numberOfItems, LOOT_WEAPON_TYPE_PERAGUS);
	}
else if( nRoll >= 80 ) {
	PlaceTreasure(oContainer, numberOfItems, LOOT_UPGRADE_A_UNDERLAY);
	}
else {
	IncrementGlobalNumber("000_RareItemChance", 3);
	PlaceTreasureDisposable(oContainer, numberOfItems);
	}

}