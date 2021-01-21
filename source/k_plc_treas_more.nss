//:: k_plc_tres_more
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

    if(!GetLocalBoolean(oContainer,57))
    {
        // "More" containers have an increased chance of containing a rare item
        IncrementGlobalNumber("000_RareItemChance",25);
        int numberOfItems = Random(4)+1;

        PlaceTreasure(oContainer, numberOfItems);
        
        // CTJ-OEI 09-29-04
        // Optimization - We don't want to keep executing this script
        // over and over once it is done.  Script execution, and the
        // I/O associated with it, is very expensive.
        RemoveHeartbeat(OBJECT_SELF);
    }
}
