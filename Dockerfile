FROM debian:stable-slim
LABEL maintainer.name="Matteo Pietro Dazzi" \
    maintainer.email="matteopietro.dazzi@gmail.com" \
    version="1.0.0" \
    description="RAR binary for ARM platforms"
RUN apt-get update && \
    apt-get upgrade -y && \
    dpkg --add-architecture i386 && \
    echo "deb http://ftp.de.debian.org/debian stretch main non-free" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install qemu-user-static rar:i386 -y
ENTRYPOINT [ "qemu-i386-static", "/usr/bin/rar" ]