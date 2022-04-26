# NoFoxGiven
Automated script to remove all traces of Snap, including reinstalling a standalone version of Firefox.  
This is my first script I'm making publically available. I have zero actual code knowledge and just put it together as I went. I'm certain elements can be done better and I've probably made amaturish mistakes in places. Any suggestions or improvements are welcome.

This script will download the latest [Standalone version of Firefox from Mozilla](https://www.mozilla.org/en-GB/firefox/all/#product-desktop-release), uninstall all Snaps installed by default, then remove Snap itself and mark it to be held back: Preventing any further snaps from being installed in future.
This script is designed for use with Kubuntu 22.04 and above. It is untested on any other distro.

# Backup your Firefox profile or you will lose everything!
Your Firefox profile contains the vast majority of your browser customizations. This includes your Bookmarks, History, Cookies, Positions of UI elements, any userchrome.css tweaks and installed addons. Addons' own settings are not saved. I'm afraid you'll have to reimplement those yourself.
You can back up your profile by navigating to *about:profiles*, and finding the profile marked as "Currently in use and cannot be deleted". Rename it to make it easier to locate, then click the Open Folder button in its Root Directory row. Copy the profile's entire folder and keep it somewhere safe.

After you've run the script, open your newly installed Standalone Firefox, go to *about:profiles* again, open any profile's Root folder, and move up a directory. And paste the profile folder you backed up earlier here. You may need to restart Firefox to get it to appear in the profiles menu, but once it does choose *Set as Default Profile* and restart. Almost everything should now be in the same state as it was with your old version of Firefox, but again, you'll need to reconfigure your individual Addons.

# Installation and Usage
Ensure Curl is installed on your system.  
Backup your profile as described above. Download the latest release and unzip it all to a folder. Right click on the script, go to properties, permissions, and tick *Is Executable*. Right click the script and choose Run in Konsole (or whichever Terminal Emulator you use). After the script finishes, restore your Profile backup as described above.  

# Known Issues
* This script is not designed for multi user systems. If there are multiple user accounts on your system, they will be left without a browser after the script finishes. You can rectify this by running the "Install Firefox Only" script on each account that needs it afterwards.
* This version of Firefox is not able to set itself as the default Browser, and will warn you about doing so every time it starts. You will need to set it yourself through the KDE settings menu, under Default applications. In about:preferences, you can then disable the Default Browser check to stop it from nagging you every time it starts.
