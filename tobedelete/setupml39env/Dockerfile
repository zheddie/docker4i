FROM alpine:3.15.4
RUN apk add --no-cache openssh-client bash curl
RUN mkdir -p /root/.ssh
RUN chown -R root:root /root/.ssh
RUN echo -e "Host *\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
RUN mkdir /opt/ibmi
COPY localsetup.sh /opt/ibmi/
COPY start.sh /opt/ibmi/
CMD ["sh", "/opt/ibmi/start.sh"]
