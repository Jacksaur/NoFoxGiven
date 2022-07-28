#!/bin/bash
echo "NoFoxGiven: Browser Install Only script"
sleep 2
echo "This script will install the standalone version of Firefox provided by Mozilla. It will not do anything else."
echo "This script only affects the current user. You will have to run it again on any other accounts you want to install to."
echo "Press Enter to continue."
read

echo "Now downloading latest Standalone Firefox build"
#Direct download link to latest Firefox version from Mozilla
wget -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
echo "Extracting..."
tar xjf firefox.tar.bz2
rm -r ./firefox.tar.bz2
echo "Moving files and adding Launcher entry. You will be asked for your sudo pass."
sleep 5
mv ./firefox ~/opt/Firefox
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
echo "Installation complete! Firefox can be located inside the /opt folder."
echo "Due to how Kubuntu handles .local, You won't be able to run Firefox through Terminal until you reload your profile by logging out."
echo
echo "Script complete! Your desktop may refresh at some point once KDE Plasma notices the change in applications. You can now close this terminal."
read
exit
