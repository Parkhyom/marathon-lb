FROM mesosphere/marathon-lb
RUN     cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime ; \
        echo "nameserver 8.8.8.8" > /etc/resolv.conf ; \
        echo " \
        deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse \
        deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse \
        deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse \
        deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse \
        deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse \
        deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse \
        deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse \
        deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse \
        deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse \
        deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse " \
        > /etc/apt/sources.list ; \
        apt-get update ; \
        apt-get install -y --allow-unauthenticated dirmngr ; \
        apt-get install -y --allow-unauthenticated gnupg; \
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys  3B4FE6ACC0B21F32 ; \
        apt-get update && apt-get install -y --no-install-recommends net-tools vim inetutils-ping telnet ; \
        rm -rf /var/lib/apt/lists/*
