FROM fedora:latest

#Add oracle JDK downloaded from Oracle directly to the image
ADD jdk-8u151-linux-x64.rpm /

#Use YUM to install the oracle JDK that we downloaded and placed in the image directory for this image. (this is REQUIRED)
RUN yum install -y jdk-8u151-linux-x64.rpm

#RUN unzip pingfederate-9.0.0.zip
COPY pingfederate-9.0.0 /

#SET JAVA_HOME
ENV JAVA_HOME /usr/java/latest/

#Open Ports to be used
EXPOSE 9999
EXPOSE 9031

#redirect STDOUT for server.log so we can see it in the docker logs
#to view this run docker logs <container name>
RUN ln -sf /dev/stdout /pingfederate/log/server.log

RUN chmod +x /pingfederate/bin/run.sh
ENTRYPOINT ["/pingfederate/bin/run.sh"]