module Meridian;

export {
    redef enum Notice::Type += {
        Possible_Beacon
    };
}

global conn_count: table[addr, addr] of count &default=0 &create_expire=5min;

event connection_state_remove(c: connection)
{
    local orig = c$id$orig_h;
    local resp = c$id$resp_h;
    ++conn_count[orig, resp];

    if ( conn_count[orig, resp] >= 5 )
    {
        NOTICE([$note=Possible_Beacon,
                $msg=fmt("Possible beacon: %s -> %s (%d connections in window)",
                        orig, resp, conn_count[orig, resp]),
                $src=orig, $dst=resp]);
        conn_count[orig, resp] = 0;
    }
}
