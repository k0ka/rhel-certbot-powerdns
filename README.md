# Docker image for certbot based on Rocky Linux 9 (RHEL compatible)

Usage

```shell
$ docker run -d \
  -v /data/letsencrypt:/etc/letsencrypt \
  ghcr.io/k0ka/rhel-certbot \
  renew
```
