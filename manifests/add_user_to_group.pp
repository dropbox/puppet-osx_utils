# Adds a supplied user to a given group
define osx_utils::add_user_to_group ($group){
  $user = regsubst($name, '^[^:]+:\s*', '')

  include osx_utils::dsmemberutil_flushcache 

  exec { "add_${user}_to_${group}" :
    command => "dseditgroup -o edit -a '${user}' -t user '${group}'",
    path    => '/bin:/usr/sbin:/usr/bin',
    unless  => "dseditgroup -o checkmember -m '${user}' '${group}'",
    notify  => Class['osx_utils::dsmemberutil_flushcache'],
  }
  
}