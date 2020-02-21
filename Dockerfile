FROM devtools/go-toolset-rhel7

ENV GOPATH "/opt/go"

USER root

RUN mkdir -p $GOPATH && scl enable go-toolset-1.12 "go get github.com/gohugoio/hugo"

ADD .s2i/bin /usr/local/s2i
LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i

USER 1001
EXPOSE 8080

CMD ["run"]
