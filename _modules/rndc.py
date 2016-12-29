import salt.utils
import salt.utils
from salt.state import STATE_INTERNAL_KEYWORDS as _STATE_INTERNAL_KEYWORDS
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

def status(server=None,key=None):
    cmd = '{0}'.format(_rndc_cmd())
    if server is not None:
        cmd = _add_option(cmd,'-s {0}'.format(server))
    if key is not None:
        cmd = _add_option(cmd,'-k {0}'.format(key))
    cmd = _add_option(cmd,'status')
    return __salt__['cmd.run'](cmd).split()


def reload(zone=None,view=None,server=None, key=None):
    cmd = '{0}'.format(_rndc_cmd())
    if server is not None:
        cmd = _add_option(cmd,'-s {0}'.format(server))
    if key is not None:
        cmd = _add_option(cmd,'-k {0}'.format(key))
    cmd = _add_option(cmd,'reload')
    if zone is not None:
        cmd = _add_option(cmd,zone)
    if view is not None:
        cmd - _add_option(cmd,'in {0}'.format(view))
    return __salt__['cmd.run'](cmd)
