FROM rhel8/go-toolset:latest

ENV GOPATH /go
ENV USER 1001

RUN mkdir $GOPATH/src/github.com/gohugoio && cd $GOPATH/src/github.com/gohugoio && \
	git clone https://github.com/gohugoio/hugo.git && cd hugo && go install --tags extended

ADD .s2i/bin /usr/local/s2i
LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i

USER 1001
EXPOSE 8080
CMD ["run"]
