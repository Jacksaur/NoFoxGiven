#!/bin/bash
echo "NoFoxGiven Snap removal and replacement script for Firefox."
echo "WARNING: If you have not backed up your Firefox profile, **EVERYTHING WILL BE LOST**. Close this command prompt and check the Github page for instructions on how to do so. Otherwise, press Enter to continue."
read

#Check if Curl is installed, and abort if not.
if ! command -v curl &> /dev/null
then
    echo "curl is not installed on your system. Install it first with sudo apt install curl, then restart this script."
    read
    exit
fi

echo "Now downloading latest Standalone Firefox build"
#Direct download link to latest Firefox version from Mozilla
curl -L -o firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
echo "Extracting..."
tar xjf firefox.tar.bz2
rm -r ./firefox.tar.bz2
echo "Moving files and adding Launcher entry. You will be asked for your sudo pass."
sleep 5
mv ./firefox ~/.local/share/Firefox
#Create /bin file to allow launching through Terminal, whilst still applying KDE Filepicker tweak
mkdir -p ~/.local/bin/
touch ~/.local/bin/firefox
echo "#!/bin/bash" > ~/.local/bin/firefox
echo "GTK_USE_PORTAL=1 ~/.local/share/Firefox/firefox" >> ~/.local/bin/firefox
#Copy Icons and .desktop file to their proper places
sudo rsync -a ./icons /usr/share
mkdir -p ~/.local/share/applications/
mv ./Firefox.desktop ~/.local/share/applications/
rm -r ./icons
chmod +x ~/.local/share/applications/Firefox.desktop
echo
echo "Installation complete! Firefox can be located in your home directory, inside .local/share."
echo "Your desktop may refresh at some point once KDE notices the change in application entries."
echo "Proceeding to remove Snap..."
sleep 7
#Snap commands now require Root permissions, or they'll pop up a Polkit window every time.
sudo snap remove gtk-common-themes
sudo snap remove bare
sudo snap remove gnome-3-38-2004
sudo snap remove firefox
sudo snap remove core20
sudo snap remove snapd
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
echo "Script complete. You can now close this terminal."
read
exit
