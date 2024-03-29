FROM riscfive/archlinux

WORKDIR /root

RUN rm -f /etc/pacman.d/gnupg

RUN pacman-key --init

RUN pacman-key --populate

RUN pacman -Syu

CMD ["/bin/bash"]

