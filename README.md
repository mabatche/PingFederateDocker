# PingFederateDocker

Prerequisites:
In order to build this image you must have the following already downloaded and in the same directory as your Dockerfile.

- Oracle Java JDK version jdk-8u151-linux-x64 - You must download the rpm version for linux.  This is required.
- PingFederate 9.0.0 and a license file from Ping Identity.

Instructions to prepare for build:

1 - make sure the above files are in the same directory as your Dockerfile
2 - Unzip PingFederate 9.0.0 in the same directory as your Dockerfile.  /pingfederate-9.0.0/pingfederate should be the path.
3 - Decide which ports you want PingFederate to run on.  9999 is the default admin port and 9031 is the default runtime port.  If you wish to change these you can always map them from the docker run command later.

Build:
To build the inital image
Run the following from the directory where the Dockerfile is located:

 docker build -t my-ping-image .

- This will copy and install all the necessary stuff to get PingFederate running. 

After a successful build, type the following to run your PingFederate image for the first time.

 docker run --name pingfederate9.0.0 -it -p 9031:9031 -p 9999:9999 my-ping-image

- This will start your image and make PingFederate available.  The admin console can be accessed at https://localhost:9999/pingfederate
- Im sure there is a better way to do this, but on the previous command, once you see that pingfed is running hit CTRL-C to cancel out of it and kill the image.
- Now that the container is created and the image exists we can use it each time without losing state by running the following command
 
 docker start pingfederate9.0.0

- This time the image will start in the background.  Now you can go to https://localhost:9999/pingfederate and complete the initial setup of PingFederate. 
- When you are done settting up PingFederate issue the following command to stop the image

 docker stop pingfederate9.0.0

- The above command will save the state of the docker image each time without rebuilding it.  If yous wish to rebuild it each time use the docker run command.


NOTES:

If you wish to view the logs you can use the folowing command:

server.log
docker container exec -it my-ping-image tail -f /pingfederate/log/server.log

access.log
docker container exec -it my-ping-image tail -f /pingfederate/log/access.log

audit.log
docker container exec -it my-ping-image tail -f /pingfederate/log/audit.log


