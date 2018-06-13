#
# Cookbook:: fileedit
# Recipe:: default
#

# Ensure Apt is up to date
apt_update

# Ensure an editor is installed to look at files
package 'vim'

# Directory for example file
directory '/tmp/examples'

# Include example PoC recipes
%w( line_example partials_example ).each do |recipe|
  include_recipe "fileedit::#{recipe}"
end
