# BaiduPan_Docker
Run BaiduNetDisk_Linux in docker

Just run the following commands

```console
docker pull esperare/baidunetdisk:latest
docker run -itd --privileged --name yourContainerName esperare/baidunetdisk /sbin/init
```
