#!/usr/bin/python
import re, subprocess
from subprocess import check_output

def get_keychain_pass(account=None, server=None):
    params = {
        'security': '/usr/bin/security',
        'command': 'find-internet-password',
        'account': account,
        'server': server,
        'keychain': '/Volumes/DATA/Users/euclide/Library/Keychains/login.keychain',
    }
    command = "sudo -u euclide %(security)s %(command)s -w -a %(account)s -s %(server)s %(keychain)s" % params
    # command = "security find-internet-password -w -a %(account)s -s %(server)s" % params
    return subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)

from subprocess import check_output

def get_gpg_pass():
    return check_output("gpg -dq ~/.mutt/.msmtp-uml.gpg", shell=True).strip("\n")

def get_pass(account):
    return check_output("pass email/" + account, shell=True).splitlines()[0]

