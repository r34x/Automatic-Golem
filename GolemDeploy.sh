# Golem Provider Autoconfig
    #Author: R4X
    #Date: 29 March 2021
    #Version: 0.1
read -p "Welcome to the Golem Provider installer! This program will automatically download the provider and start it for you plus give you the option to do some other useful things. Press ENTER when you're ready to start."
echo "Do you want to update your system before installing the Golem Provider?"
 select yn in "Yes" "No"; do
     case $yn in
         Yes ) sudo apt update -y && sudo apt full-upgrade -y; break;;
         No ) echo "That's OK! Let's continue."; break;;
     esac
 done
echo "Do you want to install SSH? This is useful for remoting into your provider from another system over port 22."
 select yn in "Yes" "No"; do
     case $yn in
         Yes ) sudo apt install openssh-server -y && sudo systemctl restart ssh && sudo ufw allow ssh; break;;
         No ) echo "That's OK! You can install SSH anytime by running 'sudo apt install openssh-server && sudo systemctl restart ssh && sudo ufw allow ssh'."; break;;
     esac
 done
 echo "We will now check for existing installations and delete them. Do you need to back up your keys first?"
 select yn in "Yes" "No"; do
     case $yn in
         Yes ) echo "Please back up your keys and restart the installer when you're finished"; exit;;
         No ) rm -rf $HOME/.local/share/{yagna,ya-provider}; break;;
     esac
 done 
read -p "Press Enter to Download and install the Golem Provider."
curl -sSf https://join.golem.network/as-provider | bash -
read -p "Installation of the Golem Provider is now complete! Press Enter to export path to .bashrc."
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.local/bin:$PATH"
echo "Do you wish to start the provider as a service when it reboots? This is useful if the provider hangs and you must restart the machine."
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo systemctl enable golemsp.service && sudo systemctl start golemsp.service; break;;
        No ) golemsp run; break;;
    esac
done
echo "Do you wish to install Netdata, a really useful performance monitoring tool? NOTE: This will take a few minutes."
select yn in "Yes" "No"; do
    case $yn in
        Yes ) bash <(curl -Ss https://my-netdata.io/kickstart.sh) --dont-wait &>/dev/null; echo "Now installing. Please wait..."; break;;
        No ) echo "That's OK! Let's continue."; break;;
    esac
done
echo "Are you ready to monitor Golem? If you select Yes, a new window will open. Please switch back to this window to complete the final steps."
select yn in "Yes" "No"; do
    case $yn in
        Yes )gnome-terminal -- watch -c golemsp status; break;;
        No ) echo "No problem! You can monitor the Golem provider by running 'golemsp status;."; break;;
    esac
done
echo "Did you install Netdata? If you select yes, a browser will open and direct you to the monitoring page for this system."
select yn in "Yes" "No"; do
    case $yn in
        Yes ) gnome-terminal -- firefox http://localhost:19999; echo "Complete! You may now close this window."; break;;
        No ) echo "That's OK! You can install it anytime by running bash <(curl -Ss https://my-netdata.io/kickstart.sh"; break;;
    esac
done
sudo chmod +x /home/<user>/Documents/Automatic-Golem-main/restartjobs.sh &&./restartjobs.sh
