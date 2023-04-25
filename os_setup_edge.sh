#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook os-edge-with-osm-edgeproxy-playbook.yaml