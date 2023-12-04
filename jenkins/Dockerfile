FROM jenkins/jenkins:latest

USER root

RUN apt-get update && apt-get install -y docker.io python3
RUN usermod -aG docker jenkins

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/jenkins.yaml

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

COPY images /var/jenkins_home/images
COPY jobs.groovy /var/jenkins_home/jobs.groovy
COPY jenkins.yaml /var/jenkins_home/jenkins.yaml
COPY whanos.sh /var/jenkins_home/whanos.sh
COPY whanos.txt /var/jenkins_home/whanos.txt
