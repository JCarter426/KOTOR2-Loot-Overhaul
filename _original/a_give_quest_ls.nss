// Gives the player the next component needed for the lightsaber quest.
// kds, 09/06/04

#include "k_inc_treas_k2"

void main()
{

    int i = 1;
    string sLSpart = "lspart0";
    string sItem;
    string sString = GetScriptStringParameter();
    object oItem = OBJECT_SELF;
    object oRecipient;
    if(sString != "") oRecipient = GetObjectByTag(sString);
        else oRecipient = GetPartyLeader();

if(GetJournalEntry("LightsaberQuest") < 40)
{
    for(i; GetIsObjectValid(oItem); i++)
    {

    sItem = sLSpart + IntToString(i);
    oItem = GetItemPossessedBy (GetPartyLeader(),sItem);
    }
    AddJournalQuestEntry("LightsaberQuest",10*i);
}
else sItem = GetTreasureSpecific(GetGlobalNumber("G_PC_LEVEL")-2+Random(5),140);

CreateItemOnObject( sItem, oRecipient, 1 );

}
