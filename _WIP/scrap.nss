////////////////////////////////////////////////////////////////////////////////
/*	LOOT_Log2()

	Cheap lookup table for logarithms of 2.
	
	- nPowerOf2: Number that's a power of 2
	
	JC 2019-08-03                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_Log2(int nPowerOf2) {

switch( nPowerOf2 ) {
	case 1: return 0;
	case 2: return 1;
	case 4: return 2;
	case 8: return 3;
	case 16: return 4;
	case 32: return 5;
	case 64: return 6;
	case 128: return 7;
	}
return -1;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_CountItemsEquipped()

	Checks if an item is in any of the specified creature's equipment slots and
	returns how many are found.
	
	- oCreature: Creature to check
	- sItem: Tag of the item to look for
	
	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_CountItemsEquipped(object oCreature, string sItem) {

int i;
int j = 0;
object oItem;
string sTag;

for( i = 0; i <= 19; i++ ) {
	oItem = GetItemInSlot(i, oCreature);
	if( GetIsObjectValid(oItem) )
		sTag = GetTag(oItem);
	else
		sTag = "";
	if( sTag == sItem )
		j++;
	}

return j;

}


////////////////////////////////////////////////////////////////////////////////
/*	LOOT_HasEnoughItems()

	Counts how many of a given item are possessed by the party. Checks the
	individual party members' equipment slots as well as their shared inventory.
	
	- oCreature: Creature to check
	- sItem: Tag of the item to look for
	
	JC 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////
int LOOT_HasEnoughItems(string sItem, int nAmount) {

object oPC = GetFirstPC();
object oPM1 = OBJECT_INVALID;
object oPM2 = OBJECT_INVALID;
object oItem;
int nCount;
int i = 1;
int j = FALSE;
int k = 0;

while( j == FALSE ) {
	object oNearest = GetNearestObject(OBJECT_TYPE_CREATURE, oPC, i);
	if( GetIsObjectValid(oNearest) ){
		if( IsObjectPartyMember(oNearest) ) {
			if( oPM1 == OBJECT_INVALID )
				oPM1 = oNearest;
			else {
				oPM2 = oNearest;
				j = TRUE;
				}
			}
		i++;
		}
	else j = TRUE;
	}
nCount = LOOT_CountItemsEquipped(GetFirstPC(), sItem);
while( nCount < nAmount && k <= 3 ) {
	switch( k ) {
		case 0:
			if( GetIsObjectValid(oPM1) )
				nCount += LOOT_CountItemsEquipped(oPM1, sItem);
			break;
		case 1:
			if( GetIsObjectValid(oPM2) )
				nCount += LOOT_CountItemsEquipped(oPM2, sItem);
			break;
		case 2:
			oItem = GetItemPossessedBy(GetFirstPC(), sItem);
			if( GetIsObjectValid(oItem) )
				nCount += GetItemStackSize(oItem);
			break;
		case 3:
			oItem = GetItemPossessedBy(OBJECT_SELF, sItem);
			if( GetIsObjectValid(oItem) )
				nCount += GetItemStackSize(oItem);
			break;
		}
	k++;
	}
if( nCount >= nAmount )
	return TRUE;
return FALSE;

}


int LOOT_GetUniqueFound(int nItemType, int nItemNum) {

int nItemID = LOOT_UniqueItemID(nItemType, nItemNum);
int nGlobal = GetGlobalNumber(LOOT_UniqueGlobal(nItemType));
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
	if( nItemType == 111 &&
		nItemID == 16 ) {
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