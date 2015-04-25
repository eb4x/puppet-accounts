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

  class { 'accounts':
    groups                   => hiera_hash('accounts::groups', {}),
    ssh_keys                 => hiera_hash('accounts::ssh_keys', {}),
    users                    => hiera_hash('accounts::users', {}),
    usergroups               => hiera_hash('accounts::usergroups', {}),
    accounts                 => hiera_hash('accounts::accounts', {}),
    start_uid                => $start_uid,
    start_gid                => $start_gid,
    purge_ssh_keys           => $purge_ssh_keys,
    ssh_authorized_key_title => $ssh_authorized_key_title,
  }

}
