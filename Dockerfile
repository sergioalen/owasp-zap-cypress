FROM cypress/base:16.13.0

RUN apt-get update && apt-get install -q -y --fix-missing \
	wget \
	curl \
	openjdk-11-jdk \
	xmlstarlet \
	unzip && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download OWASP ZAP and expand the latest stable release
RUN wget -qO- https://raw.githubusercontent.com/zaproxy/zap-admin/master/ZapVersions.xml | xmlstarlet sel -t -v //url |grep -i Linux | wget --content-disposition -i - -O - | tar zxv && \
	mv ZAP*/* . && \
	rm -R ZAP*
