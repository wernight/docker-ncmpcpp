Docker ncmpcpp
==============

[Docker](https://docs.docker.com/installation/) containerized version of [ncmpcpp](http://ncmpcpp.rybczak.net/screenshots.php) (NCurses Music Player Client (Plus Plus)) a MPD console client.

Can be used together with any MPD server (like [Mopidy](https://www.mopidy.com/)); meant to be used together with [wernight/mopidy](https://registry.hub.docker.com/u/wernight/mopidy/) Docker image.


Usage
-----

    $ docker run --rm -it wernight/ncmpcpp [--help]

Note: It runs as user with random UID `71723` to avoid running as `root`.


### Tutorial using Docker Compose

*Docker Compose* is *not* required but it may simplify the startup of both ncmpcpp and Mopidy.

 1. [Install Docker and Compose](https://docs.docker.com/compose/install/), supposing you're on a recent Ubuntu it should be as simple as:

        $ wget -qO- https://get.docker.com/ | sh
        $ sudo gpasswd -a ${USER} docker
        $ curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

 2. Retrieve prepared `docker-compose.yml`:

        $ curl -LO https://raw.githubusercontent.com/wernight/docker-ncmpcpp/master/docker-compose.yml

 3. Update the downloaded `docker-compose.yml` by un-commenting when necessary.
    See also [wernight/mopidy](https://github.com/wernight/docker-mopidy) for some details.

 4. Start *Mopidy server* and *ncmpcpp client*:

        $ docker-compose run --rm -e PULSE_SERVER=tcp:$(hostname -i):4713 -e PULSE_COOKIE_DATA=$(pax11publish -d | grep --color=never -Po '(?<=^Cookie: ).*') ncmpcpp

    Note: You may have to run this *twice* to give time for the server to be up and running.

Now you only need to run the last command to start again or resume. Run `docker-compose rm -f mopidy` to stop the server.


Feedbacks
---------

Having more issues? [Report a bug on GitHub](https://github.com/wernight/docker-ncmpcpp/issues).
