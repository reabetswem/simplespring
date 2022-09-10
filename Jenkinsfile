pipeline {
    agent any
    tools {
            maven "maven-3.8.6"
        }
    stages {

        stage('Initialize'){
          steps{
            script{

            /*
                Maven and Docker must be configured in the Jenkins Global Configuration
                The settings.xml must be configured in the Jenkins instance

              def dockerHome = tool 'Docker'
              def mvnHome = maven 'maven-3.8.6'
              mvnHome = tool 'maven-3.8.6'
              env.PATH = "${mvnHome}/bin:${env.PATH}"
              */
              echo "M2_HOME = /opt/maven"
              echo "PATH = ${M2_HOME}/bin:${PATH}"


            }
          }
        }

        stage('Git Checkout') {
            steps{
                checkout scm
            }
        }

        stage('Maven Build') {
                    steps{
                            script{
                                    sh "mvn clean install"

                            }
                    }
                }

        stage('Build Image'){
            steps{
                    script{

                      docker.withRegistry('docker.io/reabetswem/rea-repo', 'dockerCred'){
                      def customImage = docker.build("rea-repo:${env.BUILD_ID}")
                      customImage.push()

                    }
                    }

            }
            }

            stage('Deploy Image') {
                        steps{
                            echo "Deploy stage"
                        }
                    }
        }
    }