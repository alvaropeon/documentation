<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE topic
  PUBLIC "-//OASIS//DTD DITA Topic//EN" "http://docs.oasis-open.org/dita/v1.1/OS/dtd/topic.dtd" ><topic xml:lang="en-us" id="topic2530">
<title>HP Helion <tm tmtype="reg">OpenStack</tm> Carrier Grade (Beta): Block Storage Volume Operations (Cinder) Overview</title>
<prolog>
<metadata>
<othermeta name="layout" content="default"/>
<othermeta name="product-version" content="HP Helion Openstack"/>
<othermeta name="product-version" content="HP Helion Openstack 1.1"/>
<othermeta name="role" content="Systems Administrator"/>
<othermeta name="role" content="Cloud Architect"/>
<othermeta name="role" content="Storage Administrator"/>
<othermeta name="role" content="Network Administrator"/>
<othermeta name="role" content="Service Developer"/>
<othermeta name="role" content="Cloud Administrator"/>
<othermeta name="role" content="Application Developer"/>
<othermeta name="role" content="Network Engineer"/>
<othermeta name="role" content="Paul F"/>
<othermeta name="product-version1" content="HP Helion Openstack"/>
<othermeta name="product-version2" content="HP Helion Openstack 1.1"/>
</metadata>
</prolog>
<body>
<p>
<!--UNDER REVISION-->
 <!--./CarrierGrade/ServicesOverviews/carrier-grade-services-volume-overview.md-->
 <!--permalink: /helion/openstack/carrier/services/volume/overview/--></p>
<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->
<p>The HP Helion <tm tmtype="reg">OpenStack</tm> Block Storage Volume Operations uses the <tm tmtype="reg">OpenStack</tm> Cinder (Block Storage) service to manage storage volumes, including creating volumes, creating volume snapshots, and configuring volumes.</p>
<p>Once created, you can easily disconnect block storage volumes from one instance and attach them to another. You can also create snapshots of these volumes.</p>
<p>HP Helion <tm tmtype="reg">OpenStack</tm> uses StoreVirtual as a backend to Cinder to realize horizontally scalable block storage. StoreVirtual is unique in the sense that the storage controller runs as a virtual appliance and helps realize Software Defined Block Storage. To use StoreVirtual you must use the KVM hypervisor.</p>
<p>HP Helion <tm tmtype="reg">OpenStack</tm> also supports HP StoreServ 3PAR as a Cinder backend.</p>
<section id="working-with-the-volume-operations-service"> <title>Working with the Volume Operations Service</title>
<p>To perform tasks using the Volume Operations service, you can use the dashboard, API or CLI.</p>
<ul>
        <li><xref href="../AdminGuideNew/VSA/carrier.install-vsa.dita#topic4893">Working with HP
            StoreVirtual
          VSA</xref><!--
* [Working with HP 3PAR StoreServ](/helion/openstack/carrier/install/3par/)
--></li>
</ul>
</section>
<section id="using-the-dashboards"> <title>Using the dashboards<!--Removed anchor point UI--><!-- id="UI" --></title>
<p>You can use the <xref href="../../CarrierGrade/AdminGuideNew/Dashboard/carrier-grade.dashboard.how-works.dita" >HP Helion <tm tmtype="reg">OpenStack</tm> Dashboard</xref> to work with the Volume Operations service.</p>
</section>
<section id="using-the-api"> <title>Using the API<!--Removed anchor point API--><!-- id="API" --></title>
<p>You can use a low-level, raw REST API for access to the HP Volume Operations service. See the <xref href="http://developer.openstack.org/api-ref-blockstorage-v2.html" scope="external" format="html" ><tm tmtype="reg">OpenStack</tm> Block Storage API v2.0 Reference</xref>.</p>
</section>
<section id="using-the-cli"> <title>Using the CLI<!--Removed anchor point cli--><!-- id="cli" --></title>
<p>You can use any of several command-line interfaces to access HP Volume Operations service. See <xref href="http://docs.openstack.org/cli-reference/content/cinderclient_commands.html" scope="external" format="html" ><tm tmtype="reg">OpenStack</tm> Command Line Interface Reference</xref>.</p>
<p>For more information on installing the CLI, see <xref href="http://docs.openstack.org/user-guide/content/install_clients.html" scope="external" format="html" >Install the <tm tmtype="reg">OpenStack</tm> command-line clients</xref>.</p>
<!--
## How To's with the HP Helion Volume Operations Service<a name="howto"></a>
 
The following lists of tasks can be performed by a user or administrator through the [HP Helion <tm tmtype="reg">OpenStack</tm> Dashboard](/helion/openstack/carrier/dashboard/how-works/), the [API](http://developer.openstack.org/api-ref-blockstorage-v2.html) or [CLI](http://docs.openstack.org/cli-reference/content/cinderclient_commands.html).

Depending upon your user type, [user](#user) or [administrator](#admin), you can perform the following tasks.

### Tasks performed by users<a name="user"></a>

The following Volume Operations service tasks are usually performed by someone with the *user* role.

#### Creating and deleting a volume ###

Use the Volume Operations service to create and delete volumes, snapshots, and back ups.

#### Creating a bootable volume from an image ####

Use the Volume Operations service to create volumes that can be used to boot a virtual machine.

#### Creating and deleting a snapshot of a volume ####

Use the Volume Operations service to create volume snapshots that can be used to create other volumes.

#### Creating and deleting a backup of a volume ####

Use the Volume Operations service to create back ups of a volume or delete a backup that is no longer needed.

#### Creating a volume from a backup ####

Use the Volume Operations service to create a new volume based on a volume backup.

#### Create an image from a volume ####

Use the Volume Operations service to create an image based on an existing volume.

#### Working with volumes ###

Using the HP Volume Operations service, a user can modify volume objects.

- **Update the metadata of a volume** &#151; Modify the metadata associated with a volume.
- **Rename a volume** &#151; Change the name of an existing volume.
- **Extend a Volume** &#151; Increase the storage capacity of a volume.
- **Transfer a volume between users** &#151; Transfer a volume between users.

### Tasks performed by an Administrator<a name="admin"></a>

The following Volume Operations service tasks are usually performed by someone with the *administrator* role.

#### Create and Delete an encryption type

Use the Volume Operations service to create or delete encryption types.

#### Create and Delete a volume type

Use the Volume Operations service to create or delete volume types.

#### Associate QoS with a volume type

Use the Volume Operations service to enable or disable services.-->
</section>
<section id="for-more-information"> <title>For more information</title>
<p>For more general information on how to operate your cloud, refer to the <xref href="http://docs.openstack.org/ops/" scope="external" format="html" ><tm tmtype="reg">OpenStack</tm> Operations Guide</xref>. The <i>Architecture</i> section contains useful information about how an <tm tmtype="reg">OpenStack</tm> Cloud is put together. However, the HP Helion <tm tmtype="reg">OpenStack</tm> takes care of these details for you. The <i>Operations</i> section contains information on how to manage the system.</p>
<p>
  <xref type="section" href="#topic2530"> Return to Top </xref>
</p>
<!-- ===================== horizontal rule ===================== -->
</section>
</body>
</topic>