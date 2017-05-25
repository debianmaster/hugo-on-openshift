# hugo-on-openshift

### using debianmaster/hugo-base base image
#### One time setup
```sh
oc new-project hugo-test
oc adm policy add-scc-to-user anyuid -z builder
oc adm policy add-scc-to-user anyuid -z default
```

#### Convert hugo website to docker image and deploy
```sh
oc new-app debianmaster/hugo-base~https://github.com/debianmaster/hugo-example-site --name=gohugo
```

### To override config.toml
```sh
oc create configmap hugo-config --from-file=config.toml
oc volume dc gohugo --add -m '/tmp/src/config.toml' --sub-path='/tmp/src/config.toml'  -t configmap --configmap-name 'hugo-config'
```

### Build your own base image
```sh
oc new-build https://github.com/debianmaster/hugo-on-openshift.git --strategy=docker --context-dir=hug-s2i --name=hugo-base
```
