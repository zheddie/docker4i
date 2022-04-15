FROM ubuntu:18.04
RUN apt-get update && apt-get install -y openssh-client
RUN mkdir -p /root/.ssh
#COPY id_rsa_shared /root/.ssh/id_rsa
RUN chown -R root:root /root/.ssh
RUN echo "Host *\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
#USER root 
RUN mkdir /opt/ibmi
COPY setupbldenv.sh /opt/ibmi/
COPY start.sh /opt/ibmi/
CMD ["sh", "/opt/ibmi/start.sh"]
