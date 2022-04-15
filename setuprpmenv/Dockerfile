FROM ubuntu:18.04
RUN apt-get update && apt-get install -y openssh-client curl
RUN mkdir -p /root/.ssh
RUN chown -R root:root /root/.ssh
RUN echo "Host *\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
RUN mkdir /opt/ibmi
COPY setuprpmenv.sh /opt/ibmi/
COPY start.sh /opt/ibmi/
WORKDIR "/opt/ibmi"
RUN curl -LJO https://public.dhe.ibm.com/software/ibmi/products/pase/rpms/bootstrap.sh
RUN curl -LJO https://public.dhe.ibm.com/software/ibmi/products/pase/rpms/bootstrap.tar.Z
CMD ["sh", "/opt/ibmi/start.sh"]
