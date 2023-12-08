FROM jenkins/jenkins:latest

USER root

RUN apt-get update \
    && apt-get install -y apt-transport-https ca-certificates curl \
    && curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg \
    && curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list \
    && echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update \
    && apt-get install helm -y docker.io python3 kubectl
RUN usermod -aG docker jenkins

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/jenkins.yaml

COPY jenkins/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

COPY images /var/jenkins_home/images
COPY kubernetes /var/jenkins_home/kubernetes
COPY jenkins/jobs.groovy /var/jenkins_home/jobs.groovy
COPY jenkins/jenkins.yaml /var/jenkins_home/jenkins.yaml
COPY jenkins/whanos.sh /var/jenkins_home/whanos.sh
COPY ansible/roles/kubernetes/admin.conf /root/.kube/config
