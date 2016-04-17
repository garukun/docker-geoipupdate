#!/bin/bash
# update.sh downloads the latests updates from MaxMind GeoIP service as 
# specified by a given conf file.
# @see: http://dev.maxmind.com/geoip/geoipupdate/

conf=$@
geoipupdate -d /geodata -f ${conf} 2 > /dev/null

# The geoipupdate binary doesn't like it when the mmdb file does not already 
# exist; it will write to stderr instead and not removing the intermediatary
# gz file. This if statement here naively tries to run it again to let the
# executable update itself.
# TODO(@garukun): Try to find other workarounds to get the mmdb file without
# calling the executable twice.
if [[ ! -z $? ]]; then
  geoipupdate -d /geodata -f ${conf}
fi

echo "Done!"
