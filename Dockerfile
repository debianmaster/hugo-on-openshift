FROM rhel8/go-toolset:latest

ENV USER 1001
RUN curl https://github.com/gohugoio/hugo/releases/download/v0.65.1/hugo_0.65.1_Linux-64bit.tar.gz -o hugo_0.65.1_Linux-64bit.tar.gz \
	&& mkdir bin && cd bin && tar xzf ../hugo_0.65.1_Linux-64bit.tar.gz

ADD .s2i/bin /usr/local/s2i
LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i

USER 1001
EXPOSE 8080
CMD ["run"]
