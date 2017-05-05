#!/usr/bin/env python

import os

def ck_datacenter():
    '''
    Return the name of the CK datacenter the minion is located in based on `hostname -f`.
    '''

    # Uses a shell out to `hostname -f` for consistency because the socket can give "incorrect" results.
    # With socketPython will try to use the /etc/hosts entries for this and can end up picking up the
    # wrong name. For example, if your bond0 is 192.168.1.10 and your hosts file looks like:
    #
    #     127.0.0.1 localhost
    #     192.168.1.10 host.we.dont.want.com
    #     192.168.1.10 machine.creditkarma.com
    #
    # The socket will find the `host.we.dont.want.com` and use that, yet `hostname -f` might
    # reveal `machine.creditkarma.com`.

    hostname = os.popen('hostname -f').read()
    grains = {}
    if 'sjc1' in hostname:
        grains['ck_datacenter'] = 'ckwest'
    elif 'iad1' in hostname:
        grains['ck_datacenter'] = 'ckeast'
    else:
        grains['ck_datacenter'] = 'rackspace'
    grains['wolf_datacenter'] = 'test'
    return grains
