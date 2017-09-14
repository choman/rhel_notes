#!/usr/bin/bash

# create restart systemd stuff
sudo tee /tmp/start.sh > /dev/null <<EOF
#!/usr/bin/bash

cd /opt/harbor
/usr/bin/docker-compose $DCFLAGS start

EOF


