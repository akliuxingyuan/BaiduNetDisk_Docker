FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
    apt install --no-install-recommends --assume-yes apt-utils wget desktop-file-utils libnss3 libgtk-3-0 libx11-xcb-dev libxtst6 libxss1 fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy libcanberra-gtk3-module -y
RUN cd /tmp && \
    wget --no-check-certificate https://issuecdn.baidupcs.com/issue/netdisk/LinuxGuanjia/3.5.0/baidunetdisk_3.5.0_amd64.deb && \
    dpkg -i baidunetdisk_3.5.0_amd64.deb
RUN echo root:123123|chpasswd && \
    touch /root/.Xauthority
RUN apt install openssh-server -y && mkdir /var/run/sshd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/^#?X11UseLocalhost\s+.*/X11UseLocalhost no/g' /etc/ssh/sshd_config
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
