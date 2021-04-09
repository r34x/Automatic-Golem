Automatic-Golem

Author: Adam Mayfield

Date: 1 April 2021

Video Walkthrough: https://youtu.be/X-nzNbmug2U

This installer does several things, which are all optional. You can:
  - update the Linux system
  - install SSH and enable it on port 22
  - install the Golem Provider node
  - add the provider process as a service, so that it starts when the machine is booted
  - start the service
  - install Netdata, a free, open source system monitoring tool. More info at https://www.netdata.cloud/
  - launch Firefox and open the Netdata dashboard, if installed
  - continuously monitor the status of the provider node
  - restart the Golem provider if errors are thrown.


Installation instructions: 
  - download the GolemDeploy.sh script, golemsp.service and restartjobs.sh files
  -  copy to your Linux node 
  -  place golemsp.service in /etc/systemd/system and /etc/systemd/system/multi-user.target.wants
  -  edit golemsp.service to include the local username of the user that logs into the machine
  -  run GolemDeploy.sh by opening a terminal navigating to the script and typing ./GolemProvider.sh
  -  The script will handle the rest and walk you through each step.  
