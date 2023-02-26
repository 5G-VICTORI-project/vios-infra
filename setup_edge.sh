#!/bin/bash
source ~/.secrets/openstack
cd playbooks
ansible-playbook edge-with-osm-edgeproxy-playbook.yaml