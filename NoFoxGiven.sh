#!/bin/bash
echo "NoFoxGiven Snap removal and replacement script for Firefox."
sleep 2
echo "This version of the script installs to /opt. The permissions are weird, I very much do not recommend using this version on multi user systems."
echo "WARNING: If you have not backed up your Firefox profile, **EVERYTHING WILL BE LOST**. Close this command prompt and check the Github page for instructions on how to do so. Otherwise, press Enter to continue."
read

echo "Now downloading latest Standalone Firefox build"
#Direct download link to latest Firefox version from Mozilla
wget -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
echo "Extracting..."
tar xjf firefox.tar.bz2
rm -r ./firefox.tar.bz2
echo "Moving files and adding Launcher entry. You will be asked for your sudo pass."
sleep 5
sudo mv ./firefox /opt/Firefox
sudo chown $USER /opt/Firefox
#Create /bin file to allow launching through Terminal, whilst still applying KDE Filepicker tweak
mkdir -p ~/.local/bin
touch ~/.local/bin/firefox
echo "#!/bin/bash" > ~/.local/bin/firefox
echo "GTK_USE_PORTAL=1 /opt/Firefox/firefox" >> ~/.local/bin/firefox
chmod +x ~/.local/bin/firefox
#Copy Icons and .desktop file to their proper places
sudo rsync -a ./icons /usr/share
mkdir -p ~/.local/share/applications/
mv ./Firefox.desktop ~/.local/share/applications/
rm -r ./icons
chmod +x ~/.local/share/applications/Firefox.desktop
echo
echo "Installation complete! Firefox can be located in the /opt folder."
echo "Your desktop may refresh at some point once KDE notices the change in application entries."
echo

echo "Proceeding to remove Snap..."
sleep 7
#Uninstalling Snap through Apt causes it to automatically uninstall all snaps first, so Snap remove commands aren't needed
sudo apt purge -y snapd
sudo apt purge -y libsnapd-qt1
rm -rf ~/snap
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/cache/snapd/
sudo rm -rf /var/lib/snapd
sudo apt remove --purge plasma-discover-backend-snap
sudo apt-mark hold snapd
echo
echo "Removal complete! Snap has also been marked to be held back."
echo "Due to how Kubuntu handles .local, You won't be able to run Firefox through Terminal until you reload your profile by logging out."
echo "Script complete. You can now close this terminal."
read
exit
