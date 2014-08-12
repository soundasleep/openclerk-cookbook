openclerk Cookbook
==================

This cookbook allows one to install [Openclerk](http://openclerk.org) on a Chef client. *NOTE* The recipes in this cookbook are not completed yet, following the [Openclerk installation instructions](https://github.com/soundasleep/openclerk/blob/master/INSTALL.md):

### Completed

* Install and configure apache
* Install and configure PHP
* Install and configure mysql
* Download latest Openclerk source code
* Set up Apache vhost
* Install and configure Composer

### Still to complete

* Install and configure Grunt
* Initialise MySQL database
* Configure `config.php` as necessary
* Build application with `grunt build`
* Setup default cron jobs

See also [openclerk-chef](https://github.com/soundasleep/openclerk-chef) which provides a complete Chef repository and installation instructions that use this cookbook directly.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - openclerk needs toaster to brown your bagel.

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### openclerk::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['openclerk']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### openclerk::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `openclerk` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openclerk]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
