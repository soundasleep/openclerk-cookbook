openclerk Cookbook
==================

This cookbook allows one to install [Openclerk](http://openclerk.org) on a Chef client, based on the [Openclerk installation instructions](https://github.com/soundasleep/openclerk/blob/master/INSTALL.md):

### Completed

* Install and configure apache
* Install and configure PHP
* Install and configure mysql
* Download latest Openclerk source code
* Set up Apache vhost
* Install and configure Composer
* Install and configure Grunt
* Install Ruby and sass (for CSS building)
* Build application with `grunt build`
* Update .htaccess
* Initialise MySQL database
* Setup default cron jobs

### TODO

* Allow `config` templates to be loaded from an external SVN/Git repository (e.g. templates, images)
* Use Capistrano for deployment/config/installing gems instead of [homegrown solution](https://github.com/soundasleep/chef_bundler)
* Allow databases to be upgraded automatically with new releases (depends on [#115](http://redmine.jevon.org/issues/115)) - currently the database is only installed once

See also [openclerk-chef](https://github.com/soundasleep/openclerk-chef) which provides a complete Chef repository and installation instructions that use this cookbook directly.

Dependencies
------------

The most recent cookbook dependencies are listed in [openclerk-chef/Cheffile](https://github.com/soundasleep/openclerk-chef/blob/master/Cheffile). These include:

* [openclerk](https://github.com/soundasleep/openclerk-cookbook)
* [composer](https://github.com/Morphodo/chef-composer)
* [grunt_cookbook](https://github.com/MattSurabian/grunt_cookbook)
* [chef_bundler](https://github.com/soundasleep/chef_bundler)

Usage
-----

Include appropriate node attributes and include both `apt` and `openclerk` in your node's `run_list`.

Make sure that you set appropriate values for `mysql_*_password`s and `automated_key`.

```json
{
  "openclerk": {
    "db_database": "clerk",
    "db_username": "clerk",
    "db_password": "clerk",
    "server_name": "localhost",
    "server_remote_name": "localhost:80",
    "site_email": "support@example.com",
    "phpmailer_host": "mail.example.com",
    "phpmailer_username": "user",
    "phpmailer_password": "password",
    "phpmailer_bcc": ""
  },
  "mysql": {
    "server_root_password": "root",
    "server_debian_password": "debian",
    "server_repl_password": "repl"
  },
  "run_list": [ "recipe[apt]", "recipe[openclerk]" ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch
3. Write your change
4. Submit a Pull Request using Github
