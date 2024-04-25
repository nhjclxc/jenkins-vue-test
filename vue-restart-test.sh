#!/bin/sh
# sh restart.sh

# 设置全局变量
# git代码仓库路径
GIT_DIR="/home/source/jenkins-vue-test"
# git代码分支
GIT_BRANCH="main"
# nginx代理目录
NGINX_DIR="/usr/env/nginx/html/html/test"
NGINX_SBIN_DIR="/usr/env/nginx/html/sbin"

#git clone https://github.com/nhjclxc/jenkins-vue-test.git

# 1、进入前端代码的git路径，拉取最新的代码
# 进入工作目录
cd $GIT_DIR
# 进入指定分支
git checkout $GIT_BRANCH
# 更新代码 git pull origin master
git pull

# 2、npm install
npm install

# 3、npm run serve
npm run build:test
echo "打包完成."

# 移动到nginx代理目录
cp -r ./dist/* $NGINX_DIR
echo "dist文件夹移动成功."

# 删除dist文件夹，防止给下一次打包造成冲突
rm -r ./dist

#重启nginx
cd $NGINX_SBIN_DIR
./nginx -s reload
echo "nginx重启成功."

