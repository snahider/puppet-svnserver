# puppet-svnserver

## How to use it

```
	class{'svnserver':
		svn_user =>'vagrant',
		svn_password => 'vagrant',
		defaultrepository_name => 'default-repo',
	}
```