# BaiduPan_Docker
Run BaiduNetDisk_Linux in docker

just run following commends

```console
docker pull esperare/baidunetdisk:latest
docker run -itd --privileged --name yourContainerName esperare/baidunetdisk /sbin/init
```
