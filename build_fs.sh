#!/bin/bash

# 执行make命令
make yyh_lichee_zero_defconfig
sudo make

# 检查make命令的返回值
if [ $? -eq 0 ]; then
  # make成功，执行下一步操作
  sudo cp ./output/images/rootfs.tar /home/yyh/Learn/aw_v3s/
  cd /home/yyh/Learn/aw_v3s/nfs
  if [ $? -eq 0 ]; then
    # cd命令成功，执行删除指令
    sudo rm ./* -rf
    sudo tar -xvf ../rootfs.tar
    sudo cp /home/yyh/Learn/aw_v3s/buildroot/buildroot-2023.02.9/fs_setting.sh ./
  else
    # cd命令失败，输出错误信息并退出
    echo "Error: Failed to change directory to /home/yyh/Learn/aw_v3s/nfs"
    exit 1
  fi
else
  # make失败，输出错误信息并退出
  echo "Make failed. Error encountered."
  exit 1
fi

