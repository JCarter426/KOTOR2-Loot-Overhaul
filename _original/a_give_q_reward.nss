// a_give_q_reward
// Parameter Count: 2
//
// This script gives the an item of the type designated
// in the parameter to the player.
//
// The player is given an item of a power slightly above their level. If they
// already possess this particular item, then the level is increased until a
// new item is given.
//
// Param1 - The item number of the item the player will receive
// Param2 - bonus (or penalty) to the item level
/*

Weapons 100
*  111 - Blaster
*  121 - Blaster Rifle
*  131 - Melee
*  141 - Lightsaber (regular)
*  142 - Lightsaber (short)
*  143 - Lightsaber (Double)

Upgrades 200
Upgrade - Ranged 210
*  211 - Targeting scope
*  212 - Firing Chamber
*  213 - Power Pack

Upgrade - Melee 220
*  221 - Grip
*  222 - Edge
*  223 - Energy Cell

Upgrade - Armor 230
*  231 - Overlay
*  232 - Underlay

Upgrades - Lightsaber 240
  241 - Emitter
*  242 - Lens
  243 - Energy Cell
  244 - Crystals
  245 - Color Crystals

Equipment - 300
*  311 - Belts
*  321 - Gloves
*  331 - Head Gear
   Implants - 340
*   341 - Level 1
*   342 - Level 2
*   343 - Level 3
*   344 - Level 4

Armor - 400
*  411 - Light armor
*  421 - Medium armor
*  431 - Heavy armor
*  441 - Jedi Robes

Droid Items - 500
511 - Interface
521 - Utility
531 - Armor
541 - Shielding
551 - Special weapons

Disposables - 900
*  911 - credits
*  921 - components
*  922 - chemicals
*  930 - shields
*  941 - medpac
*  942 - repair kit
*  951 - stim - str
*  952 - stim - dex
*  953 - stim - con
*  954 - medpac
*  961 - credits
*  970 - grenades
*  981 - parts
*  982 - program spikes
*  983 - security spike
   990 - rockets for mira
*/
//
// KDS, 07/23/04
#include "k_inc_treas_k2"
void main() {

    int nItemType = GetScriptParameter( 1 );
    int nItemLevelBonus = GetScriptParameter( 2 );
    int nItemLevel = GetGlobalNumber("G_PC_LEVEL") + 2 + nItemLevelBonus;
    string sItem;
    string sPossibleItem;
    object oItem;

    int i;

    //AurPostString(IntToString(GetStringLength(sItem)),4,4,2.0);

    for (i = 1; GetStringLength(sItem) == 0 && i < 30; i++)
    {
        sPossibleItem = GetTreasureSpecific(nItemLevel,nItemType);
        //AurPostString("Item: "+sPossibleItem,5,5,2.0);

        //see if the player already has this item.
        oItem = GetItemPossessedBy (GetPartyLeader(),sPossibleItem);
        if(nItemLevel == 30 || !GetIsObjectValid(oItem))
            sItem = sPossibleItem;
        nItemLevel++;
    }

    CreateItemOnObject( sItem, GetPartyLeader(), 1 );
}
