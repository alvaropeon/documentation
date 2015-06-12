---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): How to use the Helion Dashboards"
permalink: /helion/openstack/carrier/dashboard/how-works/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Michael B

---
<!--UNDER REVISION-->



<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<!-- Hide until use cases are official <p style="font-size: small;"> <a href="/helion/openstack/carrier/dashboard/admin/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/manage/">&#9650; UP</a> | <a href="/helion/openstack/carrier/dashboard/users/">NEXT &#9654;</a> </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): How to use the Helion Dashboards

The HP Helion OpenStack Commercial dashboards are browser-based user interfaces that allow you to interact with the HP Helion OpenStack Carrier Grade. 

The interface, based on OpenStack Horizon, is grouped into dashboards, including [Project](#DashProject), [Admin](#DashAdmin) and [Identity](#DashIdent). Tabs on the left side of the interface expand and contract to show available commands grouped into **panels**. 

Across the top are menus to switch between projects and menus where you can access user settings.

<img src="media/CGH-Helion-Window-RC.png" alt="" width="600" />

How you interact with your network environment depends upon your user type, either an administrative user or a non-administrative user (user). In general, a non-admin user can make changes to projects to which that user is associated. Admin users can make changes throughout the domain.

To access the dashboard, [enter the dashboard URL in a supported browser and log in](/helion/openstack/carrier/dashboard/login/). 

At the bottom of this page, you can see some of the services you can manage right from the dashboard.

## Project dashboard {#DashProject}

Use the **Project** dashboard to implement and build out your cloud. This dashboard contains tools to create virtual server instances, create and configure your network, configure access tools (such as key pairs and security groups) and cloud resource templates (stacks).

<table>
<tr><th>Menu item</th><th>Description</th></tr>
<tr>
<td colspan="2">System Panel</td></tr>
<td>Overview</td><td>Charts and statistics for monitoring compute node resource usage for instances associated with the tenant (project).</td></tr>
<tr>
<td>
Instances</td><td>Controls for managing instances associated with the tenant, including controls for creating snapshots.
</td></tr>
<tr>
<td>Server Groups</td><td>Controls for managing server groups associated with the tenant. *Wind River Linux servers only*
</td></tr>
<tr>
<td>Volumes</td><td>Controls for managing virtual disk volumes associated with the tenant's instances.
</td></tr>
<tr>
<td>Images & Snapshots</td><td>Controls for managing images, and information about available snapshots created from instances.</td></tr>
<tr>
<td>Access & Security</td><td>Controls for network protocol and port security, SSH-based access to virtual machines, API access to services, and floating IP address
allocations.
</td></tr>
<tr>
<td colspan="2">Network Panel</td></tr>
<tr><td>Topology</td><td>Configuration charts depicting system networks, instances, and network connections between instances.
</td></tr>
<tr>
<td>Networks</td><td>Controls for managing networks for the current tenant, and viewing QoS (Quality of Service) policies or weightings for tenants of which the user is a member.
</td></tr>
<tr>
<td>Routers</td><td>Controls for managing virtual routers. Tenant members can create and delete virtual routers, view router details and delete interfaces, and clear gateways.
</tr></td>
<tr><td colspan="2">Object Store</td>
</td></tr>
<tr><td>
Containers</td><td>Controls for mamaging storage containers. A container is a storage compartment for your data and provides a way for you to organize your data. 
<tr><td colspan="2">Orchestration Panel</td>
</td></tr>
<tr><td>
Stacks</td><td>Details for existing services (stacks), and controls for creating new services (launching stacks). Service details include topologies, resource allocations, and event histories.
</table>

## Admin dashboard {#DashAdmin}

Use the **Admin** dashboard to view, allocate, and manage all resources within the cloud.

The Admin dashboard allows you to manage instances, define flavors, create and configure images, manage networks, view system resources, manage projects, and manage users.

<table>
<tr><th>Menu item</th><th>Description</th></tr>
<tr>
<td colspan="2">System Panel</td></tr>
<tr><td>Overview</td><td>Performance charts for system health monitoring, including hosts status, provider-network port utilization, and compute node processing, memory, and disk usage.
</td></tr>
<tr>
<td>Resource Usage</td><td> Tools for performing Ceilometer database queries using real-time or collected data, to support detailed performance analysis. *Wind River Linux servers only*
</td></tr>
<tr>
<td>Inventory</td><td>Controls for managing systems, hosts, and standardized CPU, port, or storage profiles that can be applied to hosts. *Wind River Linux servers only*
</td></tr>
<tr>
<td>Host Aggregates</td><td>Charts for monitoring hypervisor resource usage on compute nodes. *hLinux servers only*
</td></tr>
<tr>
<td>Hypervisors</td><td>Charts for monitoring hypervisor resource usage on compute nodes.
</td></tr>
<tr>
<td>Instances</td><td>Controls for managing virtual-machine instances. 
</td></tr>
<tr>
<td>Server Groups</td><td>Controls for managing server groups across all tenants. Server groups are collections of instances sharing common attributes. *Wind River Linux servers only*
</td></tr>
<tr>
<td>Volumes</td><td>Controls for managing virtual disk volumes available for use with instances. The virtual volumes are implemented using storage volumes defined for the storage nodes in the system.
</td></tr>
<tr>
<td>Flavors</td><td>Controls for managing standardized processor, disk, and memory complements (flavors) that can be applied to virtual machines.
</td></tr>
<tr>
<td>Images</td><td>Controls for managing disk images used to initialize and configure virtual machines.
</td></tr>
<tr>
<td>Networks</td><td>Controls for managing tenant networks, provider networks, and QoS (Quality of Service) policies or tenant weightings.
</td></tr>
<tr>
<td>Routers</td><td>Controls for managing virtual routers. Administrators can list the virtual routers created for tenants, view router and interface details, and delete routers.
</td></tr>
<tr>
<td>Defaults</td><td>Controls for viewing and setting the default quota values for new tenants.
</td></tr>
<tr>
<td>Fault Management</td><td>System alarms. *Wind River Linux servers only*
</td></tr>
<tr>
<td>System Configuration</td><td>System configuration updates. *Wind River Linux servers only*
</td></tr>
<tr>
<td>System Info</td><td>Status information for services and network agent processes, availability zones, and host aggregates.
</td></tr>
</table>

# Identity dashboard<a name="DashIdent"></a>

Use the **Admin** panel to create and delete users, change user passwords, assign users to projects, and other tasks.

<table>
<tr><th>Menu item</th><th>Description</th></tr>
<tr>
<tr>
<td>Projects</td><td>Controls for managing tenants.
</td></tr>
<tr>
<td>Users</td><td>Controls for managing user accounts.
</td></tr>
</table>


<!--
## Settings dashboard<a name="DashSettings"></a>

Use the **Settings** dashboard to change your display language and settings, your time zone, and your password.
 
Click **Settings** in the user menu to display the Settings dashboard. 

For a look at the dashboard options, see [Horizon Overview](/helion/openstack/1.1/services/horizon/overview/)

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
-->


----