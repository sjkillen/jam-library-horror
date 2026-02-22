/////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Audiokinetic Wwise generated include file. Do not edit.
//
/////////////////////////////////////////////////////////////////////////////////////////////////////

#ifndef __WWISE_IDS_H__
#define __WWISE_IDS_H__

#include <AK/SoundEngine/Common/AkTypes.h>

namespace AK
{
    namespace EVENTS
    {
        static const AkUniqueID PLAY_AMB_ROOMTONE_01 = 3409423522U;
        static const AkUniqueID PLAY_FX_BOOK_CLOSE = 3669637265U;
        static const AkUniqueID PLAY_MONSTER_AMBIENCE = 2841926335U;
        static const AkUniqueID PLAY_MONSTER_FOOTSTEPS_TRIGGER = 4113655641U;
        static const AkUniqueID PLAY_MONSTER_VOICE = 3220761187U;
        static const AkUniqueID PLAY_PAGE_TURN = 786024383U;
        static const AkUniqueID PLAY_PLAYERFOOTSTEPS = 1805011878U;
        static const AkUniqueID PLAY_READINGTENSION = 2703007992U;
        static const AkUniqueID PLAY_SOUND_HELMET_TRIGGER = 2806865160U;
        static const AkUniqueID PLAY_TENSIONLAYER = 176160403U;
    } // namespace EVENTS

    namespace STATES
    {
        namespace IS_CLOSE
        {
            static const AkUniqueID GROUP = 2535049496U;

            namespace STATE
            {
                static const AkUniqueID FALSE = 2452206122U;
                static const AkUniqueID NONE = 748895195U;
                static const AkUniqueID TRUE = 3053630529U;
            } // namespace STATE
        } // namespace IS_CLOSE

        namespace IS_READING
        {
            static const AkUniqueID GROUP = 1865477056U;

            namespace STATE
            {
                static const AkUniqueID FALSE = 2452206122U;
                static const AkUniqueID NONE = 748895195U;
                static const AkUniqueID TRUE = 3053630529U;
            } // namespace STATE
        } // namespace IS_READING

        namespace IS_WALKING
        {
            static const AkUniqueID GROUP = 499154297U;

            namespace STATE
            {
                static const AkUniqueID FALSE = 2452206122U;
                static const AkUniqueID NONE = 748895195U;
                static const AkUniqueID TRUE = 3053630529U;
            } // namespace STATE
        } // namespace IS_WALKING

        namespace IS_WATCHED
        {
            static const AkUniqueID GROUP = 2170747458U;

            namespace STATE
            {
                static const AkUniqueID FALSE = 2452206122U;
                static const AkUniqueID NONE = 748895195U;
                static const AkUniqueID TRUE = 3053630529U;
            } // namespace STATE
        } // namespace IS_WATCHED

    } // namespace STATES

    namespace SWITCHES
    {
        namespace ENEMY_FEEDING
        {
            static const AkUniqueID GROUP = 74444390U;

            namespace SWITCH
            {
                static const AkUniqueID ACID = 3554728690U;
                static const AkUniqueID BREAK = 941442534U;
                static const AkUniqueID DEFAULT = 782826392U;
                static const AkUniqueID GRIND = 3794369557U;
            } // namespace SWITCH
        } // namespace ENEMY_FEEDING

        namespace ENEMY_GROUND
        {
            static const AkUniqueID GROUP = 1991716675U;

            namespace SWITCH
            {
                static const AkUniqueID CARPET = 2412606308U;
                static const AkUniqueID CONCRETE = 841620460U;
                static const AkUniqueID WOOD = 2058049674U;
            } // namespace SWITCH
        } // namespace ENEMY_GROUND

        namespace ENEMY_MOVEMENT
        {
            static const AkUniqueID GROUP = 62399725U;

            namespace SWITCH
            {
                static const AkUniqueID CLIMB_SHELVES = 146520385U;
                static const AkUniqueID DEFAULT = 782826392U;
                static const AkUniqueID SLITHER = 3841889844U;
                static const AkUniqueID STRETCH = 3238454324U;
            } // namespace SWITCH
        } // namespace ENEMY_MOVEMENT

        namespace ENEMY_SOUND
        {
            static const AkUniqueID GROUP = 628798615U;

            namespace SWITCH
            {
                static const AkUniqueID BEAST = 48807190U;
                static const AkUniqueID DEFAULT = 782826392U;
                static const AkUniqueID GHOST = 4023194814U;
                static const AkUniqueID HUMAN = 3887404748U;
            } // namespace SWITCH
        } // namespace ENEMY_SOUND

        namespace PLAYER_GROUND
        {
            static const AkUniqueID GROUP = 2333762356U;

            namespace SWITCH
            {
                static const AkUniqueID CARPET = 2412606308U;
                static const AkUniqueID CONCRETE = 841620460U;
                static const AkUniqueID WOOD = 2058049674U;
            } // namespace SWITCH
        } // namespace PLAYER_GROUND

    } // namespace SWITCHES

    namespace GAME_PARAMETERS
    {
        static const AkUniqueID INTENSITY = 2470328564U;
    } // namespace GAME_PARAMETERS

    namespace BANKS
    {
        static const AkUniqueID INIT = 1355168291U;
        static const AkUniqueID SB_BOOK = 3319143926U;
        static const AkUniqueID SB_MONSTER = 578108693U;
        static const AkUniqueID SB_PLACEHOLDERS = 4245214463U;
    } // namespace BANKS

    namespace BUSSES
    {
        static const AkUniqueID BUS_BINAURAL = 2544162710U;
        static const AkUniqueID BUS_STEREO = 2623433044U;
        static const AkUniqueID MAIN_AUDIO_BUS = 2246998526U;
    } // namespace BUSSES

    namespace AUX_BUSSES
    {
        static const AkUniqueID VERB_ROOM = 3881977292U;
    } // namespace AUX_BUSSES

    namespace AUDIO_DEVICES
    {
        static const AkUniqueID NO_OUTPUT = 2317455096U;
        static const AkUniqueID SYSTEM = 3859886410U;
    } // namespace AUDIO_DEVICES

}// namespace AK

#endif // __WWISE_IDS_H__
