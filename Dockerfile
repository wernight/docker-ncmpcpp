FROM debian:wheezy

MAINTAINER Werner Beroux <werner@beroux.com>

# http://ncmpcpp.rybczak.net/download.php#debian
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ncmpcpp \
    netcat-openbsd

# Clean-up to save some space
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create a random UID to avoid running as root.
RUN useradd --uid 71723 -m ncmpcpp

ADD ncmpcpp.sh /ncmpcpp.sh
RUN chmod o+rx /ncmpcpp.sh

ADD .ncmpcpp/config /home/ncmpcpp/.ncmpcpp/config
RUN chown -R ncmpcpp /home/ncmpcpp/.ncmpcpp

USER ncmpcpp

ENTRYPOINT ["/ncmpcpp.sh"]
CMD ["/usr/bin/ncmpcpp"]

