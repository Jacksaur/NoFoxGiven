#!/bin/bash
echo "Now downloading latest Standalone Firefox build"
curl -L -o firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-GB"
echo "Extracting..."
tar xjf firefox.tar.bz2
rm -r ./firefox.tar.bz2
echo "Moving files to /opt and adding Launcher entry. You will be asked for your sudo pass."
sleep 3
sudo mv ./firefox /opt/Firefox
sudo mv ./firefox.desktop /usr/share/applications/
chmod +x /usr/share/applications/firefox.desktop
echo "Installation complete! *You may need to set your default browser and unpin/pin Firefox again*"
echo "Proceeding to remove Snap..."
sleep 5
snap remove gtk-common-themes
snap remove bare
snap remove gnome-3-38-2004
snap remove firefox
snap remove core20
snap remove snapd
sudo apt purge -y snapd
rm -rf ~/snap
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/cache/snapd/
sudo rm -rf /var/lib/snapd
sudo apt-mark hold snapd
echo "Removal complete! Snap has also been marked to be held back."
echo "Script complete. Press Enter to exit."
read
exit
