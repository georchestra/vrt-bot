# Quick reference

-    **Maintained by**:  
      [georchestra.org](https://www.georchestra.org/)

-    **Where to get help**:  
     the [geOrchestra Github repo](https://github.com/georchestra/georchestra), [IRC chat](https://kiwiirc.com/nextclient/irc.libera.chat/georchestra), Stack Overflow

# Featured tags

- `latest`, `23.0.x`

# Quick reference

-	**Where to file issues**:  
     [https://github.com/georchestra/georchestra/issues](https://github.com/georchestra/georchestra/issues)

-	**Supported architectures**:   
     [`amd64`](https://hub.docker.com/r/amd64/docker/)

-	**Source of this description**:  
     [docs repo's directory](https://github.com/georchestra/vrt-bot/blob/master/DOCKER_HUB.md)

# What is `georchestra/vrt-bot`

**VRT-bot** is a module for geOrchestra which aims at consuming some GDAL Virtual formats (VRT) files and load the underlying datas into a dedicated PostGIS database.

# How to use this image

It is recommended to use the official docker composition: https://github.com/georchestra/docker.

For this specific component, see the `docker-compose.yaml` file in [docs repo's directory](https://github.com/georchestra/vrt-bot/blob/master/docker-compose.yaml)

## Where is it built

This image is built using Dockerfile in `vrt-bot` repo. 

# License

View [license information](https://www.georchestra.org/software.html) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

[//]: # (Some additional license information which was able to be auto-detected might be found in [the `repo-info` repository's georchestra/ directory]&#40;&#41;.)

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
