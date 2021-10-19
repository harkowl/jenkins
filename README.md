# 准备好需要的环境包
## Downloads apache-maven-3.6.3.tar.gz
wget -c https://dlcdn.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz

## Downloads Python-3.6.8.tag
wget -c https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz

# 挂载jenkins已集成目录
## 本Jenkins目录为已经安装好插件以及任务
### jenkins_home 挂载到新创建的jenkins中 -v ./jenkins_home:/var/jenkins_home
          volumeMounts:
            - name: jenkinshome
              mountPath: /var/jenkins_home
      volumes:
        - name: jenkinshome
          hostPath:
            path: /data/jenkins_home

## 镜像建议使用huanke/jenkins-base:v1
地址：https://hub.docker.com/repository/docker/huanke/jenkins-base
