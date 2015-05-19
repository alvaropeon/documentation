---
layout: default
title: "HP Helion OpenStack&#174; Installation Overivew"
permalink: /helion/openstack/carrier/install/pb/overview/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Carrier Grade (Beta): Installation Overview

This document describes the installation process for HP Helion OpenStack Carrier Grade in a baremetal environment. 
## About the installation 

The HP Helion OpenStack Carrier Grade Alpha installation will create a base HP Helion OpenStack cloud that uses the [HP Networking (Neutron) service](/helion/openstack/carrier/services/networking/overview/) using Open vSwitch (OVS). 

The HP Helion OpenStack cloud will consist of three controller systems and two [compute](/helion/openstack/carrier/services/compute/overview/) nodes. The installation also creates a KVM node virtual machine from which you can deploy [Volume Operation (Cinder) block storage](/helion/openstack/carrier/services/volume/overview/). See the Technical Overview and Support Matrix for more information.

After installation, you can interact with the HP Helion OpenStack cloud using the [Horizon graphical interface](/helion/openstack/carrier/services/horizon/overview/) or using the APIs of the respective [services](/helion/openstack/carrier/services/overview/). 

## Installation process

Use the following process to install HP Helion OpenStack Carrier Grade in a baremetal environment. 

Cloud Deployment will occur in following 3 phases:

1. Preparing HLM node

2. Initializing network interfaces for all cloud nodes

3. Finally deploying b2b cloud along with dcn components

In BM env you will have one KVM host given by customer to host your HLM VM. We will call this "hlm_kvm_host" in our ansible's hosts file

Customer will also provide DNS server and NTP server.

Customer will provide other cloud nodes along with additional nodes for DCN scenario - DCN host (KVM host that will host VSC and VSD VMs) and VRG node (server that will be VRS-G node)
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----