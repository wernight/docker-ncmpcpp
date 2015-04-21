FROM debian:wheezy

MAINTAINER Werner Beroux <werner@beroux.com>

# http://ncmpcpp.rybczak.net/download.php#debian
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ncmpcpp

ENTRYPOINT ["ncmpcpp"]
