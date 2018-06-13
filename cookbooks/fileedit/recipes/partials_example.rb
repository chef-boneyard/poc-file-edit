#
# Cookbook:: fileedit
# Recipe:: partials_example
#

# Using Template Partials: https://docs.chef.io/resource_template.html#partial-templates
# Files Used:
#   - templates/sshd_config.example.erb   <- Primary template file that uses the partial template file
#   - templates/_sshd_config_partial.erb  <- The partial with contents managed by Chef
template '/tmp/examples/sshd_config_using_partials' do
  source 'sshd_config.example.erb'
  owner  'root'
  group  'root'
  mode   '0755'
  action :create
end
