FROM centos:7
COPY docker-entrypoint.sh /
RUN yum install -y epel-release maven wget \
&& yum clean all \
&& yum install -y  https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm \
&& yum install -y postgresql11-server postgresql11-contrib \
&& chown root /docker-entrypoint.sh \
&& chgrp root /docker-entrypoint.sh \
&& chmod 777 /docker-entrypoint.sh \

CMD ["/bin/bash","-c","/docker-entrypoint.sh && tail -f /dev/null"]
