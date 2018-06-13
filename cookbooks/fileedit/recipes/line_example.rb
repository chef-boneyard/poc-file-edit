#
# Cookbook:: fileedit
# Recipe:: line_example
#

# Create our example file
cookbook_file '/tmp/examples/sshd_line_example' do
  source 'sshd_config.example'
  mode   '0755'
  action :create
end

# Use the line cookbook to fix individual lines
# https://supermarket.chef.io/cookbooks/line/versions/2.0.0
replace_or_add 'PermitRootLogin Fix' do
  path    "/tmp/examples/sshd_line_example"
  pattern "PermitRootLogin*"
  line    "PermitRootLogin no"
end
