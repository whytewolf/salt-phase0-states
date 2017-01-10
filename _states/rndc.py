import os
import logging
import salt.utils

def __virtual__():
    if not salt.utils.which('rndc'):
        return(False, 'the rndc state module cannot be loaded: rndc is not installed')
    return 'rndc.addzone' in __salt__

def zone_present(name,config,):


def zone_absent():

def reload():

def mod_watch(name,**kwargs):
