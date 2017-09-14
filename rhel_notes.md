
# Subscriptions:

https://access.redhat.com/solutions/253273
```
sudo subscription-manager register --username chad.homan --password <passwd> --auto-attach
```


```
sudo subscription-manager release --list

+-------------------------------------------+
          Available Releases
+-------------------------------------------+
7.0
7.1
7.2
7.3
7.4
7Server
```


```
sudo subscription-manager release --set=7.2
sudo subscription-manager release --set=7.4
```

```
sudo subscription-manager repos --enable=rhel-7-server-optional-rpms
sudo subscription-manager repos --enable=rhel-7-server-extras-rpms
sudo subscription-manager repos --enable=rhel-7-server-rpms
```
