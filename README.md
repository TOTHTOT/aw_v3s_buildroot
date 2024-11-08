# aw_v3s_buildroo 编译记录

## 编译报错记录

- 编译 openssh 报错:
  
  - 出现如下错误是因为目录下没有指定文件, 只需要在该目录下创建对应文件并改变文件权限为`777`即可;
  
  ```shell
  /home/yyh/Learn/aw_v3s/buildroot/buildroot-2023.02.9/output/host/bin/arm-buildroot-linux-gnueabihf-gcc-ranlib libopenbsd-compat.a
  make[2]: 离开目录“/home/yyh/Learn/aw_v3s/buildroot/buildroot-2023.02.9/output/build/openssh-9.6p1/openbsd-compat”
  make[1]: 离开目录“/home/yyh/Learn/aw_v3s/buildroot/buildroot-2023.02.9/output/build/openssh-9.6p1”
  package/pkg-generic.mk:280: recipe for target '/home/yyh/Learn/aw_v3s/buildroot/buildroot-2023.02.9/output/build/openssh-9.6p1/.stamp_built' failed
  make: *** [/home/yyh/Learn/aw_v3s/buildroot/buildroot-2023.02.9/output/build/openssh-9.6p1/.stamp_built] Error 2null
  ```

- 其他报错
  
  - 这是因为编译文件系统没使用`sudo make`
  
  ```shell
  yyh@ubuntu:~/Learn/aw_v3s/buildroot/buildroot-2023.02.9$ make
  
  You seem to have the current working directory in your
  LD_LIBRARY_PATH environment variable. This doesn't work.
  support/dependencies/dependencies.mk:27: recipe for target 'dependencies' failed
  make[1]: *** [dependencies] Error 1
  Makefile:82: recipe for target '_all' failed
  make: *** [_all] Error 2
  yyh@ubuntu:~/Learn/aw_v3s/buildroot/buildroot-2023.02.9$
  ```
  
- 配置 `telnet` 和`telnetd`要在`busybox`中
- 配置`cst`时间通过tftp下载`localtime`文件到`/etc/`目录下
