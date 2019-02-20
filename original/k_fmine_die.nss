//R.Taylor OEI 07/16/04
//This handles the blowing up of the
//floating mine.  The radius is 4 meters.
//The damage is stored in the local number
//with the index of SW_NUMBER_HEALERAI_THRESHOLD


#include "k_inc_gensupport"
int GR_GetGrenadeDC(object oTarget);
void main()
{
    if ( !GetIsObjectValid(OBJECT_SELF ) )
    {
//        AurPostString( "k_fmine_die: Mine already gone.", 20, 30, 15.0f );
        return;//Mine gone
    }

    //int nDamage = 50;//This is how much damage will come off.
    int nDamage = GetLocalNumber( OBJECT_SELF, SW_NUMBER_HEALERAI_THRESHOLD );
    if ( nDamage < 1 )
        nDamage = 50;//Default to 50. Painfull!

    int nDC = 15;//This is the DC for the Reflex Save
    int nDCCheck = 0;//The adjusted DC check later.

    //RWT-OEI 04/19/04 - Added this to blow up the droid and
    //                 - make it go away.

    location oLoc = GetLocation( OBJECT_SELF );
    float oOri = GetFacing( OBJECT_SELF );
    vector vPos = GetPositionFromLocation( oLoc );
    vPos.z = vPos.z + 2.0f;  //We need to elevate the explosion off the ground
    location oExplosionLoc = Location( vPos, oOri );
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 4.0, oLoc, FALSE, 65);
    while(GetIsObjectValid(oTarget) && nDamage > 0)
    {
        int nFaction = GetStandardFaction( oTarget );
        //Don't bother damaging self, self is dead.
        //Only damage the target found if it belongs to these
        //factions. We can't do a normal IsNeutral check because
        //OBJECT_SELF is dead, and is therefore neutral to everyone.
        if( oTarget != OBJECT_SELF && nFaction != STANDARD_FACTION_NEUTRAL )
        {
            nDCCheck = nDC;
            nDCCheck -= GR_GetGrenadeDC(oTarget);

            if(!ReflexSave(oTarget, nDCCheck, SAVING_THROW_TYPE_NONE))
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_PIERCING), oTarget);
            }
            else
            {
                int nApply;

                // DJS-OEI 11/20/2003
                // If the target has the Evasion feat, the damage on a successful
                // Reflex save is 0. Otherwise, it's half the original damage.

                if( GetHasFeat( FEAT_EVASION, oTarget ) ) {
                    nApply = 0;
                }
                else {
                    nApply = nDamage / 2;
                }
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nApply, DAMAGE_TYPE_PIERCING), oTarget);
            }
        }

        oTarget = GetNextObjectInShape(SHAPE_SPHERE, 4.0, oLoc, FALSE, 65);
    }

    //Play the explosion
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(3003), oExplosionLoc);

    //Get rid of the exploder.
    ClearAllActions();

    if ( GetLocalBoolean( OBJECT_SELF, 60 ) )
    {
//        AurPostString( "Attempted to kill mine twice.", 20, 20, 15.0f );
    }
    else
    {
        DestroyObject( OBJECT_SELF, 0.0f, TRUE, 0.0f );
        SetLocalBoolean( OBJECT_SELF, 60, TRUE );
    }
}

//Get the DC for the grenade based on the targets feats.

int GR_GetGrenadeDC(object oTarget)
{
    int nUnc1 = GetHasFeat(FEAT_UNCANNY_DODGE_1, oTarget);
    int nUnc2 = GetHasFeat(FEAT_UNCANNY_DODGE_2, oTarget);
    int nDC = 0;

    if(nUnc1 == TRUE)
    {
        nDC += 2;
        if(nUnc2 == TRUE)
        {
            nDC += 2;
        }
    }
    return nDC;

}

