FROM debian:jessie

MAINTAINER Werner Beroux <werner@beroux.com>

# 1. http://ncmpcpp.rybczak.net/download.php#debian
# 2. Create a random UID to avoid running as root.
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
     ncmpcpp \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && useradd --uid 71723 -m ncmpcpp

USER ncmpcpp

CMD ["ncmpcpp"]
