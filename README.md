[![Build Status](https://travis-ci.org/katallaxie/mesos-dns.svg?branch=master)](https://travis-ci.org/katallaxie/mesos-dns) [![Docker Stars](https://img.shields.io/docker/stars/pixelmilk/mesos-dns.svg)](https://hub.docker.com/r/pixelmilk/mesos-dns/) [![Docker Pulls](https://img.shields.io/docker/pulls/pixelmilk/mesos-dns.svg)](https://hub.docker.com/r/pixelmilk/mesos/)

# mesos-dns

Mesos

http://mesos.apache.org/

# use

[![](https://badge.imagelayers.io/katallaxie/mesos-dns:1.3.1.svg)](https://imagelayers.io/?images=katallaxie/1.3.1)

> all mesos arguments are accessible via `MESOS_*` environment variables 

```
# You can use 
docker run -d \
-e CONFIG_URL=https://raw.githubusercontent.com/mesosphere/mesos-dns/master/config.json.sample \
--name mesos-master --net host -p 8053:8053/udp --restart always pixelmilk/mesos-dns:0.6.0 -v=2 -config=/config.json
```

Set environment variable `MESOS_DNS_CONFIG_URL` to download the config via an url. Alternatively, you can mount a docker secret `--secret mesos_dns_config_url`.

# License
[MIT](/LICENSE)