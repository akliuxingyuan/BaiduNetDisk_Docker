# BaiduPan_Docker
Run BaiduNetDisk_Linux in docker

Just run the following commands

```sh
docker pull akliuxingyuan/baidunetdisk:latest
export exposedPost = 2333  # replace to what you need
export containerName = baidunetdisk # replace to what you want
docker run -itd -p $exposedPost:22 --name $containerName  akliuxingyuan/baidunetdisk /sbin/init
```

you can ssh with X11 forwarding to use it
eg:
```sh
ssh -X -p $exposedPost root@$domain
/opt/baidunetdisk/baidunetdisk
```