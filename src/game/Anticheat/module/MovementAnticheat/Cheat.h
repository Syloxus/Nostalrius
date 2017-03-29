#ifndef _HEADER_CHEATS
#define _HEADER_CHEATS

#include <ace/Null_Mutex.h>
#include <ace/Singleton.h>
#include <vector>
#include <map>

#include "Common.h"
#include "Unit.h" // For MovementInfo
#include "Anticheat.h"

enum CheatType
{
    CHEAT_TYPE_WALL_CLIMB           = 0,
    CHEAT_TYPE_WATER_WALK           = 1,
    CHEAT_TYPE_FORBIDDEN            = 2,
    CHEAT_TYPE_BG_NOT_STARTED       = 3,
    CHEAT_TYPE_MULTIJUMP            = 4,
    CHEAT_TYPE_FALL_UP              = 5,
    CHEAT_TYPE_PVE_FLYHACK          = 6,
    CHEAT_TYPE_TIME_BACK            = 7,
    CHEAT_TYPE_OVERSPEED_JUMP       = 8,
    CHEAT_TYPE_JUMP_SPEED_CHANGE    = 9,
    CHEAT_TYPE_FLY_HACK_SWIM        =10,
    CHEAT_TYPE_NULL_CLIENT_TIME     =11,
    CHEAT_TYPE_ROOT_MOVE            =12,
    CHEAT_TYPE_ROOT_IGNORED         =13,
    CHEAT_TYPE_OVERSPEED_DIST       =14,
    CHEAT_TYPE_DESYNC               =15,
    CHEAT_TYPE_MOVE_STOP            =16,
    CHEAT_TYPE_EXPLORE              =17,
    CHEAT_TYPE_EXPLORE_HIGH_LEVEL   =18,
    CHEAT_TYPE_OVERSPEED_Z          =19,
    CHEAT_TYPE_SKIPPED_HEARTBEATS   =20,
    CHEAT_TYPE_NUM_DESYNC           =21,
    CHEAT_TYPE_FAKE_TRANSPORT       =22,
    CHEAT_TYPE_TELE_TO_TRANSPORT    =23,
    CHEAT_TYPE_SLOW_FALL            =24,
    CHEATS_COUNT
};

#define CHEATS_UPDATE_INTERVAL      4000
// Time between server sends stun, and client is actually stunned
#define ALLOWED_ACK_LAG             2000
const char* GetCheatTypeNameFromFlag(CheatType type);


class ChatHandler;
class PlayerCheatData;

struct CheatSanctions
{
    uint32 cheatType;
    uint32 tickCount;
    uint32 tickSanction;
    uint32 totalCount;
    uint32 totalSanction;
    std::string comment;
};

/// Donnees statiques.
class PlayerCheatsMgr
{
    friend class ACE_Singleton<PlayerCheatsMgr, ACE_Null_Mutex>;
    public:
        void LoadConfig();
        void LoadFromDB();
        CheatAction ComputeCheatAction(PlayerCheatData* cheatData, std::stringstream& reason) const;
        std::vector<CheatSanctions> _sanctions;
        // Config.
        bool EnableAnticheat()         const { return _enabled;       }
        bool EnableAntiMultiJumpHack() const { return _antiMultiJump; }
        bool EnableAntiSpeedHack()     const { return _antiSpeedHack; }
        bool EnableAntiSpeedHackInterpolation() const { return _antiSpeedHackInterp; }
        bool EnableAntiWallClimbing()  const { return _antiWallClimb; }
        bool EnableDataLog()     const { return _logDatas; }
        uint32 AnnounceCheatMask()     const { return _announceCheatMask; }
        uint32 NotifyCheaters()        const { return _notifyCheaters; }
        int32 GetMaxAllowedDesync()    const { return _maxAllowedDesync; }
    protected:
        // Configuration
        bool _enabled;
        bool _antiMultiJump;
        bool _antiSpeedHack;
        bool _antiSpeedHackInterp;
        bool _antiWallClimb;
        bool _logDatas;
        uint32 _announceCheatMask;
        int32 _maxAllowedDesync;
        uint32 _notifyCheaters;
};

#define sCheatsMgr ACE_Singleton<PlayerCheatsMgr, ACE_Null_Mutex>::instance()

class Player;
class Unit;
class WorldSession;
class WorldPacket;

class ServerOrderData
{
    public:
        ServerOrderData(uint32 serv, uint32 resp) : serverOpcode1(serv), serverOpcode2(0), clientResp(resp), lastSent(0), lastRcvd(0), counter(0) {}
        ServerOrderData(uint32 serv1, uint32 serv2, uint32 resp) : serverOpcode1(serv1), serverOpcode2(serv2), clientResp(resp), lastSent(0), lastRcvd(0), counter(0) {}

        uint32 serverOpcode1;
        uint32 serverOpcode2;
        uint32 clientResp;

        uint32 lastSent;
        uint32 lastRcvd;
        int32 counter;
};

class PlayerCheatData: public PlayerAnticheatInterface
{
    public:
        explicit PlayerCheatData(Player* _me) : me(_me), _jumpInitialSpeed(0.0f), _overspeedDistance(0),
                                       _inKnockBack(false), _maxOverspeedDistance(0),
                                       _jumpcount(0), _clientDesynchro(0), _maxClientDesynchro(0), updateCheckTimer(0),
                                       _storeCheatFlags(0)
        {
            for (int i = 0; i < MAX_MOVE_TYPE; ++i)
                _clientSpeeds[i] = 0.0f;
        }

        void Init();
        bool IsInKnockBack() const { return _inKnockBack; }
        void KnockBack(float speedxy, float speedz, float cos, float sin);

        /// STATS
        uint32 updateCheckTimer;
        uint32 cheatOccuranceTick[CHEATS_COUNT];    // per anticheat tick (not world/map tick)
        uint32 cheatOccuranceTotal[CHEATS_COUNT];

        void AddCheats(uint32 cheats, uint32 count = 1);
        void Unreachable(Unit* attacker);
        void StoreCheat(uint32 type, uint32 count=1);
        void HandleCommand(ChatHandler* handler) const;
        void CountCheatOccur(uint32 type, uint32& tickCount, uint32& totalCount) const;
        CheatAction Update(uint32 diff, std::stringstream& reason);
        CheatAction Finalize(std::stringstream& reason);
        bool HandleAnticheatTests(MovementInfo& movementInfo, WorldSession* session, WorldPacket* packet);
        bool HandleSpeedChangeAck(MovementInfo& movementInfo, WorldSession* session, WorldPacket* packet, float newSpeed);
        void InitSpeeds(Unit* unit);
        float GetClientSpeed(UnitMoveType m) const { return _clientSpeeds[m]; }

        void OrderSent(WorldPacket const* data);
        void CheckForOrderAck(uint32 opcode);

        bool InterpolateMovement(MovementInfo const& mi, uint32 diffMs, float &x, float &y, float &z, float &o);
        bool GetMaxAllowedDist(MovementInfo const& mi, uint32 diffMs, float &dxy, float &dz);
        MovementInfo& GetLastMovementInfo();
        void OnExplore(AreaEntry const* p);
        virtual void OnTransport(Player* plMover, ObjectGuid transportGuid);

        bool IsTeleportAllowed(MovementInfo const& movementInfo, float& distance);
        bool CheckTeleport(uint32 opcode, MovementInfo& movementInfo);
        bool IsWallClimb(MovementInfo const& movementInfo);

        uint32 _storeCheatFlags;

        uint32 _jumpcount;
        int32 _clientDesynchro;
        float _jumpInitialSpeed;
        float _overspeedDistance;
        bool _inKnockBack;
        float  _clientSpeeds[MAX_MOVE_TYPE];
        std::vector<ServerOrderData> _orders; // Packets sent by server, triggering *_ACK from client
        Player* me;
        // Logs
        float _maxOverspeedDistance;
        uint32 _maxClientDesynchro;
        float m_MoveDist;
        float m_DeltaZ;
};

#endif
