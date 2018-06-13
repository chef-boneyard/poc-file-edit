# Overview

The preferred method of managing a file resource with configuration management is to completely control the resource with the configuration management tool. However, this Proof-of-Concept repo outlines some potential solutions when this approach is not possible in an environment using the Chef Configuration Management tool.

## Technical Challenge

An Operations team is tasked with managing file resources for all nodes in an environment. However, there are some files that the operations team can only manage portions while allowing other teams to adjust settings specific for their environment. Requiring the other teams to use the same configuration management tool is not currently an option.

An example file could be the `/etc/ssh/sshd_config`. The Operations must ensure that settings such as `PermitRootLogin` are set to `no` but allow other settings in that file to be adjusted and not overwritten later.

## Possible Solutions

With Chef there are a several potential solutions to addressing this technical problem. A few approaches are outlined here.

| Solution          | Example Recipe                         |
|-------------------|----------------------------------------|
| Template Partials | cookbooks/fileedit/partials_example.rb |
| Cookbook: line    | cookbooks/fileedit/line_example.rb     |

**Template Partials**

[Template Partials](https://docs.chef.io/resource_template.html#partial-templates) were designed to break up larger template files into smaller, more manageable template resources. This also provides a potential solution to only managing a specific part of a file resource by breaking out the required sections of a file into a partial that can be managed by Chef. However, it may overwrite the entire file if parts of the template are changed outside of the template partial.

**Cookbook: line**

This approach uses the Chef [line cookbook](https://supermarket.chef.io/cookbooks/line/versions/2.0.0) that is actively maintained. This should be used instead of the [`Chef::Util::FileEdit`](https://www.rubydoc.info/gems/chef/Chef/Util/FileEdit) module.

The line cookbook provides a Chef Resource to manage lines in a given file resource. This is currently one of the more preferred solutions to only managing specific lines in a file. If the cookbook does not provide the required methods, it can be easily added via a patch or pull request.

**Potential Solution: Chef Library Helper**

Because Chef is a Ruby DSL it allows users to add functionality Chef to meet their individual use case if the Chef framework does not solve their configuration management challenges by default.

The default approach to add functionality is to create a [Library](https://docs.chef.io/libraries.html) that is included in a cookbook. The library can be easily written using Ruby which gives the user full access to the Ruby Language to solve their technical challenge.

## Best Potential Solutions

* Cookbook: Line
  - This cookbook was designed to solve similar technical challenges so it provides one of the better solutions.
* Custom Chef Library Helper
  - If the line cookbook is not ideal, a custom Chef Library could be written in a cookbook and used instead.

## Example Repo Usage
```
# Run Test-Kitchen example
cd cookbooks/fileedit
chef exec kitchen converge

# Login and view files
chef exec kitchen login
cd /tmp/examples
ls
```
