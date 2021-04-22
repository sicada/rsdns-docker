# rsdns-docker
Rackspace-hosted Dynamic DNS in a docker container (using linickx/rsdns)

## Sources

- The base **rsdns** code: https://github.com/linickx/rsdns
- Built docker images: https://hub.docker.com/repository/docker/sicadaco/rsdns/

## Environment Variables

The environment variables listed below need to be passed to the docker container
for use by the rsdns process. They can be placed in a **.env** file, or passed via
docker or docker-compose command line options:

- RSDNS_USER - Your Rackspace login ID
- RSDNS_APIKEY - Your Rackspace API Key
- RSDNS_DOMAIN - The domain name you are updating

## Run with docker-compose

You can use docker-compose to pull and run a pre-built docker image of this code. With the included docker-compose.yml config file in the current working directory, you can run the image in a container:

```
docker-compose up rsdns
```

The output when the container is first run will be:

```
rsdns    | rsdns container has started.
rsdns    | crond 4.5 dillon's cron daemon, started with loglevel notice
```

Once an hour, at the 30-minute mark, the cron service will run the rsdns update service and the docker container will emit a message like:

```
rsdns    | Updating DNS record for domain: your.domainname.com
rsdns    | Job status is: RUNNING
rsdns    | Job status is: COMPLETED
rsdns    | 
rsdns    | Record A-230981754 updated.
rsdns    | 
```

The included file **docker-compose.service** can be used to allow systemd to control the docker-compose process.
