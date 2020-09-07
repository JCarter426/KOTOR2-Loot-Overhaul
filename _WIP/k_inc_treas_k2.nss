////////////////////////////////////////////////////////////////////////////////
/*	LOOT OVERHAUL

	k_inc_treas_k2

	Header file for random loot.

	JC 2020-09-07                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_q_crystal"
#include "k_inc_treasure"


////////////////////////////////////////////////////////////////////////////////
//	CONFIGURATION
////////////////////////////////////////////////////////////////////////////////

// Sets how many saber colors to add to the base amount. This is here to add
// support for the cut bronze color, but it will work for more if they stick to
// the naming scheme.
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
		* 153 Vibrocutter
		* 154 Guidon Beacon

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
		* 431 Heavy ARmor
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

int LOOT_DicePool(int nNumDice, int nDiceSize);
int LOOT_DiceResult(int nItemLevel, int nDiceType);
string LOOT_Suffix(int nItemNum);
int LOOT_IsLateGame();
int LOOT_GetAreaAlignment();
int LOOT_UniqueItemID(int nItemType, int nItemNum);
string LOOT_UniqueItemTag(int nItemType, int nItemNum);
string LOOT_UniqueGlobal(int nItemType);
int LOOT_GetUniqueGlobalState(int nItemType);
int LOOT_GetUniqueFound(int nItemType, int nItemNum);
void LOOT_SetUniqueFound(int nItemType, int nItemNum, int nState);
int LOOT_GetPistolNum(int nItemLevel);
int LOOT_GetRifleNum(int nItemLevel);
int LOOT_GetMeleeNum(int nItemLevel);
int LOOT_GetSaberSubtype();
int LOOT_GetSaberColor(int nItemLevel, int nColorType = 0);
int LOOT_HasUpgradeSaber();
int LOOT_GetPeragusWeapon();
int LOOT_GetUpgradeType(int nFilter = 0);
int LOOT_GetUpgradeSubtype(int nItemType, int nFilter = 0);
int LOOT_ColorCrystalNum(int nInput);
int LOOT_GetPowerCrystalNum(int nItemLevel);
int LOOT_GetUpgradeNum(int nItemLevel, int nItemType, int nItemTier = 0);
int LOOT_GetBeltNum(int nItemLevel);
int LOOT_GetGloveNum(int nItemLevel);
int LOOT_GetHeadgearNum(int nItemLevel);
int LOOT_GetImplantTier(int nItemLevel);
int LOOT_GetImplantNum(int nItemLevel);
int LOOT_GetLightArmorNum(int nItemLevel);
int LOOT_GetMediumArmorNum(int nItemLevel);
int LOOT_GetHeavyArmorNum(int nItemLevel);
int LOOT_GetRobeNum(int nItemLevel);
string LOOT_AlignmentRobe(string sItemName, int nAlignment);
int LOOT_GetDroidItemType();
int LOOT_GetDroidInterfaceNum(int nItemLevel);
int LOOT_GetDroidUtilityNum(int nItemLevel);
int LOOT_GetDroidArmorNum(int nItemLevel);
int LOOT_GetDroidShieldSubtype();
int LOOT_GetDroidShieldTier(int nItemLevel);
int LOOT_GetDroidShieldNum(int nItemLevel, int nItemType = 0, int nItemTier = 0);
int LOOT_GetDroidDeviceNum(int nItemLevel);
int LOOT_GetShieldSubtype();
int LOOT_GetShieldTier(int nItemLevel);
int LOOT_GetShieldNum(int nItemLevel, int nItemType = 0, int nItemTier = 0);
int LOOT_GetShieldQuantity(int nItemLevel, int nItemType, int nItemTier = 0);
int LOOT_GetMedpacTier(int nItemLevel);
int LOOT_GetStimSubtype(int nFilter);
int LOOT_GetStimTier(int nItemLevel);
int LOOT_GetStimNum(int nItemLevel, int nItemType = 0, int nItemTier = 0);
int LOOT_GetGrenadeSubtype(int nItemLevel);
int LOOT_GetGrenadeQuantity(int nItemLevel, int nItemType);
int LOOT_GetSecSpikeTier(int nItemLevel);
int LOOT_GetRocketNum(int nItemLevel);
int LOOT_GetDisposableLateGame(int nItemLevel);
string GetItemPrefix(int nItemType);
string GetTreasureSpecific(int nItemLevel, int nItemType = 0);
string GetBundlePrefix(int nItemLevel, int nItemType);
string GetTreasureBundle(int nItemLevel, int nItemType = 0);
string GetTreasureNormal(int nItemLevel, int nItemType = 0);
string GetTreasureRare(int nItemLevel, int nItemType = 0);
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
/*	LOOT_DicePool()

	Rolls a number of dice and outputs the sum of all rolls.

	- nNumDice: Number of dice to roll
	- nDiceSize: How many sides each die has (d6, d8, d20, etc)

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_DicePool(int nNumDice, int nDiceSize) {
	int nScore = 0;
	int i;

	for( i = 1; i <= nNumDice; ++i )
		nScore += Random(nDiceSize) + 1;

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

	 * 0 - No bell curve, no dice pool used. Instead, the item level determines
		   the die size (up to 1d30) and everything that can be rolled has equal
		   chances.
	 * 1 - Mild bell curve, 2d30. Probabilities range from approximately 1.5% to
		   5% at max level.
	 * 2 - Moderate bell curve, 6d10. Probabilities range from approximately 1%
		   to 6.5% at max level.
	 * 3 - Extreme bell curve, 10d6. Probabilities range from approximately 0.5%
		   to 7.5% at max level.

	This allows for different types of items to have probability distributions
	that suit them. For some types, the higher-numbered items are definitely
	better,	so we want an extreme distribution that favors items of our level.
	n other	cases, though, the lower-numbered items may not be so bad, or there
	may be an advantage to having a variety of items rather than copies of one;
	here, a less extreme distribution may be more appropriate.

	- nItemLevel: Item level determining the quality of the items we can get
	- nDiceType:  What sort of dice to roll, determining probability distribution
				  (0 to 3)

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_DiceResult(int nItemLevel, int nDiceType) {
	if( nItemLevel < 1 )
		nItemLevel = 1;

	int nNumDice;
	int nDiceSize;
	int nRange;
	int nDicePool;
	int nHalfPool;
	int nMid;
	int nOffset;
	int nMin;
	int nMax;
	int nRoll;
	int nResult;

// Dice mechanic definitions
	switch( nDiceType ) {
	case 1: // Mild dice pool
		nNumDice = 3;
		nDiceSize = 20;
		break;
	case 2: // Moderate dice pool
		nNumDice = 6;
		nDiceSize = 10;
		break;
	case 3: // Extreme dice pool
		nNumDice = 10;
		nDiceSize = 6;
		break;
	default: // No dice pool
		nNumDice = 1;
		nDiceSize = 30;
		break;
	}

	// Initialize range
	nRange = nItemLevel;

	// Weighted odds for dice pools
	if( nNumDice > 1 ) {
		// Target range is (a little more than) half the size of the dice pool
		nDicePool = nNumDice * nDiceSize;
		nHalfPool = nDicePool / 2;
		if( nRange > nHalfPool )
			nRange = nHalfPool;
		// The midpoint is rounded up for odd dice pool sizes so we stay positive
		// after subtracting the offset.
		nMid = ((nDicePool + nNumDice) / 2) + (nNumDice % 2);
		// Item level offsets the min and max values of the target range
		nOffset = nItemLevel;
		if( nOffset > nMid - nNumDice )
			nOffset = nMid - nNumDice;
		nMin = nMid + 1 - nOffset;
		nMax = nMid + nHalfPool - nOffset;
		// Initial dice pool
		nRoll = LOOT_DicePool(nNumDice, nDiceSize);
		nResult = nRoll - nMin + 1;
		// We ignore any roll outside the target range and do a roll with even odds
		// that will definitely fall inside our target range if necessary
		if( nRoll < nMin || nRoll > nMax || nResult > nRange )
			return Random(nRange) + 1;
		return nResult;
	}
	// No dice pool, even odds
	else {
		if( nRange > nDiceSize )
			nRange = nDiceSize;
		return Random(nRange) + 1;
	}
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_Suffix()

	Converts an item number to a string to get the final item variation suffix.

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
string LOOT_Suffix(int nItemNum) {
	string sSuffix = IntToString(nItemNum);

	if( nItemNum == 0 )
		return "";
	if( nItemNum < 0 )
		nItemNum = 1;
	if( nItemNum < 10 )
		return "0" + sSuffix;
	if( nItemNum > 99 )
		return "x" + GetStringRight(sSuffix, 2);
	return sSuffix;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_IsLateGame()

	Checks whether it's late in the game (after boarding the Ravager).

	JC 2019-09-07                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_IsLateGame() {
	int nModPrefix = StringToInt(GetStringLeft(GetModuleName(), 2));
	
	return nModPrefix >= 85;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetAreaAlignment()

	Returns the alignment of the area we're in.
	(0 = EVIL, 50 = NEUTRAL, 100 = GOOD)

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetAreaAlignment() {
	int nModPrefix = StringToInt(GetStringLeft(GetModuleName(), 3));

	switch( nModPrefix ) {
	// Light areas
	case 204:
	case 262:
	case 601:
	case 602:
	case 604:
	case 605:
	case 610:
	case 650:
		return 100;
	// Dark areas
	case 410:
	case 411:
	case 701:
	case 702:
	case 711:
	case 851:
	case 852:
	case 901:
	case 902:
	case 903:
	case 904:
	case 905:
	case 906:
		return 0;
	}
	// Neutral
	return 50;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_UniqueItemID()

	Returns an ID for a unique item so its corresponding global can be set or
	checked.

	- int nItemType: Item type (item classifications)
	- int nItemNum: Item variation number

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
		// The Vao Armband doesn't have a proper item number, but since it's the
		// only armband in random loot, this should be ok
		nItemID = 1;
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

	- int nItemType: Item type (item classifications)
	- int nItemNum: Item variation number

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
	if( (nItemType == 111 && nAdjust == 8) &&
		LOOT_GetUniqueFound(111, 22) )
		nAdjust <<= 1;

	if( nState )
		SetGlobalNumber(sGlobal, nGlobal | nAdjust);
	else
		SetGlobalNumber(sGlobal, nGlobal & ~nAdjust);
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

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetPistolNum(int nItemLevel) {
	int nRoll = LOOT_DiceResult(nItemLevel, 3);
	
	// Replacement table for if a better version of what we rolled is available
	switch( nRoll ) {
	case 1: // Blaster Pistol --> Republic Blaster
		if( nItemLevel >= 9 )
			nRoll = 9;
		else
			break;
	case 9: // Republic Blaster --> Mandalorian Blaster
		if( nItemLevel >= 12 )
			nRoll = 12;
		break;

	case 2: // Ion Blaster --> Aratech Droid Oxidizer
		if( nItemLevel >= 10 )
			nRoll = 10;
		else
			break;
	case 10: // Aratech Droid Oxidizer --> Aratech Ionmaster
		if( nItemLevel >= 21 )
			nRoll = 21;
		break;

	case 3: // Field Survival Pistol --> Scout Enforcer
		if( nItemLevel >= 7 )
			nRoll = 7;
		else
			break;
	case 7: // Scout Enforcer --> Watchman Blaster
		if( nItemLevel >= 18 )
			nRoll = 18;
		else
			break;
	case 18: // Watchman Blaster --> Elite Watchman Blaster
		if( nItemLevel >= 27 )
			nRoll = 27;
		break;

	case 4: // Sonic Pistol --> Systech Aural Blaster
		if( nItemLevel >= 8 )
			nRoll = 8;
		else
			break;
	case 8: // Systech Aural Blaster --> Arkanian Sonic Blaster
		if( nItemLevel >= 14 )
			nRoll = 14;
		break;

	case 5: // Disruptor Pistol --> Sith Disruptor
		if( nItemLevel >= 15 )
			nRoll = 15;
		else
			break;
	case 15: // Sith Disruptor --> Mandalorian Ripper
		if( nItemLevel >= 20 )
			nRoll = 20;
		else
			break;
	case 20: // Mandalorian Ripper --> Mandalorian Disintegrator
		if( nItemLevel >= 28 )
			nRoll = 28;
		break;

	case 6: // Heavy Blaster Pistol --> Arkanian Heavy Pistol
		if( nItemLevel >= 11 )
			nRoll = 11;
		else
			break;
	case 11: // Arkanian Heavy Pistol --> Mandalorian Heavy Blaster
		if( nItemLevel >= 16 )
			nRoll = 16;
		else
			break;
	case 16: // Mandalorian Heavy Blaster --> Zabrak Heavy Blaster
		if( nItemLevel >= 24 )
			nRoll = 24;
		break;

	case 12: // Mandalorian Blaster --> Onasi Blaster
		if( nItemLevel >= 22 )
			nRoll = 22;
		else
			break;
	case 22: // *Onasi Blaster*
		// Replace with Micro-Pulse Blaster based on item level OR
		// if two have already been found
		if( nItemLevel >= 26 || LOOT_GetUniqueFound(111, -1) )
			nRoll = 26;
		else
			LOOT_SetUniqueFound(111, 22, TRUE);
		break;

	case 13: // Systech Static Blaster --> Systech Electric Blaster
		if( nItemLevel >= 25 )
			nRoll = 25;
		break;

	case 30: // *Freedon Nadd's Blaster*
		// If it was found before, replace with a random high level item
		if( LOOT_GetUniqueFound(111, nRoll) )
			nRoll = Random(6) + 24;
		else
			LOOT_SetUniqueFound(111, 30, TRUE);
		break;
	}

	return nRoll;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetRifleNum()

	Generates item variation number for blaster pistols.

	Replaces certain items when better versions are available.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetRifleNum(int nItemLevel) {
	int nRoll = LOOT_DiceResult(nItemLevel, 3);

// Replacement table for if a better version of what we rolled is available
	switch( nRoll ) {
	case 1: // Blaster Carbine --> Repeating Blaster Carbine
		if( nItemLevel >= 6 )
			nRoll = 6;
		else
			break;
	case 6: // Repeating Blaster Carbine --> Heavy Repeating Blaster Carbine
		if( nItemLevel >= 17 )
			nRoll = 17;
		break;

	case 2: // Ion Carbine --> Ion Rifle
		if( nItemLevel >= 7 )
			nRoll = 7;
		else
			break;
	case 7: // Ion Rifle --> Bothan Droid Disruptor
		if( nItemLevel >= 15 )
			nRoll = 15;
		else
			break;
	case 15: // Bothan Droid Disruptor --> Verpine Droid Disruptor
		if( nItemLevel >= 20 )
			nRoll = 20;
		else
			break;
	case 20: // Verpine Droid Disruptor --> Verpine Droid Disintegrator
		if( nItemLevel >= 29 )
			nRoll = 29;
		break;

	case 3: // Sonic Carbine --> Sonic Rifle
		if( nItemLevel >= 9 )
			nRoll = 9;
		else
			break;
	case 9: // Sonic Rifle --> Sonic Disruptor
		if( nItemLevel >= 27 )
			nRoll = 27;
		break;

	case 4: // Blaster Rifle --> Arkanian Blaster Rifle
		if( nItemLevel >= 12 )
			nRoll = 12;
		break;

	case 5: // Bowcaster --> War Bowcaster
		if( nItemLevel >= 11 )
			nRoll = 11;
		break;

	case 8: // Disruptor Carbine --> Disruptor Rifle
		if( nItemLevel >= 13 )
			nRoll = 13;
		break;

	case 10: // Repeating Blaster Rifle --> Heavy Repeating Rifle
		if( nItemLevel >= 22 )
			nRoll = 22;
		else
			break;
	case 22: // Heavy Repeating Rifle --> Mandalorian Heavy Repeater
		if( nItemLevel >= 26 )
			nRoll = 26;
		break;

	case 14: // Argazdan Riot Buster --> Slavemaster Stun Carbine
		if( nItemLevel >= 25 )
			nRoll = 25;
		break;
	}

	return nRoll;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetMeleeNum()

	Generates item variation number for melee weapons.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetMeleeNum(int nItemLevel) {
	int nRoll = LOOT_DiceResult(nItemLevel, 3);

// Replacement table for if a better version of what we rolled is available
	switch( nRoll ) {
	case 1: // Short Sword --> Vibroblade
		if( nItemLevel >= 5 )
			nRoll = 5;
		else
			break;
	case 5: // Vibroblade --> Zabrak Vibroblade
		if( nItemLevel >= 10 )
			nRoll = 10;
		break;

	case 2: // Long Sword --> Vibrosword
		if( nItemLevel >= 6 )
			nRoll = 6;
		else
			break;
	case 6: // Vibrosword --> Echani Vibrosword
		if( nItemLevel >= 21 )
			nRoll = 21;
		break;

	case 3: // Energy Baton --> Exchange Negotiator
		if( nItemLevel >= 8 )
			nRoll = 8;
		else
			break;
	case 8: // Exchange Negotiator --> Gand Silencer
		if( nItemLevel >= 18 )
			nRoll = 18;
		else
			break;
	case 18: // Gand Silencer --> Gand Discharger
		if( nItemLevel >= 29 )
			nRoll = 29;
		break;

	case 4: // Quarterstaff --> Force Pike
		if( nItemLevel >= 14 )
			nRoll = 14;
		else
			break;
	case 14: // Force Pike --> Gand Shockstaff
		if( nItemLevel >= 23 )
			nRoll = 23;
		break;

	case 7: // Double-Bladed Sword --> Vibro Double-Blade
		if( nItemLevel >= 15 )
			nRoll = 15;
		break;

	case 11: // Rodian Blade --> Rodian Death Blade
		if( nItemLevel >= 17 )
			nRoll = 17;
		break;

	case 12: // Sith War Sword --> Sith Tremor Sword
		if( nItemLevel >= 22 )
			nRoll = 22;
		break;

	case 30: // *Freyyr's Warblade*
		// If it was found before, replace with a random high level item
		if( LOOT_GetUniqueFound(131, nRoll) )
			nRoll = Random(10) + 20;
		else
			LOOT_SetUniqueFound(131, 30, TRUE);
		break;
	}

	return nRoll;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetSaberSubtype()

	Determines lightsaber subtype (STANDARD, SHORT, or DOUBLE-BLADED).

	Standard lightsabers are more common than short and double-bladed, with a
	3:1:1 ratio.

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetSaberSubtype() {
	int nRoll = Random(5);

	if( nRoll == 4 )
		return 143; // Double-Bladed Lightsaber
	if( nRoll == 3 )
		return 142; // Short Lightsaber
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
	* 7 = BRONZE (extra color #1)
	* 8 = ORANGE
	* 9 = SILVER
	* 10 = CYAN
	* 11 = VIRIDIAN

	And if more extra colors are added, this will return 12+ without any more
	weird rules. 12 = extra color #2, etc.

	- nItemLevel: Item level determining the quality of the items we can get
	- nColorType: Which color algorithm to use
	  * -1: ANY
	  *  0: WEIGHTED
	  *  1: COMMON
	  2  2: RARE

	JC 2019-08-02                                                             */
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
		nColor = Random(4 + EXTRA_SABER_COLORS) + 6;
	// Roll for even odds
	else
		nColor = Random(9 + EXTRA_SABER_COLORS) + 1;
	
	// Get the real number
	// No #6 (Malak's saber). No #7 (bronze) if no extra saber colors are used.
	if( nColor >= 6 ) {
		if( EXTRA_SABER_COLORS < 1 )
			return nColor + 2;
		return nColor + 1;
	}
	return nColor;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_HasUpgradeSaber()

	Returns true if the player has completed the "Crafting a Lightsaber" quest
	with Bao-Dur, or if they have a lightsaber in their inventory.

	Visas Marr's Lightsaber and Freedon Nadd's Short Lightsaber are excluded
	from the check,	as they cannot be upgraded.

	JC 2019-08-02                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_HasUpgradeSaber() {
	int nOutput = FALSE;
	object oItem;

	if( GetJournalEntry("LightsaberQuest") >= 50 )
		return TRUE;
	oItem = GetFirstItemInInventory(GetFirstPC());
	while( oItem != OBJECT_INVALID ) {
		if( (GetBaseItemType(oItem) == BASE_ITEM_LIGHTSABER ||
			GetBaseItemType(oItem) == BASE_ITEM_SHORT_LIGHTSABER ||
			GetBaseItemType(oItem) == BASE_ITEM_LIGHTSABER) &&
			GetTag(oItem) != "w_ls_x01" &&
			GetTag(oItem) != "w_sls_x02" )
			return TRUE;
		oItem = GetNextItemInInventory(GetFirstPC());
	}
	return FALSE;
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

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetPeragusWeapon() {
	int nRoll = Random(6);

	switch( nRoll ) {
	case 0:
	case 1:
		return 151; // Mining Laser
	case 2:
	case 3:
		return 152; // Advanced Mining Laser
	case 4:
		return 153; // Vibrocutter
	case 5:
		return 154; // Guidon Beacon
	}
	return 151;
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

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_ColorCrystalNum(int nInput) {
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

	JC 2019-08-03                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetPowerCrystalNum(int nItemLevel) {
	// Power crystals have 25 variations
	if( nItemLevel > 25 )
		nItemLevel = 25;

	int nRoll = LOOT_DiceResult(nItemLevel, 1);
	
	// Replace the Solari Crystal if it's been found before
	if( nRoll == 21 ) {
		if( LOOT_GetUniqueFound(244, 21) ) {
			nRoll = LOOT_DiceResult(nItemLevel - 1, 1);
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

	JC 2019-08-02                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetUpgradeNum(int nItemLevel, int nItemType, int nItemTier) {
	int nNumTiers;
	int nItemsPerTier;
	int nItemID;
	int nNumItems;
	int nItemScale;
	
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
		if( nNumItems == 30 )
			nItemScale = nItemLevel;
		else if( 30 % nNumItems == 0 )
			nItemScale = (nItemLevel + (30 / nNumItems) - 1) / (30 / nNumItems);
		else if( nNumItems < 30 )
			nItemScale = ((nItemLevel * nNumItems) + 30 - nNumItems) / 30;
		else
			nItemScale = (nItemLevel * nNumItems) / 30;
		nItemTier = (nItemScale + nItemsPerTier - 1) / nItemsPerTier;
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

	Generates item variation number for belts.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetBeltNum(int nItemLevel) {
	int nRoll = LOOT_DiceResult(nItemLevel, 3);
	
	// Replacement table for if a better version of what we rolled is available
	switch( nRoll ) {
	case 1: // Adrenaline Amplifier --> Avanced Adrenaline Amplifier
		if( nItemLevel >= 5 )
			nRoll = 5;
		else
			break;
	case 5: // Advanced Adrenaline Amplifier --> Hyper Adrenaline Amplifier
		if( nItemLevel >= 9 )
			nRoll = 9;
		break;

	case 2: // Cardio-Regulator --> Systech Cardio-Regulator
		if( nItemLevel >= 8 )
			nRoll = 8;
		else
			break;
	case 8: // Systech Cardio-Regulator --> Aratech Cardio-Regulator
		if( nItemLevel >= 25 )
			nRoll = 25;
		break;

	case 3: // Stealth Field Generator
		if( nItemLevel >= 6 ) {
			// Stealth Field Generator --> Exchange Shadow Caster
			if( nItemLevel >= 10 && Random(2) == 0 )
				nRoll = 10;
			// Stealth Field Generator --> Aratech SD Belt
			else
				nRoll = 6;
		}
		break;

	case 4: // Czerka Utility Belt --> Tech Specialist Belt
		if( nItemLevel >= 24 )
			nRoll = 24;
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
		break;

	case 9: // Hyper Adrenaline Amplifier --> Adrenaline Stimulator
		if( nItemLevel >= 18 )
			nRoll = 18;
		break;

	case 14: // Eriadu Stealth Unit --> Defel Mimicker
		if( nItemLevel >= 22 )
			nRoll = 22;
		else
			break;
	case 22: // Defel Mimicker --> Aratech Echo Belt
		if( nItemLevel >= 29 )
			nRoll = 29;
		break;

	case 20: // Jal Shey Belt --> Jal Shey Mentor Belt
		if( nItemLevel >= 30 )
			nRoll = 30;
		break;

	case 27: // *Qel-Droma Belt*
		// If it was found before, replace with Jal Shey Mentor Belt
		if( LOOT_GetUniqueFound(311, nRoll) )
			nRoll = 30;
		else
			LOOT_SetUniqueFound(311, 27, TRUE);
		break;
	}

	return nRoll;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetGloveNum()

	Generates item variation number for gloves.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetGloveNum(int nItemLevel) {
	int nRoll = LOOT_DiceResult(nItemLevel, 2);
	
	// Replacement table for if a better version of what we rolled is available
	switch( nRoll ) {
	case 2: // Exchange Casual Gloves --> Exchange Work Gloves
		if( nItemLevel >= 7 )
			nRoll = 7;
		break;

	case 3: // Strength Gauntlets --> Eriadu Strength Amplifier
		if( nItemLevel >= 14 )
			nRoll = 14;
		else
			break;
	case 14: // Eriadu Strength Amplifier --> Sith Power Gauntlets
		if( nItemLevel >= 17 )
			nRoll = 17;
		else
			break;
	case 17: // Sith Power Gauntlets --> Dominator Gloves
		if( nItemLevel >= 25 )
			nRoll = 25;
		break;

	case 4: // Taris Survival Gloves --> Karakan Gauntlets
		if( nItemLevel >= 15 )
			nRoll = 15;
		break;

	case 9: // Detonator Gloves --> Bothan Precision Gloves
		if( nItemLevel >= 16 )
			nRoll = 16;
		break;

	case 12: // Jal Shey Perception Gloves --> Jal Shey Meditation Gloves
		if( nItemLevel >= 22 )
			nRoll = 22;
		break;

	case 21: // Automation Gloves --> Improved Automation Gloves
		if( nItemLevel >= 29 )
			nRoll = 29;
		break;

	case 27: // *Ossluk's Gloves*
		// If it was found before, replace with a random high level item
		if( LOOT_GetUniqueFound(321, nRoll) ) {
			nRoll = Random(8) + 22;
			if( nRoll == 27 )
				nRoll = 30;
		}
		else
			LOOT_SetUniqueFound(321, 27, TRUE);
		break;
	}

	return nRoll;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetHeadgearNum()

	Generates item variation number for headgear.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-08-03                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetHeadgearNum(int nItemLevel) {
	int nRoll = LOOT_DiceResult(nItemLevel, 2);
	
	// Replacement table for if a better version of what we rolled is available
	switch( nRoll ) {
	case 1: // Neural Band --> Matukai Meditation Band
		if( nItemLevel >= 23 )
			nRoll = 23;
		break;

	case 2: // No Breath Mask in Peragus dormitories
		if( GetModuleName() == "105PER" ) {
			nRoll = LOOT_DiceResult(nItemLevel - 1, 2);
			if( nRoll >= 2 )
				nRoll += 1;
		}
		break;

	case 3: // Rakatan Band --> Meditation Band
		if( nItemLevel >= 12 )
			nRoll = 12;
		else
			break;
	case 12: // Meditation Band --> Matukai Meditation Band
		if( nItemLevel >= 23 )
			nRoll = 23;
		break;

	case 5: // Bothan Perception Visor --> Bothan Sensory Visor
		if( nItemLevel >= 13 )
			nRoll = 13;
		break;

	case 6: // Sonic Nullifiers --> Absorbtion Visor
		if( nItemLevel >= 29 )
			nRoll = 29;
		break;

	case 9: // Shielding Visor --> Enhanced Shielding Visor
		if( nItemLevel >= 27 )
			nRoll = 27;
		break;

	case 10: // Spacer's Sensor --> Combat Sensor
		if( nItemLevel >= 15 )
			nRoll = 15;
		break;

	case 25: // *Circlet of Saresh*
		// If it was found before, replace it
		if( LOOT_GetUniqueFound(331, 25) ) {
			// Bindo's Band if that hasn't been found
			if( !LOOT_GetUniqueFound(331, 26) ) {
				LOOT_SetUniqueFound(331, 26, TRUE);
				nRoll = 26;
			}
			// Matukai Meditation Band
			else if( Random(2) == 0 )
				nRoll = 23;
			// Force Focusing Visor
			else
				nRoll = 30;
		}
		else
			LOOT_SetUniqueFound(331, 25, TRUE);
		break;

	case 26: // *Bindo's Band*
		// If it was found before, replace it
		if( LOOT_GetUniqueFound(331, 26) ) {
			// Circlet of Saresh if that hasn't been found
			if( !LOOT_GetUniqueFound(331, 25) ) {
				LOOT_SetUniqueFound(331, 25, TRUE);
				nRoll = 25;
			}
			// Matukai Meditation Band
			else if( Random(2) == 0 )
				nRoll = 23;
			// Force Focusing Visor
			else
				nRoll = 30;
		}
		else
			LOOT_SetUniqueFound(331, 26, TRUE);
		break;
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

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetImplantTier(int nItemLevel) {
	if( nItemLevel > 30 )
		nItemLevel = 30;
	int nCON = GetAbilityModifier(ABILITY_CONSTITUTION, GetFirstPC());
	int nRoll = Random(95 + nItemLevel);

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

	JC 2019-01-23                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetImplantNum(int nItemLevel) {
	// Implants have 10 variations
	return (LOOT_DiceResult(nItemLevel, 1) + 2) / 3;
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

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetLightArmorNum(int nItemLevel) {
	// Armors have 15 variations
	int nRoll = (LOOT_DiceResult(nItemLevel, 2) + 1) / 2;
	int nItemScale = (nItemLevel + 1) / 2;
	if( nItemScale > 15 )
		nItemScale = 15;
	
	// Replacement table for if a better version of what we rolled is available
	if( nRoll <= 3 && nItemScale > 5 ) // Light Combat Suit, Combat Suit, & Heavy Combat Suit
		nRoll = Random(nItemScale - 4) + 5;
	switch( nRoll ) {
	case 4: // Mandalorian Combat Suit --> Mandalorian Heavy Suit
		if( nItemScale >= 9 )
			nRoll = 9;
		break;

	case 10: // Zabrak Battle Armor --> Zabrak Field Armor
		if( nItemScale >= 14 )
			nRoll = 14;
		break;

	case 13: // Reinforced Fiber Mesh --> Zabrak Field Armor
		if( nItemScale >= 14 )
			nRoll = 14;
		break;

	case 15: // *Ulic Qel-Droma's Mesh Suit*
		// If it was found before, replace with a random high level item
		if( LOOT_GetUniqueFound(411, 15) )
			nRoll = 14 - Random(6);
		else
			LOOT_SetUniqueFound(411, 15, TRUE);
		break;
	}

	return nRoll;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetMediumArmorNum()

	Generates item variation number for medium armor.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetMediumArmorNum(int nItemLevel) {
// Armors have 15 variations
	int nRoll = (LOOT_DiceResult(nItemLevel, 2) + 1) / 2;
	int nItemScale = (nItemLevel + 1) / 2;
	if( nItemScale > 15 )
		nItemScale = 15;
	
	// Replacement table for if a better version of what we rolled is available
	if( nRoll <= 3 && nItemScale > 5 ) // Military Suit, Light Battle Armor, & Echani Battle Armor
		nRoll = Random(nItemScale - 4) + 5;
	switch( nRoll ) {
	case 4: // Cinnagar War Suit --> Heavy Cinnagar War Suit
		if( nItemScale >= 12 )
			nRoll = 12;
		break;

	case 6: // Bronzium Light Battle Armor --> Powered Light Battle Armor
		if( nItemScale >= 9 )
			nRoll = 9;
		break;

	case 7: // Verpine Fiber Mesh --> Exar Kun's Light Battle Suit
		if( nItemScale >= 11 )
			nRoll = 11;
		else
			break;
	case 11: // *Exar Kun's Light Battle Suit*
		// Replace with Verpine Fiber Ultramesh based on item level OR
		// if it was found before
		if( nItemScale >= 13 || LOOT_GetUniqueFound(421, 11) )
			nRoll = 13;
		else
			LOOT_SetUniqueFound(421, 11, TRUE);
		break;

	case 8: // Krath Heavy Armor --> Krath Holy Battle Suit
		if( nItemScale >= 10 )
			nRoll = 10;
		break;

	case 15: // *Jamoh Hogra's Battle Armor*
		// If it was found before, replace with Powered Light Batle Armor
		if( LOOT_GetUniqueFound(421, 15) )
			nRoll = 9;
		else
			LOOT_SetUniqueFound(421, 15, TRUE);
		break;
	}

	return nRoll;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetHeavyArmorNum()

	Generates item variation number for heavy armor.

	Replaces certain items when better versions are available.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetHeavyArmorNum(int nItemLevel) {
	// Armors have 15 variations
	int nRoll = (LOOT_DiceResult(nItemLevel, 2) + 1) / 2;
	int nItemScale = (nItemLevel + 1) / 2;
	if( nItemScale > 15 )
		nItemScale = 15;
	
	// Replacement table for if a better version of what we rolled is available
	if( nRoll <= 2 && nItemScale > 5 )
		nRoll = Random(nItemScale - 2) + 3; // Battle Armor & Heavy Battle Armor
	if( nRoll >= 3 && nRoll <= 4 && nItemScale >= 7 )
		nRoll = Random(nItemScale - 4) + 5; // Echani Heavy Armor & Durasteel Heavy Armor
	if( nRoll == 5 && nItemScale >= 11 )
		nRoll = 11; // Powered Battle Armor --> Corellian Powersuit

	return nRoll;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetRobeNum()

	Generates item variation number for robes.

	Replaces certain items when better versions are available and checks if
	unique items have been found before granting them.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-08-06                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetRobeNum(int nItemLevel) {
	// Item level is reduced because the scaling for robes has to be slowed
	// down on account of how you can't roll for robes at all until after
	// Peragus.
	int nItemScale = nItemLevel - 2;
	if( nItemScale < 1 )
		nItemScale = 1;
	int nGlobal;
	int i;
	int j;
	// Robes have 30 variations
	int nRoll = LOOT_DiceResult(nItemScale, 3);
	
	// Replacement table for if a better version of what we rolled is available
	switch( nRoll ) {
	case 1: // No clothing ever
		nRoll = 2;
	case 2: // Padawan --> Jedi
		if( nItemScale >= 8 )
			nRoll = 8;
		else
			break;
	case 8: // Jedi --> Jedi Knight
		if( nItemScale >= 13 )
			nRoll = 13;
		else
			break;
	case 13: // Jedi Knight --> Jedi Master
		if( nItemScale >= 17 )
			nRoll = 17;
		break;

	case 3: // Dark Padawan --> Dark Jedi
		if( nItemScale >= 9 )
			nRoll = 9;
		else
			break;
	case 9: // Dark Jedi --> Dark Jedi Knight
		if( nItemScale >= 14 )
			nRoll = 14;
		else
			break;
	case 14: // Dark Jedi Knight --> Dark Jedi Master
		if( nItemScale >= 18 )
			nRoll = 18;
		break;

	case 4: // Baran Do Novice
		if( nItemScale >= 10 ) {
			// Baran Do Novice --> Baran Do Sage
			if( nItemScale >= 19 )
				nRoll = 19;
			// Baran Do Novice --> Baran Do Advisor
			else
				nRoll = 10;
		}
		break;

	case 5: // Matukai Apprentice --> Matukai Adept
		if( nItemScale >= 15 )
			nRoll = 15;
		break;

	case 6: // Zeison Sha Initiate --> Zeison Sha Warrior
		if( nItemScale >= 16 )
			nRoll = 16;
		break;

	case 7: // Jal Shey Neophyte --> Jal Shey Advisor
		if( nItemScale >= 11 )
			nRoll = 11;
		else
			break;
	case 11: // Jal Shey Advisor --> Jal Shey Mentor
		if( nItemScale >= 20 )
			nRoll = 20;
		break;
	}
	
	// If we rolled a unique item, we have to check if we found it before
	if( nRoll >= 23 ) {
		nGlobal = LOOT_GetUniqueGlobalState(441);
		
		// If we found it before, replace it
		if( nGlobal >> LOOT_UniqueItemID(441, nRoll) ) {
			if( nGlobal == 255 )
				nRoll = 0;
			else {
				i = nRoll - 1;
				j = nRoll + 1;

				nRoll = 0;
				// Start with numbers less than what we rolled and look for a
				// unique item we haven't found yet
				while( i >= 23 ) {
					if( !(nGlobal >> LOOT_UniqueItemID(441, i)) ) {
						nRoll = i;
						i = 0;
					}
					else
						--i;
				}
				// If none were found, increase the number until we find one
				while( i > 0 && j <= 30 ) {
					if( !(nGlobal >> LOOT_UniqueItemID(441, j)) ) {
						nRoll = j;
						i = 0;
					}
					else
						++j;
				}
			}
			// If all unique items have been found, roll for a non-unique item
			// (outputs a value of 15-22)
			if( nRoll < 23 )
				nRoll = 22 - Random(8);
			// Otherwise, set that whatever we got was found
			else
				LOOT_SetUniqueFound(441, nRoll, TRUE);
		}
		// Otherwise, it's a new item, so set that we found it 
		else
			LOOT_SetUniqueFound(441, nRoll, TRUE);
	}

	return nRoll;
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

	JC 2019-08-03                                                             */
////////////////////////////////////////////////////////////////////////////////
string LOOT_AlignmentRobe(string sItemName, int nAlignment) {
	int nItemNum = StringToInt(GetStringRight(sItemName, 2));

	if( nAlignment >= 50 ) {
		switch( nItemNum ) {
		case 3:
			nItemNum = 2;
			break;
		case 9:
			nItemNum = 8;
			break;
		case 14:
			nItemNum = 13;
			break;
		case 18:
			nItemNum = 17;
			break;
		}
	}
	else {
		switch( nItemNum ) {
		case 2:
			nItemNum = 3;
			break;
		case 8:
			nItemNum = 9;
			break;
		case 13:
			nItemNum = 14;
			break;
		case 17:
			nItemNum = 18;
			break;
		}
	}

	return GetItemPrefix(441) + LOOT_Suffix(nItemNum);
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

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidItemType() {
	int nRoll = Random(8);

	switch( nRoll ) {
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
	default:
		return 550; // Droid Device
	}
	return 510;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidInterfaceNum()

	Generates item variation for droid interfaces.

	Replaces certain items when better versions are available.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidInterfaceNum(int nItemLevel) {
	// Droid interfaces have 15 variations
	int nRoll = (LOOT_DiceResult(nItemLevel, 1) + 1) / 2;
	// Rescale item level
	int nItemScale = (nItemLevel + 1) / 2;
	if( nItemScale > 15 )
		nItemScale = 15;
	
	// Replacement table for if a better version of what we rolled is available
	switch( nRoll ) {
	case 1: // Droid Optimized Interface --> Droid Lockout Bypass
		if( nItemScale >= 4 )
			nRoll = 4;
		else
			break;
	case 4: // Droid Lockout Bypass --> Droid Exchange Interface
		if( nItemScale >= 10 )
			nRoll = 10;
		break;

	case 3: // Droid Machine Interface --> Droid Scavenger Upgrade
		if( nItemScale >= 13 )
			nRoll = 13;
		break;

	case 5: // Droid Parabolic Guides --> Droid Agility Upgrade
		if( nItemScale >= 8 )
			nRoll = 8;
		break;

	case 7: // Droid Durability Upgrade --> Droid Scavenger Upgrade
		if( nItemScale >= 13 )
			nRoll = 13;
		break;
	}

	return nRoll;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidUtilityNum()

	Generates item variation for droid utilities.

	Replaces certain items when better versions are available.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidUtilityNum(int nItemLevel) {
	// Droid utilities have 15 variations
	int nRoll = (LOOT_DiceResult(nItemLevel, 1) + 1) / 2;
	int nItemScale = (nItemLevel + 1) / 2;
	if( nItemScale > 15 )
		nItemScale = 15;
	
	// Replacement table for if a better version of what we rolled is available
	switch( nRoll ) {
	case 1: // Droid Motion Tracker --> Droid Perception Sensors
		if( nItemScale >= 8 )
			nRoll = 8;
		break;

	case 2: // Droid Upgrade Slot isn't needed after level 7
		if( nItemScale >= 7 ) {
			nRoll = Random(nItemScale - 1) + 1;
			if( nRoll == 2 )
				nRoll = nItemScale;
		}
		if( nRoll != 4 )
			break;
	case 4: // Droid Advanced Upgrade Slot isn't needed after level 13
		if( nItemScale >= 13 ) {
			nRoll = Random(nItemScale - 2) + 1;
			if( nRoll == 2 )
				nRoll = nItemScale - 1;
			if( nRoll == 4 )
				nRoll = nItemScale;
		}
		break;

	case 10: // Droid Warfare Upgrade --> Droid Battle Upgrade
		if( nItemScale >= 11 )
			nRoll = 11;
		break;
	}

	return nRoll;
}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetDroidArmorNum()

	Generates item variation for droid armor.

	Replaces certain items when better versions are available.

	- nItemLevel: Item level determining the quality of the items we can get

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidArmorNum(int nItemLevel) {
	// Droid armors have 15 variations
	int nRoll = (LOOT_DiceResult(nItemLevel, 1) + 1) / 2;
	// Rescale item level
	int nItemScale = (nItemLevel + 1) / 2;
	if( nItemScale > 15 )
		nItemScale = 15;
	
	// Reroll 14 & 15 for variety since the last three are all Energized Armor
	if( nRoll == 14 || nRoll == 15 ) {
		nRoll = 13 - Random(10);
	}
	
	// Modular Plating III replaced at higher levels
	if( nRoll == 7 && nItemScale >= 14 )
		nRoll = Random(nItemScale - 10) + 8;
	
	// Replacement table for if a better version of what we rolled is available
	switch( nRoll ) {
	case 1: // Impact Armor I --> Impact Armor II
		if( nItemScale >= 4 ) {
			if( nItemScale >= 7 || Random(2) == 0 )
				nRoll = 3;
			else
				break;
		}
		else
			break;
	case 3: // Impact Armor II --> Impact Armor III
		if( nItemScale >= 5 ) {
			if( nItemScale >= 13 || Random(2) == 0 )
				nRoll = 5;
			else
				break;
		}
		else
			break;
	case 5: // Impact Armor III --> Modular Plating II
		if( nItemScale >= 10 && nItemScale < 13 )
			nRoll = 6;
		else
			break;
	case 2: // Modular Plating I --> Modular Plating II
		if( nRoll != 6 ) { // if we didn't fall through from case 5
			if( nItemScale >= 6 ) {
				if( nItemScale >= 7 || Random(2) == 1 )
					nRoll = 6;
				else
					break;
			}
			else
				break;
		}
	case 6: // Modular Plating II --> Modular Plating III
		if( nItemScale >= 7 ) {
			if( nItemScale >= 13 || Random(2) == 0 )
				nRoll = 7;
			else
				break;
		}
		break;

	case 9: // Dura Plating I --> Dura Plating II
		if( nItemScale >= 20 )
			nRoll = 11;
		break;

	case 13: // Energized Armor I --> Energized Armor II
		if( nItemScale >= 26 )
			nRoll = 14;
		else
			break;

	case 14: // Energized Armor II --> Energized Armor III
		if( nItemScale >= 28 )
			nRoll = 15;
		break;
	}

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

	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetDroidDeviceNum(int nItemLevel) {
	// Droid devices have 15 variations
	int nRoll = (LOOT_DiceResult(nItemLevel, 1) + 1) / 2;
	// Rescale item level
	int nItemScale = (nItemLevel + 1) / 2;
	if( nItemScale > 15 )
		nItemScale = 15;
	
	// Replace 14 for variety, since there are three Ion Blasts
	if( nRoll == 14 && nItemScale < 15 )
		nRoll = Random(13) + 1; // Reroll
	else if( nItemScale >= 15 )
		nRoll = 15; // Ion Blast Mark III --> Multi-Spectral Emitter
	
	// Replacement table for if a better version of what we rolled is available
	switch( nRoll ) {
	case 1: // Neural Pacifier --> Neural Scrambler
		if( nItemScale >= 5 )
			nRoll = 5;
		break;

	case 3: // Flame Thrower --> Molten Cannon
		if( nItemScale >= 7 )
			nRoll = 7;
		break;

	case 4: // Toxin Emitter --> Bio-Assault Spray
		if( nItemScale >= 10 )
			nRoll = 10;
		break;

	case 6: // Ion Striker --> Plasma Thrower
		if( nItemScale >= 9 )
			nRoll = 9;
		break;

	case 8: // Carbonite Projector --> Carbonite Emitter
		if( nItemScale >= 11 )
			nRoll = 11;
		break;

	case 12: // Ion Blast Mark I --> Ion Blast Mark II
		if( nItemScale >= 13 )
			nRoll = 13;
		else
			break;
	case 13: // Ion Blast Mark II --> Ion Blast Mark III
		if( nItemScale >= 14 )
			nRoll = 14;
		break;
	}

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

	JC 2019-07-31                                                             */
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
	if( !(nItemType >= 951 && nItemType >= 953) && nItemType != 955 )
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


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_GetSecSpikeTier()

	Determines security spike tier.

	Security spikes have two tiers: Security Tunnelers grant a +5 bonus	and
	Security Spike Tunnelers grant a +10 bonus.

	This function rolls a d10 and adds it to the item level; at level 10, the
	player will have a chance of getting Security Spike Tunnelers and after
	level 20 they will always receive them.

	- nItemLevel: Item level determining the quality of items we can get

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_GetSecSpikeTier(int nItemLevel) {
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
		if( nItemNum == 6 ) // Poison Dart --> Kyber Dart
			nItemNum = 4;
		if( nItemNum == 8 ) // Piercing Dart --> Buster Rocket
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

	JC 2019-08-03                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetTreasureSpecific(int nItemLevel, int nItemType) {
	// Cap the item level to avoid incidents
	if( nItemLevel > 30 )
		nItemLevel = 30;

	int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
	int nRange = 1;
	int nRoll = 0;
	int nResult = 0;
	string sTemplate = "";
	
	// If we're outside the specific treasure range, reset the item type
	if( nItemType < 0 || nItemType >= 900 )
		nItemType = 0;
	// If the item class isn't known, we randomly generate it
	if( nItemType == 0 ) {
		// Player shouldn't find armor early on when they're meant to be naked
		if( nItemLevel < 4 )
			nRange = 3;
		// Droid items and disposables aren't included in random loot
		else
			nRange = 4;
		// Roll for item class
		nResult = 100 * (Random(nRange) + 1);
		// Equipment more common, upgrades less common
		if( nResult == 200 & Random(2) == 1 )
			nResult = 300;
		
		// Now that the item class is known, return to top
		sTemplate = GetTreasureSpecific(nItemLevel, nResult);
	}

	else {
		// Item class is known, but the item type isn't
		if( nItemType % 100 == 0 ) {
			switch( nItemType ) {
			case 100: // Weapons
				// Only Peragus weapons on Peragus
				if( GetStringRight(GetModuleName(), 3) == "PER" )
					nResult = 150;
				// Lightsabers aren't included in random loot
				else
					nRange = 3;
				break;
			case 200: // Upgrades
				// No lightsaber upgrades if item level < 6 or PC level < 10
				if( nItemLevel < 6 || nPCLevel < 10 )
					nResult = LOOT_GetUpgradeType(1);
				else
					nResult = LOOT_GetUpgradeType(0);
				break;
			case 300: // Equipment
				nRange = 5;
				break;
			case 400: // Armor
				// No Jedi robes on Peragus
				if( GetStringRight(GetModuleName(), 3) == "PER" ) {
					nRange = 3;
				}
				else {
					nRange = 4;
				}
				break;
			case 500: // Droid
				nResult = LOOT_GetDroidItemType();
				break;
			}
			// Roll for type if we don't know it yet
			if( nResult < 10 )
				nResult = 10 * (Random(nRange) + 1);
			// Add item class if it's missing
			if( nResult < 100 )
				nResult = nResult + nItemType;
			
			// Now item type is known, return to top
			sTemplate = GetTreasureSpecific(nItemLevel, nResult);
		}

		else {
			// Item class and type are known, but the item subtype isn't
			if( nItemType % 10 == 0 ) {
				switch( nItemType ) {
				case 140: // Lightsaber
					nResult = LOOT_GetSaberSubtype();
					break;
				case 150: // Peragus Weapons
					nResult = LOOT_GetPeragusWeapon();
					break;
				case 210: // Upgrade - Ranged
				case 220: // Upgrade - Melee
				case 230: // Upgrade - Armor
				case 240: // Upgrade - Lightsaber
					nResult = LOOT_GetUpgradeSubtype(nItemType);
					break;
				case 340: // Implant
					nResult = LOOT_GetImplantTier(nItemLevel);
					break;
				case 350: // Armband
					// If the Vao Armband has already been found, redirect to
					// another equipment item
					if( LOOT_GetUniqueFound(351, 0) ) {
						nResult = 300 + (10 * (Random(4) + 1));
					}
					else {
						LOOT_SetUniqueFound(351, 0, TRUE);
						nResult = 1;
					}
					break;
				case 540: // Droid Shield
					nResult = LOOT_GetDroidShieldSubtype();
					break;
				default: // Everything else has only 1 thing per thing
					nResult = 1;
					break;
				}
				// Convert to full item type if it's not one yet
				if( nResult < 100 )
					nResult = nItemType + nResult;
				
				// Entire item type known, return to top
				sTemplate = GetTreasureSpecific(nItemLevel, nResult);
			}
			
			// Item class, type, & subtype known, generate variation
			else {
				switch( nItemType ) {
				case 111: // Blaster Pistol
					nResult = LOOT_GetPistolNum(nItemLevel);
					break;
				case 121: // Blaster Rifle
					nResult = LOOT_GetRifleNum(nItemLevel);
					break;
				case 131: // Melee
					nResult = LOOT_GetMeleeNum(nItemLevel);
					break;
				case 141: // Lightsaber - Standard
				case 142: // Lightsaber - Short
				case 143: // Lightsaber - Double-Bladed
					nResult = LOOT_GetSaberColor(nItemLevel);
					break;
				case 151: // Mining Laser
				case 152: // Advanced Mining Laser
				case 153: // Vibrocutter
				case 154: // Guidon Beacon
					nResult = 0;
					break;
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
					nResult = LOOT_GetUpgradeNum(nItemLevel, nItemType);
					break;
				case 244: // Upgrade - Lightsaber - Power Crystal
					nResult = LOOT_GetPowerCrystalNum(nItemLevel);
					break;
				case 245: // Upgrade - Lightsaber - Color Crystal
					nResult = LOOT_ColorCrystalNum(LOOT_GetSaberColor(nItemLevel));
					break;
				case 311: // Belt
					nResult = LOOT_GetBeltNum(nItemLevel);
					break;
				case 321: // Gloves
					nResult = LOOT_GetGloveNum(nItemLevel);
					break;
				case 331: // Headgear
					nResult = LOOT_GetHeadgearNum(nItemLevel);
					break;
				case 341: // Implant Level 1
				case 342: // Implant Level 2
				case 343: // Implant Level 3
				case 344: // Implant Level 4
					nResult = LOOT_GetImplantNum(nItemLevel);
					break;
				case 351: // Armband
					// Vao Armband is the only possible armband
					sTemplate = "a_band_x02";
					break;
				case 411: // Light Armor
					nResult = LOOT_GetLightArmorNum(nItemLevel);
					break;
				case 421: // Medium Armor
					nResult = LOOT_GetMediumArmorNum(nItemLevel);
					break;
				case 431: // Heavy Armor
					nResult = LOOT_GetHeavyArmorNum(nItemLevel);
					break;
				case 441: // Robes
					nResult = LOOT_GetRobeNum(nItemLevel);
					break;
				case 511: // Droid Interface
					nResult = LOOT_GetDroidInterfaceNum(nItemLevel);
					break;
				case 521: // Droid Utility
					nResult = LOOT_GetDroidUtilityNum(nItemLevel);
					break;
				case 531: // Droid Armor
					nResult = LOOT_GetDroidArmorNum(nItemLevel);
					break;
				case 541: // Droid Shield - Energy
				case 542: // Droid Shield - Enviro
					nResult = LOOT_GetDroidShieldNum(nItemLevel, nItemType);
					break;
				case 551: // Droid Device
					nResult = LOOT_GetDroidDeviceNum(nItemLevel);
					break;
				}
				
				// If we don't have a template string yet, add the item prefix and
				// number to get our template.
				if( sTemplate == "" )
					sTemplate = GetItemPrefix(nItemType) + LOOT_Suffix(nResult);
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
		nItemNum = LOOT_GetSecSpikeTier(nItemLevel);
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

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
string GetTreasureBundle(int nItemLevel, int nItemType) {
	// Cap the item level to avoid incidents
	if( nItemLevel > 30 )
		nItemLevel = 30;
	// Limited selection late in the game
	if( LOOT_IsLateGame() )
		nItemType = LOOT_GetDisposableLateGame(nItemLevel);

	int nRange = 1;
	int nRoll = 0;
	int nResult = 0;
	string sTemplate = "";
	
	// If we aren't in the disposable range, set the item class to disposable items
	if( nItemType < 900 || nItemType >= 1000 )
		sTemplate = GetTreasureBundle(nItemLevel, 900);
	else {
		// Item class is known, but the item type isn't
		if( nItemType % 100 == 0 ) {
			// Limited selection early on (no skill items or grenades)
			if( GetGlobalNumber("G_PC_LEVEL") < 6 )
				nRange = 6;
			// No rockets if no Mira
			else if( !IsAvailableCreature(NPC_MIRA) )
				nRange = 8;
			// All access
			else
				nRange = 9;
			nResult = nItemType + (10 * (Random(nRange) + 1));
			
			// Now item type is known, return to top
			sTemplate = GetTreasureBundle(nItemLevel, nResult);
		}

		else {
			// Item class and type are known, but the item subtype isn't
			if( nItemType % 10 == 0 ) {
				switch( nItemType ) {
				case 920: // Components & Chemicals
					nRange = 2;
					break;
				case 930: // Shields
					nRange = 3;
					break;
				case 940: // Medical Items
					nRange = 2;
					break;
				case 950: // Stimulants
					nRange = 5;
					break;
				case 970: // Grenades
					nResult = LOOT_GetGrenadeSubtype(nItemLevel);
					break;
				case 980: // Skill Items
					nRange = 3;
					break;
				default: // Everything else has only 1 thing per thing
					nResult = 1;
					break;
				}
				// Roll for subtype if we don't know it yet
				if( nResult < 1 )
					nResult = Random(nRange) + 1;
				// Convert to full item type if it's not one yet
				if( nResult < 100 )
					nResult = nItemType + nResult;
				
				// Entire item type known, return to top
				sTemplate = GetBundlePrefix(nItemLevel, nResult);
			}
			
			// Item class, type, & subtype known, generate template
			else
				sTemplate = GetBundlePrefix(nItemLevel, nItemType);
		}
	}

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

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasureDisposable(object oContainer, int numberOfItems, int nItemType) {
	if( !GetLocalBoolean(oContainer, 57) ) {
		SetLocalBoolean(OBJECT_SELF, 57, TRUE);

		int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
		int nItemLevel;
		int nItemQuantity;
		string sItem;
		string sItemName;
		int i;
		int j;
		
		// If we're not in the disposable range, reset the item type
		if( nItemType < 900 || nItemType >= 1000 )
			nItemType = 0;
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
				sItemName = GetSubString(sItem, 0, j);
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
	- nItemType: Type of item (item classifications)

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasure(object oContainer, int numberOfItems, int nItemType) {
	if( !GetLocalBoolean(oContainer, 57) ) {
		SetLocalBoolean(OBJECT_SELF, 57, TRUE);

		int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
		if( nPCLevel == 1 )
			nPCLevel = 2; // Increases variety of items found at level 1
		int nRandom;
		int nRoll;
		int nRareChance;
		string sItem;
		string sItemName;
		int nItemLevel;
		int nItemQuantity;
		int nAlignment;
		int i;
		int j;

		for( i = 1; i <= numberOfItems; ++i ) {
			nRareChance = GetGlobalNumber("000_RareItemChance");
			
			// Item level is based on the player's current level
			nItemLevel = nPCLevel + Random(8) - 5;
			if( nItemLevel < 1 )
				nItemLevel = 1;
			
			// Random number determines chance of getting a rare or
			// disposable item
			nRandom = Random(95) + GetGlobalNumber("000_RareItemChance");
			
			// If an item type was specified, roll at least a 95
			// (this excludes disposable items later)
			if( nItemType > 0 && nItemType < 900 && nRandom < 91 )
				nRandom = 95;
			
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
				// Chance of getting a disposable item (if applicable)
				if( nRoll <= 85 )
					sItem = GetTreasureBundle(nItemLevel, nItemType);
				// Otherwise, we get a normal item
				else
					sItem = GetTreasureNormal(nItemLevel, nItemType);
			}
			// Parse the treasure blob to separate the template and quantity
			j = FindSubString(sItem, "[");
			if( j >= 0 ) {
				nItemQuantity = StringToInt(GetSubString(sItem, j + 1, 4));
				sItemName = GetSubString(sItem, 0, j);
			}
			else sItemName = sItem;
			
			// Make sure robes match the area's alignment
			nAlignment = LOOT_GetAreaAlignment();
			if( nAlignment != 50 &&
				GetSubString(sItemName, 0, GetStringLength(sItemName) - 2) == GetItemPrefix(441) )
				sItemName = LOOT_AlignmentRobe(sItemName, nAlignment);
			
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
	- nItemType: Type of item (item classifications)

	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceCritterTreasure(object oContainer, int numberOfItems, int nItemType) {
	object oContainer = OBJECT_SELF;
	int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
	if( nPCLevel == 1 )
		nPCLevel = 2; // Increases variety of items found at level 1
	int nRandom;
	int nRoll;
	string sItem;
	string sItemName;
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
		nRandom = Random(95) + GetGlobalNumber("000_RareItemChance");
		
		// If an item type was specified, roll at least a 95
		// (this excludes disposable items later)
		if( nItemType > 0 && nItemType < 900 && nRandom < 91 )
			nRandom = 95;
		
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
			// Chance of getting a disposable item (if applicable)
			if( nRoll <= 85 )
				sItem = GetTreasureBundle(nItemLevel, nItemType);
			// Otherwise, we get a normal item
			else
				sItem = GetTreasureNormal(nItemLevel, nItemType);
		}
		// Parse the treasure blob to separate the template and quantity
		j = FindSubString(sItem, "[");
		if( j >= 0 ) {
			nItemQuantity = StringToInt(GetSubString(sItem, j + 1, 4));
			sItemName = GetSubString(sItem, 0, j);
		}
		else sItemName = sItem;
		
		// Make sure robes match a creature's alignment
		if( GetObjectType(oContainer) == OBJECT_TYPE_CREATURE &&
			GetSubString(sItemName, 0, GetStringLength(sItemName) - 2) == GetItemPrefix(441) )
			sItemName = LOOT_AlignmentRobe(sItemName, GetGoodEvilValue(oContainer));
		
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
		case 3:
			nItemType = 300; // Equipment
		default:
			nItemType = 900; // Disposables
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
	3% chance armor underlays
	Rare items more likely

	- oContainer: Object to contain the loot
	- numberOfItems: Number of items to place
	- nItemType: Type of item (item classifications)

	JC 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////
void PlaceTreasurePeragus(object oContainer, int numberOfItems, int nItemType) {
	int nRoll = Random(100) + GetGlobalNumber("000_RareItemChance");
	
	// If the input item type is valid, use it
	if( nItemType / 100 == 3 ||
		nItemType / 10 == 15 ||
		nItemType == 232 )
		PlaceTreasure(oContainer, numberOfItems, nItemType);
	// Otherwise, roll for item type
	if( nRoll >= 88 )
		PlaceTreasure(oContainer, numberOfItems, 300);
	else if( nRoll >= 83 )
		PlaceTreasure(oContainer, numberOfItems, 150);
	else if( nRoll >= 80 )
		PlaceTreasure(oContainer, numberOfItems, 232);
	else {
		IncrementGlobalNumber("000_RareItemChance", 3);
		PlaceTreasureDisposable(oContainer, numberOfItems);
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