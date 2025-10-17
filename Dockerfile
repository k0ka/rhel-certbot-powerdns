FROM rockylinux:9

ENV SUMMARY="Platform for running Certbot with PowerDNS plugin on Rocky Linux 9 (RHEL Compatible)" \
	DESCRIPTION="EFF's Certbot tool for obtaining TLS/SSL certificates from Let's Encrypt. \
		The PowerDNS DNS Authenticator plugin uses the PowerDNS HTTP API to request modifications for the DNS-01 challenge."

LABEL maintainer="admin@idwrx.com" \
	summary="${SUMMARY}" \
	description="${DESCRIPTION}" \
	name="k0ka/rhel-certbot-powerdns"

RUN	dnf -y clean all  \
    && dnf -y --nodoc --setopt=install_weak_deps=false update  \
    && dnf -y --nodoc --setopt=install_weak_deps=false install \
      python3.12 python3.12-pip \
    && pip3.12 install certbot-dns-pdns \
    && dnf -y clean all

# check plugin is installed
RUN certbot plugins | grep -F 'dns-pdns'

ENTRYPOINT ["/usr/local/bin/certbot"]