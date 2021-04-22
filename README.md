# rsdns-docker
Rackspace-hosted Dynamic DNS in a docker container (using linickx/rsdns)


## Environment Variables

The environment variables listed below need to be passed to the docker container
for use by the rsdns process. They can be placed in a .env file, or passed via
docker or docker-compose command line options:

- RSDNS_USER - Your Rackspace login ID
- RSDNS_APIKEY - Your Rackspace API Key
- RSDNS_DOMAIN - The domain name you are updating

