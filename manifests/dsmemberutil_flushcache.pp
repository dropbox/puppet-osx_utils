# Flushes the membership cache
class osx_utils::dsmemberutil_flushcache {
  
  exec { "Run dsmemberutil flushcache" :
    command     => "/usr/bin/dsmemberutil flushcache",
    refreshonly => true,
  }

}