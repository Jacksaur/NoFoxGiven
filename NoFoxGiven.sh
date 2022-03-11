#!/bin/bash
echo "NoFoxGiven Snap removal and replacement script for Firefox."
echo "WARNING: If you have not backed up your Firefox profile, *EVERYTHING WILL BE LOST*. Close this command prompt and check the Github page for instructions on how to do so. Otherwise, press Enter to continue."
read
echo "Now downloading latest Standalone Firefox build"
curl -L -o firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-GB"
echo "Extracting..."
tar xjf firefox.tar.bz2
rm -r ./firefox.tar.bz2
echo "Moving files to /opt and adding Launcher entry. You will be asked for your sudo pass."
sleep 3
sudo mv ./firefox /opt/Firefox
sudo rsync -a ./icons /usr/share
sudo mv ./Firefox.desktop /usr/share/applications/
sudo rm -r ./icons
chmod +x /usr/share/applications/Firefox.desktop
echo "Installation complete!"
echo "Proceeding to remove Snap..."
sleep 5
snap remove gtk-common-themes
snap remove bare
snap remove gnome-3-38-2004
snap remove firefox
snap remove core20
snap remove snapd
sudo apt purge -y snapd
sudo apt purge -y libsnapd-qt1
rm -rf ~/snap
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/cache/snapd/
sudo rm -rf /var/lib/snapd
sudo apt-mark hold snapd
echo "Removal complete! Snap has also been marked to be held back."
echo "Script complete. You can now close this terminal."
read
