FROM riscfive/archlinux

WORKDIR /root

RUN rm -rf /etc/pacman.d/gnupg/*

RUN pacman-key --init

RUN pacman-key --populate

RUN pacman -Syu

# Install base devel and languages
RUN pacman -S --noconfirm base-devel cmake gcc gcc-libs go nodejs jdk-openjdk python wget git \
			  sdl2 sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf \
			  vulkan-icd-loader vulkan-tools vulkan-validation-layers vulkan-headers spirv-tools \
			  shaderc glm 


# Install Zig
RUN wget https://ziglang.org/builds/zig-linux-riscv64-0.12.0-dev.3493+3661133f9.tar.xz && \
    tar -xf zig-linux-riscv64-0.12.0-dev.3493+3661133f9.tar.xz -C /usr/local/share && \
    ln -s /usr/local/share/zig-linux-riscv64-0.12.0-dev.3493+3661133f9/zig /usr/local/bin/zig && \
    rm -rf zig-linux-riscv64-0.12.0-dev.3493+3661133f9.tar.xz


CMD ["/bin/bash"]

