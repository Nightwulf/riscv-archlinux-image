### Archlinux RISC-V docker image

Gitea build node image for RISC-V using archlinux base image from https://hub.docker.com/r/riscfive/archlinux


To build, just issue the following commands (docker and docker-compose needs to be installed):

> docker-compose build

> docker-compose up

Remember to remove any existing images from your docker instance by issuing a `docker rmi` command!

Hint: the image contains the programming language "Zig" which currently is best to use with nightly build images. At the top of the dockerfile there is a version variable. Just change that to the version of Zig you would like to be installed.
