#!/usr/bin/env python

# rename current workspace name "?" to "workspace_num: str"
# if str is null, then reset workspace name to "workspace_num"
# shortcut compatibility is preserved via "workspace number X" in .i3/config

import i3
import subprocess

def get_current_workspace():
	workspaces = i3.get_workspaces()
	w = [w for w in workspaces if w['focused']]

	return w[0]

def get_name():
	dmenu = subprocess.Popen(['dmenu', '-i', '-p', 'New name: '],
			stdin = subprocess.PIPE,
			stdout = subprocess.PIPE)

	return dmenu.communicate("")[0].decode().rstrip()


if __name__ == '__main__':
	name = get_name()
	w = get_current_workspace()

	if name:
		i3.command("rename workspace \"%s\" to \"%d: %s\"" 
						% (w['name'], w['num'], name))
	else:
		i3.command("rename workspace \"%s\" to \"%d\"" % (w['name'], w['num']))
