# Pritunl
# 

FROM debian:jessie

MAINTAINER Vartan Arabyan <vartana@gmail.com>

RUN echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" > /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN echo "deb http://repo.pritunl.com/stable/apt jessie main" > /etc/apt/sources.list.d/pritunl.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7F0CEB10
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv CF8E292A
RUN apt-get update -q
RUN apt-get install -y pritunl mongodb-org

ADD entry.sh /bin/entry.sh
CMD ["systemctl", "start", "mongod", "pritunl"]
CMD ["systemctl", "enable", "mongod", "pritunl"]

EXPOSE 9700
EXPOSE 1194
EXPOSE 11194

ENTRYPOINT ["/bin/entry.sh"]

CMD ["/usr/bin/tail", "-f","/var/log/pritunl.log"]




