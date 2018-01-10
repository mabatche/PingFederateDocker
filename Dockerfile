FROM centos:latest

MAINTAINER mabatche@gmail.com <mabatche@gmail.com>

#Add oracle JDK downloaded from Oracle directly to the image
ADD jdk-8u151-linux-x64.rpm /

#Use YUM to install the oracle JDK that we downloaded and placed in the image directory for this image. (this is REQUIRED)
RUN yum -y update && yum install -y jdk-8u151-linux-x64.rpm

#Copy the unzipped version of pingfederate-9.0.0 to /pingfederate
COPY pingfederate-9.0.0 /

#Clean up the rpm file used to install java to save space
RUN rm /jdk-8u151-linux-x64.rpm

#SET JAVA_HOME
ENV JAVA_HOME /usr/java/latest/

#Open Ports to be used
EXPOSE 9999 9031

RUN chmod +x /pingfederate/bin/run.sh
ENTRYPOINT ["/pingfederate/bin/run.sh"]