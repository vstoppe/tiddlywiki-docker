# TiddliWiki 5 Docker image

Run TiddlyWiki 5 via Docker.

Forked from
[m0wer/tiddlywiki-docker](https://github.com/m0wer/tiddlywiki-docker).

The Docker image is available at [m0wer/tiddlywiki - Docker
Hub](https://hub.docker.com/r/m0wer/tiddlywiki).

## Available Docker Images at DockerHub

Image Name       | Tag        | TiddyWiki Version
-----------------|------------|------------------
m0wer/tiddlywiki | latest     | 5.2.7
m0wer/tiddlywiki | v[X]       | [X]
m0wer/tiddlywiki | test       | ?

## Prerequisites

* Docker.

## Quickstart

```bash
docker run -d -p 8080:8080 m0wer/tiddlywiki
```

Now TiddlyWiki should be running on
[http://localhost:8080](http://localhost:8080).

## Keeping the data

The container uses a Docker volume to save the wiki data. In order not
to lose sight of that, I recommend using a local directory for the volume.

```bash
docker run -d -p 8080:8080 -v $(pwd)/.tiddlywiki:/var/lib/tiddlywiki m0wer/tiddlywiki
```

In this example, the folder `$(pwd)/.tiddlywiki` is used for the data.

## Authentication

Authentication is disabled by default. To enable it, simply provide the
`USERNAME` and `PASSWORD` environment variables.

## Other settings

### Limit Node.js memory

If you are in a memory-constrained environment, you can provide the
`NODE_MEM` environment variable to specify the memory ceiling (in MB)

### Debug

Set the `DEBUG_LEVEL` environment variable to `debug`. For example by passing
`-e DEBUG_LEVEL=debug` option in `docker run`.

### Path prefix

Set the `PATH_PREFIX` environment variable to customize the path prefix for
serving TiddlyWiki. For example by passing `-e PATH_PREFIX=\wiki` option in
`docker run`. According to this [note][path-prefix-note], please remember to
configure the client as well.

[path-prefix-note]: https://tiddlywiki.com/static/Using%2520a%2520custom%2520path%2520prefix%2520with%2520the%2520client-server%2520edition.html

## Docker Compose

To keep all the docker settings, environment variables and volume data in a folder you can use `docker compose`.

Create a folder for the project:

```
mkdir my-tiddlywiki-docker
cd my-tiddlywiki-docker
```

Create a folder for the data:

```
mkdir tiddlywiki
```

Create `docker-compose.yml` with the following contents:

```
version: '3'
services:
  tiddlywiki:
    image: m0wer/tiddlywiki
    volumes:
      - ./tiddlywiki:/var/lib/tiddlywiki
    restart: unless-stopped
    ports:
      - 8080:8080
    #environment:
    #  - DEBUG_LEVEL=debug
    #  - PATH_PREFIX=\wiki
    #  - NODE_MEM=128
    #  - USERNAME=test
    #  - PASSWORD=test
```

Then run `docker compose up -d`.
