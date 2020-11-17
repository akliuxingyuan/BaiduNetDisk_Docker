# BaiduPan_Docker
Run BaiduNetDisk_Linux in docker

Just run the following commands

```sh
docker pull akliuxingyuan/baidunetdisk:latest
docker run -itd \
           -p 2333:22 \
           --name baidunetdisk \
           akliuxingyuan/baidunetdisk \
           /sbin/init
```

you can ssh with X11 forwarding to use it
eg:
```sh
ssh -X -p $exposedPost root@$domain # password was `123123`
/opt/baidunetdisk/baidunetdisk
```