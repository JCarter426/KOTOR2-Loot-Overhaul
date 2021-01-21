// Gives the player the next component needed for the HK quest.
// kds, 09/06/04

#include "k_inc_treas_k2"

void main()
{

    int i = 1;
    string sHKpart = "hkpart0";
    string sItem;
    string sString = GetScriptStringParameter();
    object oItem = OBJECT_SELF;
    object oRecipient;
    if(sString != "") oRecipient = GetObjectByTag(sString);
        else oRecipient = GetPartyLeader();

if(GetJournalEntry("HK") < 80)
{
    for(i; GetIsObjectValid(oItem); i++)
    {

    sItem = sHKpart + IntToString(i);
    oItem = GetItemPossessedBy (GetPartyLeader(),sItem);
    }
    //AddJournalQuestEntry("LightsaberQuest",10*i);
}

CreateItemOnObject( sItem, oRecipient, 1 );

}
