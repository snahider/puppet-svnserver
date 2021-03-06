# defaultuser_username
#   (Optional)  If provided, the module adds this user to the subversion group.
#   This module doesn't create the user. The user should be managed outside this module
#
# defaultuser_password
#   (Optional) The password of the 'defaultuser_username' to login to subversion server, not the OS password.
#
# defaultrepository_name
#   (Optional) If provided, the module creates a new svn repository.
#


class svnserver(
	$defaultuser_username  		= undef,
	$defaultuser_password		= undef,
	$defaultrepository_name		= undef,
)inherits ::svnserver::params{

	Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

		class{'apache':
		default_mods => false
	}

	#include svnserver::apachemods
	include svnserver::package
	include svnserver::config
	include svnserver::users
	include svnserver::repositories

	Class['svnserver::package']
	-> Class['svnserver::config']
		-> Class['svnserver::users']
			-> Class['svnserver::repositories']
}