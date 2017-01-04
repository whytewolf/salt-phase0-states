import os
import logging
import salt.utils
from salt.exceptions import SaltException
from salt.ext import six

log = logging.getLogger(__name__)


def __virtual__():
    if not salt.utils.which('rndc'):
        return(False, 'the rndc execution module cannot be loaded: rndc is not installed')
    return True

def _rndc_cmd():
    return salt.utils.which('rndc')

def _add_option(cmd,option):
    return cmd + ' {0}'.format(option)

def _auth_options(server=None,key=None):
    cmd = '{0}'.format(_rndc_cmd())
    if server is not None:
        cmd = _add_option(cmd,'-s {0}'.format(server))
    if key is not None:
        cmd = _add_option(cmd,'-k {0}'.format(key))
    return cmd


def status(server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'status')
    return __salt__['cmd.run'](cmd)


def reload(zone=None,view=None,server=None, key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'reload')
    if zone is not None:
        cmd = _add_option(cmd,zone)
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def refresh(zone,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'refresh')
    cmd = _add_option(cmd,zone)
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def retransfer(zone,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'retransfer')
    cmd = _add_option(cmd,zone)
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def sign(zone,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'sign')
    cmd = _add_option(cmd,zone)
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def loadkeys(zone,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'loadkeys')
    cmd = _add_option(cmd,zone)
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def freeze(zone=None,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'freeze')
    if zone is not None:
        cmd = _add_option(cmd,zone)
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def thaw(zone=None,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'thaw')
    if zone is not None:
        cmd = _add_option(cmd,zone)
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def sync(zone=None,clean=False,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'sync')
    if clean:
        cmd = _add_option(cmd,'--clean')
    if zone is not None:
        cmd = _add_option(cmd,zone)
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def notify(zone,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'notify')
    cmd = _add_option(cmd,zone)
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def reconfig(server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'reconfig')
    return __salt__['cmd.run'](cmd)

def stats(server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'stats')
    return __salt__['cmd.run'](cmd)

def querylog(status='toggle',server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'querylog')
    if status.lower() != 'toggle':
        cmd = _add_option(cmd,status)
    return __salt__['cmd.run'](cmd)

def dumpdb(db='cache',view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'dumpdb')
    if db.lower() == 'zone':
        cmd = _add_option(cmd,'--zone')
    elif db.lower() == 'all':
        cmd = _add_option(cmd,'--all')
    else:
        cmd = _add_option(cmd,'--cache')
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def secroots(view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'secroots')
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def stop(server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'stop -p')
    pid = __salt__['cmd.run'](cmd)
    pid = int(pid[5:])
    iterator = 0
    while(True):
        iterator=iterator+1
        try:
            os.kill(pid,0)
        except OSError:
            return 'named service at pid {0} stopped'.format(pid)
        if iterator >= 100:
            log.debug('too many iterations waiting for pid: {0}'.format(pid))
            return (False,'named service at pid {0} has not stopped'.format(pid))

def halt(server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'halt -p')
    pid = __salt__['cmd.run'](cmd)
    pid = int(pid[5:])
    iterator = 0
    while(True):
        iterator=iterator+1
        try:
            os.kill(pid,0)
        except OSError:
            return 'named service at pid {0} stopped'.format(pid)
        if iterator >= 100:
            log.debug('too many iterations waiting for pid: {0}'.format(pid))
            return (False,'named service at pid {0} has not stopped'.format(pid))

def trace(level=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'trace')
    if level is not None:
        cmd = _add_option(cmd,level)
    return __salt__['cmd.run'](cmd)

def notrace(server=None,key=None):
    return trace(level=0,server=server,key=key)

def flush(server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'flush')
    return __salt__['cmd.run'](cmd)

def flushname(name,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'flushname {0}'.format(name))
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def flushtree(name,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'flushtree {0}'.format(name))
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def recursing(server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'recursing')
    return __salt__['cmd.run'](cmd)

def validation(state,view=None,sserver=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'validation')
    if state == 'on':
        cmd = _add_option(cmd,'on')
    elif state =='off':
        cmd = _add_option(cmd,'off')
    else:
        cmd = _add_option(cmd,'check')
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def tsig_list(server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'tsig-list')
    return __salt__['cmd.run'](cmd)

def tsig_delete(keyname,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'tsig-delete')
    cmd = _add_option(cmd,keyname)
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def addzone(zone,config,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'addzone')
    cmd = _add_option(cmd,zone)
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    cmd = _add_option(cmd,config)
    return __salt__['cmd.run'](cmd)

def delzone(zone,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'addzone')
    cmd = _add_option(cmd,zone)
    if view is not None:
        cmd = _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

# TODO
# signing function
