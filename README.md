## docker 部署 lnmp 环境 

### 修改 Docker 镜像
由于众所周知的原因，docker安装后的默认配置，pull镜像时会特别慢，且经常会失败

修改镜像方法：进入 `Preference -> Daemon -> Basic -> Registry mirrors` 

新增：`http://7fb9e97d.m.daocloud.io`

### 如何使用
1. 终端中，先cd到该目录，然后执行`./start`，过程中如果有中断，通常是网络问题，多执行几次即可
2. 站点目录应和该目录同级
3. 新增站点需要在 `conf/vhost/`中新增对应的.conf文件，可参考 example.conf 配置
4. 配置文件中的root值，应以 `/datadisk/website/` 为前缀，例如：
    
        # example site1
        root /datadisk/website/site1/public/
        
        # example site2
        root /datadisk/website/site2/src/app/
        
        # example site3
        root /datadisk/website/site3/root/
5. 修改配置后，重启nginx容器才能生效 `docker restart nginx`

### 使用 XDEBUG
1. 为本地网卡设置别名 `sudo ifconfig lo0 alias 10.0.0.10`
2. 为chrome安装扩展 xdebug，并对其进行设置
3. 配置phpstorm

