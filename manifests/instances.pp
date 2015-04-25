# Wrapper class for simplifying using %{calling_module} with Hiera
class accounts::instances(
  $groups                   = {},
  $ssh_keys                 = {},
  $users                    = {},
  $usergroups               = {},
  $accounts                 = {},
  $start_uid                = undef,
  $start_gid                = undef,
  $purge_ssh_keys           = false,
  $ssh_authorized_key_title = '%{ssh_key}-on-%{account}',
) {

  if empty($groups) {
    $groups_data = hiera_hash('accounts::groups', {})
  }
  if empty($ssh_keys) {
    $ssh_keys_data = hiera_hash('accounts::ssh_keys', {})
  }
  if empty($users) {
    $users_data = hiera_hash('accounts::users', {})
  }
  if empty($usergroups) {
    $usergroups_data = hiera_hash('accounts::usergroups', {})
  }
  if empty($accounts) {
    $accounts_data = hiera_hash('accounts::accounts', {})
  }
  class { 'accounts':
    groups                   => $groups_data,
    ssh_keys                 => $ssh_keys_data,
    users                    => $users_data,
    usergroups               => $usergroups_data,
    accounts                 => $accounts_data,
    start_uid                => $start_uid,
    start_gid                => $start_gid,
    purge_ssh_keys           => $purge_ssh_keys,
    ssh_authorized_key_title => $ssh_authorized_key_title,
  }

}
