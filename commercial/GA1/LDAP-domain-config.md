---
layout: default
title: "HP Helion OpenStack&#174; 1.1: LDAP Domain Configuration"
permalink: /helion/openstack/1.1/services/addLDAP
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>



<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/">&#9664; PREV | <a href="/helion/openstack/1.1/">&#9650; UP</a> | <a href="/helion/openstack/1.1/faq/">NEXT &#9654; </a></p> -->

# HP Helion OpenStack&#174; 1.1: LDAP Domain Configuration
<br />



The HP Helion OpenStack Identity Service, known as Keystone, supports the option to specify identity driver configurations on a domain-by-domain basis, allowing, for example, a specific domain to have its own LDAP server. By default, the option to configure domain-specific drivers is enabled via the Helion installer as the following:

	[identity]
	domain_specific_drivers_enabled = True
	domain_config_dir = /etc/keystone/domains

Setting domain&#95;specific&#95;drivers&#95;enabled to True will enable this feature, causing Keystone to look in the domain&#95;config&#95;dir (e.g. default as /etc/keystone/domains/) for configuration files of the form:

	keystone.<domain_name>.conf
The name is important and is always of the form: keystone.&#60;domain-name&#62;.conf, where the domain name must match the name of the domain created in Keystone. Options given in the domain specific configuration file will override those in the primary configuration file (i.e. keystone.conf) for the specified domain. 

Domains without a specific configuration file will continue to use the options from the primary configuration file.
For example, if the service provider creates a domain called "domainA", then the domain-specific configuration file must be keystone.domainA.conf.  The sample contents of this configuration file using openLDAP as the backend might look something like the following:

	[identity]
	driver = keystone.identity.backends.ldap.Identity
 
	[assignment]
	driver = keystone.assignment.backends.sql.Assignment
 

	[ldap]
	url = ldap://localhost
	suffix = dc=example,dc=com
	query_scope = sub
	user_tree_dn = ou=Users,dc=example,dc=com
	user_objectclass = posixAccount
	user_id_attribute = uid
	user_name_attribute = cn
	user_enabled_default = False
	user_allow_create = False
	user_allow_update = False
	user_allow_delete = False
	group_tree_dn = ou=Groups,dc=example,dc=com
	group_objectclass = posixGroup
	group_id_attribute = cn
	group_name_attribute = cn
	group_allow_create = False
	group_allow_update = False
	group_allow_delete = False
	use_tls = True
	tls_cacertfile = /mnt/state/etc/keystone/ssl/certs/ca.pem
	tls_req_cert = demand

For information on all the attributes you can set for openLDAP/Active Directory, please refer to [LDAP connection settings](/helion/openstack/1.1/services/identity/integrate-ldap/).
 
Once the LDAP domain configuration as described above is complete, you must restart Apache and Keystone for the settings to take effect.