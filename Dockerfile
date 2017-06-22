FROM arm32v6/alpine:3.6

RUN apk add --no-cache --virtual=build-deps make gcc g++ perl-dev wget && \
	apk add --no-cache perl perl-io-socket-ssl perl-io-socket-inet6 && \
	cd /tmp && \
	wget https://cpanmin.us/ -O cpanm && \
	chmod +x cpanm && \
	./cpanm JSON::Any Data::Validate::IP && \
	wget https://downloads.sourceforge.net/project/ddclient/ddclient/ddclient-3.8.3.tar.bz2 -O- | tar xjv && \
	cp ddclient-3.8.3/ddclient /usr/sbin/ && \
	apk del --no-cache --purge build-deps  && \
	cd / && rm -rf /root/.cpanm /tmp

RUN mkdir -p /var/cache/ddclient

CMD ["ddclient"]
