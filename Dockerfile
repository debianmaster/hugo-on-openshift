FROM rhel8/go-toolset:latest

ENV USER 1001

RUN scl list-collections
RUN scl enable go-toolset-7 "GOPATH=`realpath ~/go` go get -d github.com/gohugoio/hugo" \
	&& scl enable go-toolset-7 "GOPATH=`realpath ~/go` go install github.com/gohugoio/hugo"

ADD .s2i/bin /usr/local/s2i
LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i

USER 1001
EXPOSE 8080
CMD ["run"]
