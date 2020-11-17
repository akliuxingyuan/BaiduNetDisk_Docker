# BaiduPan_Docker
Run BaiduNetDisk_Linux in docker

### Run
Just run the following commands

```sh
docker pull akliuxingyuan/baidunetdisk:latest
docker run -itd \
           -p 2333:22 \
           --name baidunetdisk \
           akliuxingyuan/baidunetdisk \
           /sbin/init
```
### Use
you can ssh with X11 forwarding to use it
eg:
```sh
ssh -X -p 2333 root@localhost # password was `123123`
/opt/baidunetdisk/baidunetdisk
```