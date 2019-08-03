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