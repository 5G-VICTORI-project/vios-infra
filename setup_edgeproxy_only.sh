#!/bin/bash
source ~/.secrets/openstack
cd playbooks
ansible-playbook edgeproxy-only-playbook.yaml