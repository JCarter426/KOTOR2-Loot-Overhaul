//:: k_death_give_ls
// kds, 09/20/04

#include "k_inc_switch"
#include "k_inc_debug"
#include "k_inc_treas_k2"

void main()
{
    ExecuteScript("k_ai_master", OBJECT_SELF, KOTOR_DEFAULT_EVENT_ON_DEATH);

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
    else sItem = GetTreasureSpecific(GetGlobalNumber("G_PC_LEVEL")-2+Random(5),240);

    CreateItemOnObject( sItem, oRecipient, 1 );
    /*
    if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
    {
        SpeakString("GEN_I_AM_DEAD", TALKVOLUME_SILENT_TALK);
        //Shout Attack my target, only works with the On Spawn In setup
        SpeakString("GEN_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
    }
    if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_DEATH))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }
    */
}
