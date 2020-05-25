FROM ubuntu:18.04
RUN apt update && \
    apt install wget desktop-file-utils libnss3 libgtk-3-0 libx11-xcb-dev libxss1 fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy libcanberra-gtk3-module -y
RUN cd /tmp && \
    wget http://wppkg.baidupcs.com/issue/netdisk/LinuxGuanjia/3.0.1/baidunetdisk_linux_3.0.1.2.deb && \
    dpkg -i baidunetdisk_linux_3.0.1.2.deb
RUN echo root:123123|chpasswd
RUN apt install openssh-server -y
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/^#?X11UseLocalhost\s+.*/X11UseLocalhost no/g' /etc/ssh/sshd_config
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"] 
