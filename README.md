# BaiduPan_Docker
Run BaiduNetDisk_Linux in docker

just run following commends

```console
docker pull akliuxingyuan/baidunetdisk:latest
docker run -itd --privileged --name yourContainerName akliuxingyuan/baidunetdisk /sbin/init
```
