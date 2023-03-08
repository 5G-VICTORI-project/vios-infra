#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook edge-with-osm-edgeproxy-playbook.yaml