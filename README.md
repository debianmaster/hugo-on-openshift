# hugo-on-openshift
```sh
oc new-project hugo-test
oc adm policy add-scc-to-user anyuid -z builder
oc adm policy add-scc-to-user anyuid -z default
oc new-build https://github.com/debianmaster/hugo-on-openshift.git --strategy=docker --context-dir=hug-s2i --name=hugo-base
oc new-app hugo-base~https://github.com/debianmaster/hugo-example-site --name=gohugo
```

### To override config.toml
```sh
oc create configmap hugo-config --from-file=config.toml
oc volume dc gohugo --add -m '/tmp/src/config.toml' --sub-path='/tmp/src/config.toml'  -t configmap --configmap-name 'hugo-config'
```
