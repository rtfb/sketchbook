FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    autopoint \
    binfmt-support \
    bmap-tools \
    btrfs-progs \
    build-essential \
    ca-certificates \
    cryptsetup \
    curl \
    dbus-user-session \
    dctrl-tools \
    dosfstools \
    e2fsprogs \
    fdisk \
    flex \
    genimage \
    gettext \
    git \
    kmod \
    libtool \
    mmdebstrap \
    mtools \
    parted \
    pkg-config \
    podman \
    pv \
    python3 \
    python3-debian \
    python3-jsonschema \
    python3-pip \
    python3-yaml \
    python-is-python3 \
    qemu-user-static \
    rsync \
    sudo \
    systemd-container \
    udev \
    uuid-runtime \
    xz-utils \
    zip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["/bin/bash"]
