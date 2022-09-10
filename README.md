## Simple Spring App Containerised
This is a simple spring app that is containerised using CI/CD tool Jenkins

## Docker Enabled Usage in Jenkins

To allow Jenkins to utilize your host Docker installation for spinning up containers in builds and building images, mount the Docker socket as a volume and run the container in privileged mode.

`docker run -u 0 --privileged --name jenkins-docker -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -v jenkins_home:/var/jenkins_home jenkins/jenkins:latest`

This command is suitable for *nix/Linux command lines. On a Window machine, you'd need to specify the path to docker instead of using $(which docker).
