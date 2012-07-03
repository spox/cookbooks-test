name 'tester'

run_list([
  "recipe[yum::epel]",
  "recipe[users::sysadmins]",
  "recipe[sudo]",
  "recipe[chef-client::config]",
  "recipe[nginx_simplecgi]",
  "recipe[nagios::server]"
])

override_attributes(
  'chef_client' => {
    'server_url' => 'https://api.opscode.com/organizations/chrisroberts',
    'validation_client_name' => 'chrisroberts-validator'
  },
  'nagios' => {
    'web_server' => 'nginx',
    'server_auth_method' => 'fubar',
    'server' => {
      'install_method' => 'source'
    }
  },
  'nginx' => {
    'init_style' => 'fubar',
    'user' => 'nginx',
    'group' => 'nginx',
    'install_method' => 'source'
  },
  'authorization' => {
    'sudo' => {
      'groups' => ['sysadmin', 'admin', 'spox', 'wheel'],
      'passwordless' => true
    }
  },
  'nginx_simplecgi' => {
    'php' => true
  }
)
