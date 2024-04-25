#!/bin/sh
# sh restart.sh

# 设置全局变量
# git代码仓库路径
GIT_DIR="/home/source/jenkins-vue-test"
# git代码分支
GIT_BRANCH="main"

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
npm run serve
