# BaiduPan_Docker
Run BaiduNetDisk_Linux in docker

### Run
Just run the following commands

```sh
docker pull akliuxingyuan/baidunetdisk:3.0.1.2 # there is some bugs with latest baidunetdisk
docker run -itd \
           -p 2333:22 \
           --privileged \
           --name baidunetdisk \
           akliuxingyuan/baidunetdisk:3.0.1.2
```
### Use
you can ssh with X11 forwarding to use it
eg:
```sh
ssh -X -p 2333 root@localhost # password is `123123`
/opt/baidunetdisk/baidunetdisk
```