# NoFoxGiven
Automated script to remove all traces of Snap, including reinstalling a standalone version of Firefox. Designed for Kubuntu.

This script will download the latest [Standalone version of Firefox from Mozilla](https://www.mozilla.org/en-GB/firefox/all/#product-desktop-release), uninstall all Snaps installed by default, then remove Snap itself and mark it to be held back: Preventing any further snaps from being installed in future.
This script is designed for use with Kubuntu 22.04 and above. It is untested on any other distro, and I do not recommend trying, as it removes a GNOME component.

# Backup your Firefox profile or you will lose everything!
Your Firefox profile contains the vast majority of your browser customizations. This includes positions of UI elements, any userchrome.css tweaks, installed addons, bookmarks, history and cookies. Addons' own settings are not saved. I'm afraid you'll have to reimplement those yourself.
You can back up your profile by navigating to *about:profiles*, and finding the profile marked as "Currently in use and cannot be deleted". Rename it to make it easier to locate, then click the Open Folder button in its Root Directory row. Copy the entire profile's folder and move it somewhere safe.

When running the newly installed Standalone Firefox, go to *about:profiles* again, open any profile's Root folder, and move up a directory. And paste the profile folder you backed up earlier here. You may need to restart Firefox to get it to appear in the profiles menu, but once it does choose *Set as Default Profile* and restart.
