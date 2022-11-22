FROM alpine:latest
RUN apk add --no-cache openssh-client bash curl
RUN mkdir -p /root/.ssh
RUN chown -R root:root /root/.ssh
RUN echo -e "Host *\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
RUN mkdir /opt/ibmi
COPY localsetup.sh /opt/ibmi/
COPY start.sh /opt/ibmi/
WORKDIR "/opt/ibmi"
RUN curl -LJO https://public.dhe.ibm.com/software/ibmi/products/pase/rpms/bootstrap.sh
RUN curl -LJO https://public.dhe.ibm.com/software/ibmi/products/pase/rpms/bootstrap.tar.Z
CMD ["sh", "/opt/ibmi/start.sh"]
