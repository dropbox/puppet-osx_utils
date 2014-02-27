# Add user to group without flushing the Directory Services Cache
osx_utils::add_user_to_group { 'joe' :
  destination_group => 'admin',
}

# Add user to group and flush the Directory Services Cache
osx_utils::add_user_to_group { 'bob' :
  destination_group => 'admin',
  notify => Class['osx_utils::dsmemberutil_flushcache'],
}

# Add the Staff group to the _lpadmin group
osx_utils::add_group_to_group { 'staff' :
  destination_group => '_lpadmin',
}