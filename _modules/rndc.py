import salt.utils
from salt.exceptions import SaltException
from salt.ext import six

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
        cmd - _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def refresh(zone,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'refresh')
    cmd = _add_option(cmd,zone)
    if view is not None:
        cmd - _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def retransfer(zone,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'retransfer')
    cmd = _add_option(cmd,zone)
    if view is not None:
        cmd - _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def sign(zone,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'sign')
    cmd = _add_option(cmd,zone)
    if view is not None:
        cmd - _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def loadkeys(zone,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'loadkeys')
    cmd = _add_option(cmd,zone)
    if view is not None:
        cmd - _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def freeze(zone=None,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'freeze')
    if zone is not None:
        cmd = _add_option(cmd,zone)
    if view is not None:
        cmd - _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def thaw(zone=None,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'thaw')
    if zone is not None:
        cmd = _add_option(cmd,zone)
    if view is not None:
        cmd - _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def sync(zone=None,clean=False,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'sync')
    if clean:
        cmd = _add_option(cmd,'--clean')
    if zone is not None:
        cmd = _add_option(cmd,zone)
    if view is not None:
        cmd - _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def notify(zone,view=None,server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'notify')
    cmd = _add_option(cmd,zone)
    if view is not None:
        cmd - _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)

def reconfig(server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'reconfig')
    return __salt__['cmd.run'](cmd)

def stats(server=None,key=None):
    cmd = _auth_options(server,key)
    cmd = _add_option(cmd,'stats')
    return __salt__['cmd.run'](cmd)


