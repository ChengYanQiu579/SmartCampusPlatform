# SmartCampusPlatform

校园论坛+ChatBot一站式满足学生社交、询答需求  



# 运行需求  
## backed_java需求：（使用端口8080）   
1.请确保本地下载安装有elasticsearch，启动java后端前必须打开（请关闭elastic的ssl加密）  
2.请确保本地下载安装有redis服务，启动前必须打开  
3.请确保本地安装有MySql，已建立scp数据库，用户名为 root，密码为 123456  
连接到scp的前提下运行根目录下的 scp.sql 进行数据库初始化  
4.运行backed_java\src\main\java\com\scp\smartcampus\SmartCampusApplication.java启动Java后端服务

## backed_python需求：（使用端口8000）  
1.请确保有python虚拟环境，在项目根目录下有 .env 虚拟环境，且PYTHON版本不低于3.13  
其他项参见backed_python/requirements.txt 完成py环境正确配置  

## fronted_uniapp需求：  
1.前端使用Vue3语法开发，请确保本地安装有Node.js。  
2.前端完全基于UniApp开发，可同步运行在Web端和App端，推荐安装使用HBuilderX进行前端一键启动。（前端使用端口为80）
（PS：使用手机连接（即UniApp一键部署至手机基座）需要做adb端口映射，将对手机8080端口的访问映射给电脑
具体操作：
1.在HBuilderX\plugins\launcher-tools\tools\adbs路径下打开终端（PowerShell）
2.运行 .\adb reverse tcp:8080 tcp:8080
3.显示 8080 即可（每次手机重新连接电脑都需要端口映射）
）