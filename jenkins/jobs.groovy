folder('Whanos base images') {
    description('Base images for Whanos')
}

folder('Projects') {
}

freeStyleJob('link-project') {
    parameters {
        stringParam('PROJECT_NAME', '', 'default')
        stringParam('PROJECT_URL', '', 'default')
    }
    steps {
        dsl {
            text('''
                freeStyleJob("Projects/$PROJECT_NAME") {
                    triggers {
                        cron('* * * * *')
                    }
                    scm {
                        git("$PROJECT_URL")
                    }
                    steps {
                        shell("/var/jenkins_home/whanos.sh $PROJECT_NAME")
                    }
                    wrappers {
                        preBuildCleanup()
                    }
                }
            ''')
        }
    }
}


freeStyleJob('Whanos base images/whanos-javascript') {
    steps {
        shell('docker build -t whanos-javascript - < /var/jenkins_home/images/javascript/Dockerfile.base')
        shell('docker tag whanos-javascript localhost:5000/whanos-javascript')
        shell('docker push localhost:5000/whanos-javascript')
    }
}
freeStyleJob('Whanos base images/whanos-java') {
    steps {
        shell('docker build -t whanos-java - < /var/jenkins_home/images/java/Dockerfile.base')
        shell('docker tag whanos-java localhost:5000/whanos-java')
        shell('docker push localhost:5000/whanos-java')
    }
}
freeStyleJob('Whanos base images/whanos-python') {
    steps {
        shell('docker build -t whanos-python - < /var/jenkins_home/images/python/Dockerfile.base')
        shell('docker tag whanos-python localhost:5000/whanos-python')
        shell('docker push localhost:5000/whanos-python')
    }
}
freeStyleJob('Whanos base images/whanos-c') {
    steps {
        shell('docker build -t whanos-c - < /var/jenkins_home/images/c/Dockerfile.base')
        shell('docker tag whanos-c localhost:5000/whanos-c')
        shell('docker push localhost:5000/whanos-c')
    }
}
freeStyleJob('Whanos base images/whanos-befunge') {
    steps {
        shell('docker build -t whanos-befunge - < /var/jenkins_home/images/befunge/Dockerfile.base')
        shell('docker tag whanos-befunge localhost:5000/whanos-befunge')
        shell('docker push localhost:5000/whanos-befunge')
    }
}
freeStyleJob('Whanos base images/Build all base image') {
    publishers {
        downstream('Whanos base images/whanos-c', 'SUCCESS')
        downstream('Whanos base images/whanos-javascript', 'SUCCESS')
        downstream('Whanos base images/whanos-java', 'SUCCESS')
        downstream('Whanos base images/whanos-python', 'SUCCESS')
        downstream('Whanos base images/whanos-befunge', 'SUCCESS')
    }
}
