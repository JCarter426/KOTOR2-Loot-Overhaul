//:: k_def_spn_t_none
/*
    v2.0
    On Spawn In
    No treasure
*/
//:: Created By: Preston Watamaniuk
//:: Modified By: Anthony Davis
#include "k_inc_generic"
#include "k_inc_debug"
#include "k_inc_treas_k2"

void main()
{
    //BEGIN WALK WAYPOINT BEHAVIORS (Comment In or Out to Activate )
    //****** WAYPOINT PATH STYLE ******
    // Object will follow waypoints in order, and then start over at beginning.
    // Example: WP_01, WP_02, WP_03, then return to WP_01 and continue...
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_CIRCULAR);
    // Object will follow waypoints in order, and then follow the waypoints backwards.
    // Example: WP_01, WP_02, WP_03, then WP_02, WP_01,
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_PATH);
    // Object will follow waypoints in a RANDOM order
    // Example: WP_02, WP_03, WP_01
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RANDOM);
    // Object will follow waypoints starting with NEAREST waypoint.
    // THIS WILL EFFECT THE ORDER THE WAYPOINTS ARE FOLLOWED!
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_START_AT_NEAREST);

    //****** WAYPOINT FREQUENCY ******
    // Object will follow waypoints ONLY ONCE.
    // Leave commented out to have waypoints repeated forever.
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_ONCE);

    //****** WAYPOINT SPEED ******
    // Object will RUN to waypoints.
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RUN);

    //****** WAYPOINT PAUSING ******
    // Object will PAUSE at each waypoints based on each option.
    // CObjects will ONLY turn to face in the waypoint direction if
    // the are pausing at the waypoint.
    // The pause times are:
    // Causes the Object to pause for 1 - 3 seconds at a waypoint
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_SHORT);
    // Causes the Object to pause for 4 - 6 seconds at a waypoint
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_LONG);
    // Causes the Object to pause for 1 - 10 seconds at a waypoint
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_RANDOM);

    //****** WAYPOINT ANIMATIONS ******
    // Object will play an animation that has been specified with
    // SetLocalNumber(OBJECT_SELF, 29, <SOME ANIMATION NUMBER> )
    // Local number 29 is reserved for animations.
    // This may conflict with ambient animations (further down)
    //GN_SetSpawnInCondition(SW_FLAG_USE_WAYPOINT_ANIMATION);
    // If using an animation at a waypoint, uncomment and set the following lin:
    //SetLocalNumber(OBJECT_SELF, 29, <SOME ANIMATION NUMBER> );


    //****** WAYPOINT SERIES ******
    // If this function is uncommented a number from 1 to 99 must be passed.
    // This number represents a waypoint series that uses the string "01" through "99"
    // instead of the creature's tag.
    // eg. WP_22_01 through WP_22_05.  22 is the series number set with this function.
    //GN_SetWalkWayPointsSeries( 1 );

    //END WALK WAYPOINT BEHAVIORS

    //****** AMBIENT ANIMATIONS ******
    // This will play Ambient Animations until the NPC sees an enemy or is cleared.
    // NOTE: that these animations will play automatically for Encounter Creatures.
    //GN_SetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR);
    //GN_SetSpawnInCondition(SW_FLAG_FAST_BUFF);
    //GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS);
    //GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS_MOBILE);

    //****** COMPUTER DIALOG ******
    //When a creature with this flag is talked to a computer dialogue will come up instead of the usual screens.
    //GN_SetSpawnInCondition(SW_FLAG_ON_DIALOGUE_COMPUTER);

    //****** CUSTOM USER DEFINED EVENTS ******
    // The following settings will allow the user to fire one of the blank
    // user defined events in the NW_D2_DefaultD.  Like the OnSpawnIn script,
    // this script is meant to be customized by the end user to allow for unique
    // behaviors.  The user defined events user 1000 - 1010
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1001
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_PERCEPTION);       //OPTIONAL BEHAVIOR - Fire User Defined Event 1002
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_ATTACKED);         //OPTIONAL BEHAVIOR - Fire User Defined Event 1005
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);          //OPTIONAL BEHAVIOR - Fire User Defined Event 1006
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DISTURBED);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1008
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_COMBAT_ROUND_END); //OPTIONAL BEHAVIOR - Fire User Defined Event 1003
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE);         //OPTIONAL BEHAVIOR - Fire User Defined Event 1004
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DEATH);            //OPTIONAL BEHAVIOR - Fire User Defined Event 1007
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DISTURBED);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1008
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_BLOCKED);          //OPTIONAL BEHAVIOR - Fire User Defined Event 1009
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_FORCE_AFFECTED);   //OPTIONAL BEHAVIOR - Fire User Defined Event 1010
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END);     //OPTIONAL BEHAVIOR - Fire User Defined Event 1011

    //****** BEGIN DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) ******
    GN_SetDayNightPresence(AMBIENT_PRESENCE_ALWAYS_PRESENT);
    // This function although poorly named sets up the listening patterns and other
    // important data for the creature it should never be removed.
    GN_SetListeningPatterns();
    SetLocalNumber(OBJECT_SELF, 11, 6);// FAK - OEI default turret cooldown
    //****** END DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) ******

    //****** TREASURE PLACEMENT
    //no treasure

    //****** TURN ON WALKPOINTS ******
    // The following line causes the object to follow waypoints
    GN_WalkWayPoints();
}
