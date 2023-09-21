pipeline {
    agent any
    tools {
        maven 'maven-3.9.4'
    }
    environment {
        docker_hub_pass = credentials('docker_hub_pass')
    }
    stages {
        stage ("Build the JAR file") {
                steps {
                    sh '''
                        echo "*************Building the JAR file*************"
                        mvn clean package
                    '''
                }
        }
        stage ("Build the docker image") {
                steps {
                    sh '''
                        echo "*************Building the Docker Image*************"
                        docker build -t kareemetaam/java-app:$BUILD_NUMBER .
                       '''
                }
        }
        stage ("Push the image to docker hub") {
            steps{
                    sh '''
                        echo "*******Pushing the docker image to docker hub*******"
                        docker login -u kareemetaam -p $docker_hub_pass
                        docker push kareemetaam/java-app:$BUILD_NUMBER
                    '''
            }
        }
        stage ("Deploy to EC2 instance") {
                steps {
                    sh '''
                        echo "*****Deploying the app container*****"
                        ssh -i id_rsa ubuntu@ec2-13-48-84-38.eu-north-1.compute.amazonaws.com /home/ubuntu/deploy.sh $BUILD_NUMBER
                       '''
                }
        }
        
    }

}
