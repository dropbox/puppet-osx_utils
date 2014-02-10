# Adds a supplied user to a given group
define osx_utils::add_group_to_group ($destination_group){
  $group = regsubst($name, '^[^:]+:\s*', '')

  include osx_utils::dsmemberutil_flushcache 

  exec { "add_${group}_to_${destination_group}" :
    command => "dseditgroup -o edit -a '${group}' -t group '${destination_group}'",
    path    => '/bin:/usr/sbin:/usr/bin',
    unless  => "dseditgroup -o read '${destination_group}' 2>&1 | grep $(dsmemberutil getuuid -G '${group}')",
    notify  => Class['osx_utils::dsmemberutil_flushcache'],
  }
     
}