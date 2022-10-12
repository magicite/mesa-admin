# mesa-admin

Builds an image meant for administrating a mesa-based system.

# Manual build
Example for if you are behind a web proxy.
```
export DOCKER_BUILDKIT=1
docker build --build-arg HTTP_PROXY=$http_proxy --build-arg HTTPS_PROXY=$https_proxy .
```