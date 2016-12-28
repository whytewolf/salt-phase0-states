import salt.utils
import salt.utils
from salt.state import STATE_INTERNAL_KEYWORDS as _STATE_INTERNAL_KEYWORDS
from salt.exceptions import SaltException
from salt.ext import six

def __virtual__():
    if not salt.utils.which('rndc'):
        return(False, 'the rndc execution module cannot be loaded: rndc is not installed')
    return true

def _rndc_cmd():
    return salt.utils.which('rndc')

def reload():
    cmd = '{0} reload' . format(_rndc_cmd())
    return salt['cmd.run'](cmd).split()
