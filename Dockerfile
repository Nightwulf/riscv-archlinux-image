FROM riscfive/archlinux

ARG VERSION="0.16.0-dev.234+32a1aabff"

WORKDIR /root

RUN rm -rf /etc/pacman.d/gnupg/*

RUN pacman-key --init

RUN pacman-key --populate

RUN pacman -Syu --noconfirm

# Install base devel and languages
RUN pacman -S --noconfirm base-devel cmake gcc gcc-libs go nodejs jdk-openjdk python wget git \
			  sdl2 sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf \
			  vulkan-icd-loader vulkan-tools vulkan-validation-layers vulkan-headers spirv-tools \
			  shaderc glm 


# Install Zig
RUN wget https://ziglang.org/builds/zig-riscv64-linux-$VERSION.tar.xz && \
    tar -xf zig-riscv64-linux-$VERSION.tar.xz -C /usr/local/share && \
    ln -s /usr/local/share/zig-riscv64-linux-$VERSION/zig /usr/local/bin/zig && \
    rm -rf zig-riscv64-linux-$VERSION.tar.xz


CMD ["/bin/bash"]

