//:: k_plc_tres_norm
/*

Places extra treasure in a container.

*/
//:: Created By: Kevin Saunders
//:: Copyright (c) 2004 Obsidian Entertainment
#include "k_inc_debug"
#include "k_inc_treas_k2"


void main()
{
    object oContainer = OBJECT_SELF;

    if(!UT_GetTalkedToBooleanFlag(oContainer))
    {
        // "More" containers have an increased chance of containing a rare item
        IncrementGlobalNumber("000_RareItemChance",20);
        int numberOfItems = Random(4)+3;

        PlaceTreasure(oContainer, numberOfItems);
    }
}
/*
OLD
#include "k_inc_utility"
#include "k_inc_treasure"
void main()
{
    if(!UT_GetTalkedToBooleanFlag(OBJECT_SELF))
    {
        UT_SetTalkedToBooleanFlag(OBJECT_SELF,TRUE);
        SWTR_PopulateTreasure(OBJECT_SELF,SWTR_TABLE_RAKATAN_CONTAINER,3);
    }
}
*/
