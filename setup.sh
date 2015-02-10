#!/bin/bash
# PRIME Indicator - indicator applet for NVIDIA Optimus laptops
# Copyright (C) 2013 Alfred Neumayer
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run using sudo" 2>&1
	exit 1
else
	mkdir -p /usr/lib/primeindicator
	cp prime-indicator /usr/bin/
	chown root:root /usr/bin/prime-indicator
	chmod 755 /usr/bin/prime-indicator
	cp igpuon /usr/lib/primeindicator/
	cp dgpuon /usr/lib/primeindicator/
	cp intel.png /usr/lib/primeindicator/
	cp nvidia.png /usr/lib/primeindicator/
	chmod a+r /usr/lib/primeindicator/*.png
	chown root:root /usr/lib/primeindicator/igpuon
	chown root:root /usr/lib/primeindicator/dgpuon
	chmod a+x /usr/lib/primeindicator/igpuon
	chmod a+x /usr/lib/primeindicator/dgpuon
	cp prime-indicator-sudoers /etc/sudoers.d/
	chmod 644 /etc/sudoers.d/prime-indicator-sudoers

	read -n1 -p "Autostart PRIME Indicator? (y/N) "
	echo $USER
	if [[ $REPLY == [yY] ]]; then
		mkdir -p $HOME/.config/autostart
		cp prime-indicator.desktop $HOME/.config/autostart
        chown $SUDO_USER:$SUDO_USER $HOME/.config/autostart
        chown $SUDO_USER:$SUDO_USER $HOME/.config/autostart/prime-indicator.desktop
	else
		rm -f $HOME/.config/autostart/prime-indicator.desktop
	fi
fi
