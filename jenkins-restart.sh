docker rm -f jenkins
docker run -tid --name jenkins -v /root/jenkins/jenkins_home:/var/jenkins_home -p 18080:8080 -p 50000:50000 huanke/jenkins-base:v1
