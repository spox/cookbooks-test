name 'base'

run_list(%w(
  users::sysadmins
  sudo
  chef-client::config
  chef-client::cron
))

override_attributes(
  'chef_client'  => {
    'server_url' => 'https://api.opscode.com/organizations/chrisroberts',
    'validation_client_name' => 'chrisroberts-validator',
    'log_file' => 'client.log',
    :cron => {
    'path' => '$PATH:/fubar/bin'
  }
  },
  'authorization' => {
    'sudo' => {
      'groups' => ['sysadmin', 'admin', 'spox', 'wheel'],
      'passwordless' => true
    }
  }
)
