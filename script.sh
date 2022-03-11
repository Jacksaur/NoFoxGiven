#!/bin/bash
echo "Now downloading latest Standalone Firefox build"
curl -L -o firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-GB"
echo "Extracting...'
tar xjf firefox.tar.bz2
rm -r ./firefox.tar.bz2
Echo "Moving to /opt and adding Launcher entry. You will be asked for your sudo pass."
sudo mv ./firefox /opt/Firefox
sudo mv ./firefox.desktop /usr/share/applications/
chmod 755 /usr/share/applications/firefox.desktop
Echo "Installation complete! *You may need to set your default browser and unpin/pin Firefox again*"
Echo "Proceeding to remove Snap..."
snap remove gtk-common-themes
snap remove bare
snap remove gnome-3-38-2004
Snap remove firefox
Snap remove core20
Snap remove snapd
Sudo apt purge -y snapd
rm -rf ~/snap
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/cache/snapd/
sudo rm -rf /var/lib/snapd
sudo apt-mark hold snapd
Echo "Removal complete! Snap has also been marked to be held back."
Echo "Script complete. Press Enter to exit."
read
exit
