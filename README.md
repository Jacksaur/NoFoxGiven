# NoFoxGiven
Automated script to remove all traces of Snap, including reinstalling a standalone version of Firefox. Designed for single-user Kubuntu installations.
This is my first script I'm making publically available. I have zero actual code knowledge and just put it together as I went. I'm certain elements can be done better and I've probably made amaturish mistakes in places. Any suggestions or improvements are welcome.

This script will download the latest [Standalone version of Firefox from Mozilla](https://www.mozilla.org/en-GB/firefox/all/#product-desktop-release), uninstall all Snaps installed by default, then remove Snap itself and mark it to be held back: Preventing any further snaps from being installed in future.
This script is designed for use with Kubuntu 22.04 and above. It is untested on any other distro. It is also completely untested on systems with more than one user account. To my knowledge, this means that all accounts other than the one running the script will be without a web browser, and will have to install one themselves. Use with caution.

# Backup your Firefox profile or you will lose everything!
Your Firefox profile contains the vast majority of your browser customizations. This includes your Bookmarks, History, Cookies, Positions of UI elements, any userchrome.css tweaks and installed addons. Addons' own settings are not saved. I'm afraid you'll have to reimplement those yourself.
You can back up your profile by navigating to *about:profiles*, and finding the profile marked as "Currently in use and cannot be deleted". Rename it to make it easier to locate, then click the Open Folder button in its Root Directory row. Copy the profile's entire folder and keep it somewhere safe.

After you've run the script, open your newly installed Standalone Firefox, go to *about:profiles* again, open any profile's Root folder, and move up a directory. And paste the profile folder you backed up earlier here. You may need to restart Firefox to get it to appear in the profiles menu, but once it does choose *Set as Default Profile* and restart. Almost everything should now be in the same state as it was with your old version of Firefox, but again, you'll need to reconfigure your individual Addons.

# Installation and Usage
Ensure Curl is installed on your system.
Backup your profile as described above. Download the latest release and unzip it all to a folder. Right click on the script, go to properties, permissions, and tick *Is Executable*. Right click the script and choose Run in Konsole (or whichever Terminal Emulator you use). After the script finishes, restore your Profile backup as described above.
