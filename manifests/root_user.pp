class accounts::root_user (
    $password = undef,
) {
    user { root:
        ensure => present,
        password => $password,
    }
}
