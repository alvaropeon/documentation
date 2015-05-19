---
layout: default
title: "HP Helion OpenStack&#174; Installation Overivew"
permalink: /helion/openstack/carrier/install/pb/prereqs/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/support-matrix/">&#9664; Support Matrix</a> | <a href="/helion/openstack/carrier/install/bm/overview/">&#9650; Installation Overview</a>  | <a href="/helion/openstack/carrier/install/pb/network/prepare/"> Preparing the Network for Installation &#9654;</a> </p> 


# HP Helion OpenStack&#174; Carrier Grade (Beta): Installation Prerequisites

This document describes the prerequisite steps and one time setup on your KVM host required to install HP Helion OpenStack Carrier Grade in a baremetal environment.

## Hardware and software requirements {#hardware}

Before you start, if you have not done so already, make sure your environment meets the hardware and software requirements. See the [HP Helion OpenStack Support Matrix](/helion/openstack/1.1/support-matrix/).

## Preparing the baremetal systems {#prepbare}

Perform the following tasks on each baremetal system before starting the install:

- Configure the boot order with Network/PXE boot as the first option:
	- For example, to set the boot order for a HP SL390, from the iLO prompt enter `set system1/bootconfig1/bootsource5 bootorder=1`.
	- To unset, enter `set system1/bootconfig1/bootsource5 bootorder=5`.

- Configure the BIOS: 
	- to the correct date and time
	- KVM host configured in UTC (Coordinated Universal Time)
	- with only one network interface enabled for PXE/network boot and any additional interfaces should have PXE/network boot disabled
	- to stay powered off in the event of being shutdown rather than automatically restarting

- Update to the latest firmware recommended by the system vendor for all system components, including the BIOS, BMC firmware, disk controller firmware, drive firmware, network adapter firmware, and so forth.


## Preparing the KVM host {#kvm}

The following tasks need to be performed on the KVM host, the system where the you will launch the HP Helion OpenStack Carrier Grade installation. 

- Install Ubuntu Server 14.04.2 LTS
- Configure SSH
- Obtain a public key
- Install Debian/Ubuntu packages
- Configure the xrdp display
- Install and configure NTP
- Configure proxy information 
- Set DNS servers name-resolution
- Disabling SR-IOV
	<!--
	- Download the installation packages
	- Create the JSON environment variables file
	- Create the baremetal.csv file
	- Integrating LDAP (Lightweight Directory Access Protocol) -->

### Install Ubuntu Server 14.04.2 LTS  {#ubuntu}

The KVM host must have Ubuntu Server 14.04.2 LTS installed before performing the HP Helion OpenStack Carrier Grade installation.

### Obtain a public key {#pub-key}

On the KVM host, the user `root` must have a public key. 

1. Launch a terminal and log in to your KVM host as root:

	sudo su -

2. Use the following command to create the key. Accept the default values.

	/root/.ssh/id_rsa

3.  install the public key into the authorized keys on the KVM host:

		ssh-copy-id <IP_address>

	Enter the IP address of the default network gateway on the KVM.

### Configure proxy information {#proxy}

Before you begin your installation on the KVM host, if necessary configure the proxy information for your environment using the following steps:

1. Launch a terminal and log in to your KVM host as root:

		sudo su -

2. Edit the `/etc/environment` file to add the following lines, using values specific to your environment:

		PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
		export http_proxy=http://<web_proxy_IP>/
		export https_proxy=http://<web_proxy_IP>/
		export no_proxy=localhost,127.0.0.1,<your 10.x IP address>,<provider_network>
	
	Where:

		web_proxy_IP is your web proxy IP address.
		provider_network is your ESX management network

3. Source the `environments` file:

		source /etc/environment


### Install Ubuntu packages {#packages}

Before starting the installation, you must first install  Ubuntu. 

1. Run the following all in one command to install packages:

		sudo su -l -c "apt-get install -y ntp firefox gedit xrdp xfce4 qemu-kvm libvirt-bin openvswitch-switch openvswitch-common python-libvirt qemu-system-x86 libssl-dev libffi-dev git python-virtualenv python-dev virt-manager xorg gnome-core gnome-system-tools gnome-app-install vlan sudo ansible"

2. Add the 802.1q module to the kernel on boot. The 802.1q standard supports VLAN tagging on an ethernet network. 

		sudo su -c 'echo "8021q" >> /etc/modules'

3. Reboot the server

4. Log out and re-login to the KVM host to activate the proxy configuration.

### Configure the XRDP remote desktop display

Configure XRDP for the remote desktop connection to access the server remotely as follows.

1. Edit the `sesman.ini` file:

	vi /etc/xrdp/sesman.ini

	a. Update the `MaxSessions=1` to `MaxSessions=50`.

	b. Configure the system to use XRDP:

		echo "xfce4-session" > ~/.xinitrc

	c. Save and close the file.

2. Restart the xrdp service:

	sudo /etc/init.d/xrdp restart

If the XDRP display does not work as expected, (you see a gray screen), update the `startwm.sh` file:

	vi /etc/xrdp/startwm.sh

	#!/bin/sh

	if [ -r /etc/default/locale ]; then
	. /etc/default/locale
	export LANG LANGUAGE
	fi

	#. /etc/X11/Xsession
	. /usr/bin/startxfce4

Make sure you add a space after "." then restart XDRP:

	sudo /etc/init.d/xrdp restart


### Install and configure NTP {#ntp}

NTP is a networking protocol for clock synchronization between computer systems. 

The HP Helion OpenStack cloud nodes must be configured as NTP clients and point to the same NTP server.

You can install NTP on the KVM host and configure it as an NTP server. Or, you can use a pre-existing NTP server that is reachable from the management network.  You will also need to configure the undercloud and overcloud systems as NTP clients pointing to the NTP server you have chosen to use during the installation process.

For information on installing NTP on the KVM host, see [Installing an NTP Server](/helion/openstack/carrier/install/ntp/).


### Download and unpack the installation packages {#getinstall}

Before you begin, you must download the required HP Helion OpenStack installation package(s):

1. Download and extract the `cg-hlm.qcow2` and `VSD qcow2` files to the images folder. 

2. Download and extract the `cg-infra-playbooks.tar.gz.gpg` file to the `/root` directory.  

		cd /root
		tar xjf /tmp/cg-infra-playbooks.tar.gz.gpg

	This will create the `/root/cg` directory and extract the contents into the directory.

2. Copy the `cg-hos.tar.gz.gpg` and `cg-hos-dcn.tar.gz.gpg` to the `/root/cg/` directory.

	The password to decrypt the files is `cghelion`.

### Configure SSH {#ssh}

On the KVM host, the OpenSSH server must be running and the firewall configuration should allow access to the SSH ports.

1. Enable root login in the `/etc/ssh/sshd_config`: 

		PermitRootLogin yes

2. In the `sshd_config` file, set the following variables:

		# Authentication:
		LoginGraceTime 120
		#PermitRootLogin without-password
		StrictModes no

3. Disable strict host key checking:

	a. Navigate to the `config` file:

		cd ~/.ssh/config

	b. Set the `StrictHostKeyChecking` variable to No:

		StrictHostKeyChecking no

4. Restart SSH service

		service ssh restart

5. Configure the public key and passwordless SSH access. 

	a. Enter the following command:

		ssh-keygen -t rsa 

	b. Press Enter to use default path (/root/.ssh/id_rsa)

	c. Press enter for passphrase

	d. Press enter again to confirm the empty passphrase

	The output of the public key will display, similar to the following:

		ssh-copy-id 192.168.122.1 

	If you get a permission denied error, make sure you are logged in as root. 


## Next Step

[Prepare the Network for Installation](/helion/openstack/carrier/install/pb/network/prepare/)

----