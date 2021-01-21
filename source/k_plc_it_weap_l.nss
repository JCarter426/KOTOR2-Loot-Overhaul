//:: k_plc_it_weap_l
/*

Places a lightsaber weapon item in a container.

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

        int numberOfItems = 1;

        PlaceTreasure(oContainer, numberOfItems, 140);
    }
}
