FROM debian:stretch-slim

RUN set -ex \
 && apt-get update \
    # http://ncmpcpp.rybczak.net/download.php#debian
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
     ncmpcpp \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    # Create a random UID to avoid running as root.
 && useradd --uid 71723 -m ncmpcpp

COPY entrypoint.sh /entrypoint.sh
COPY .ncmpcpp/config /home/ncmpcpp/.ncmpcpp/config
RUN set -ex \
 && chmod o+rx /entrypoint.sh \
 && chown -R ncmpcpp /home/ncmpcpp/.ncmpcpp

USER ncmpcpp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/ncmpcpp"]
