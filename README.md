# MaxMind GeoIP Updater

This repo can build a Docker image that would run MaxMind's geoipupdate command to create a geoip 
file at a specified mounted directory with any given GeoIP config, e.g.

Given that you have the following config stored in `~/GeoIP.conf`:

    UserId your_id
    LicenseKey your_key
    ProductIds GeoIP2-Country

You can execute the following docker command to create/update your GeoIP2-Country MMDB file:

    docker run --rm -v $(pwd):/geodata -v $(pwd)/GeoIP.conf:/etc/conf/GeoIP.conf garukun/geoipupdate /etc/conf/GeoIP.conf

This will create a `GeoIP2-Country.mmdb` file in your working directory.

The Docker Hub repo: https://hub.docker.com/r/garukun/geoipupdate/