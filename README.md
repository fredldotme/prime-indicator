PRIME Indicator
==============
Indicator applet for Ubuntu 14.04 laptop users with NVIDIA/Intel switchable graphics
This indicator has only been tested on Ubuntu 14.04 but should be working just as well
on 12.04 with the newest hardware enablement stack.
Apply Google magic in case you want to use this on a version other than 14.04.

This indicator applet allows owners of laptops with NVIDIA/Intel hybrid graphics to
quickly switch between the graphics cards and log out from within the Unity top panel in seconds.


Prerequisites
==============
You have to have a few packages installed on your Ubuntu box to take advantage of this indicator.
Make sure you have the NVIDIA driver >=331.20 installed and the additional package called "nvidia-prime".
In case the indicator doesn't start because it is missing the python module "appindicator",
again, make sure to install missing packages. To install all needed dependencies:

sudo apt-get install nvidia-prime nvidia-331 nvidia-settings python-appindicator


How to install
==============

chmod a+x setup.sh
sudo ./setup.sh
