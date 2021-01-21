//:: k_contain_unlock
/*

Places extra items in a bashable, locked container when it is unlocked.

*/
//:: Created By: Kevin Saunders
//:: Copyright (c) 2004 Obsidian Entertainment
#include "k_inc_debug"
#include "k_inc_treas_k2"


void main()
{
    object oContainer = OBJECT_SELF;

    if(!GetLocalBoolean(oContainer, 55))
    {
        SetLocalBoolean(oContainer, 55, TRUE);
        PlaceTreasureDisposable(oContainer, Random(8)+1, 920);
    }
}
/*#include "k_inc_utility"
#include "k_inc_treasure"
void main()
{
    if(!UT_GetTalkedToBooleanFlag(OBJECT_SELF))
    {
        UT_SetTalkedToBooleanFlag(OBJECT_SELF,TRUE);
        SWTR_PopulateTreasure(OBJECT_SELF,SWTR_TABLE_MILITARY_CONTAINER_MID,3);
    }
}
*/
