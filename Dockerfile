FROM alpine:3.7

RUN apk add --no-cache perl perl-io-socket-ssl perl-io-socket-inet6 perl-json && \
	apk add --no-cache --virtual=build-deps git perl-utils make gcc g++ perl-dev && \
	cd /tmp && \
	# Install dependencies that aren't available as Alpine packages
	cpan -i JSON::Any Data::Validate::IP && \
	# Install latest development version of ddclient as there hasn't been a new release for years
	git clone https://github.com/ddclient/ddclient.git --branch ec2acfb && \
	cd ddclient && \
	cp ddclient /usr/sbin/ && \
	mkdir -p /etc/ddclient && \
	mkdir -p /var/cache/ddclient && \
	# Clean up
	apk del --no-cache --purge build-deps  && \
	cd / && rm -rf ~/.cpan /tmp

CMD ["ddclient"]
