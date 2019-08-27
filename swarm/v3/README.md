远程拷贝
```bash
scp -r dlink-docker-compose root@192.168.1.114:/winchannel
```

将所有的sh文件赋予可执行权限
```bash
for file in `find ./ -name '*.sh'`; do chmod +x $file;ls -lh $file; done
for file in `find ./ -name '*.sh'`; do dos2unix $file; done
for file in `find ./ -name '*.yml'`; do dos2unix $file; done
```