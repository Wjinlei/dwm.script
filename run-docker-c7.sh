#!/bin/bash
sudo docker run -tid --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name myc7 local/c7-systemd
sudo docker exec -it myc7 bash

