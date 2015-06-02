#!/usr/bin/env python

# Rename current workspace name "?" to "workspace_num: str",
# if str is null, then reset the workspace name to "workspace_num".
# Shortcut compatibility is preserved via "workspace number X" in .i3/config

import i3
import subprocess


def get_current_workspace():
    workspaces = i3.get_workspaces()
    w = [w for w in workspaces if w['focused']]

    return w[0]


def get_name():
    dmenu = subprocess.Popen(
        '~/bin/dmenu_wrapper "New name"',
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        shell=True
    )
    output = dmenu.communicate()[0]

    return output.decode().rstrip(), dmenu.returncode


def main():
    name, r = get_name()
    w = get_current_workspace()

    if r == 1:
        return

    if name:
        # new name for workspace
        i3.command("rename workspace to \"%d: %s\"" % (w['num'], name))
    elif not w['name'].isdigit():
        # revert back to number
        i3.command("rename workspace to \"%d\"" % w['num'])


if __name__ == '__main__':
    main()
