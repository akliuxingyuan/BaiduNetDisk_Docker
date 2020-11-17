FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
    apt install --no-install-recommends wget libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libuuid1 libappindicator3-1 libsecret-1-0 libx11-xcb-dev libxcb-dri3-dev libdrm-dev libgbm-dev libasound2-dev openssh-server deborphan desktop-file-utils -y && \
    mkdir /var/run/sshd && \
    cd /tmp && \
    wget --no-check-certificate https://issuecdn.baidupcs.com/issue/netdisk/LinuxGuanjia/3.5.0/baidunetdisk_3.5.0_amd64.deb && \
    dpkg -i baidunetdisk_3.5.0_amd64.deb && \
    echo root:123123|chpasswd && \
    touch /root/.Xauthority && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/^#?X11UseLocalhost\s+.*/X11UseLocalhost no/g' /etc/ssh/sshd_config && \
    deborphan | xargs apt-get -y remove --purge && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]