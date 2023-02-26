#!/bin/bash
source ~/.secrets/openstack
cd playbooks
ansible-playbook vios-multi-node-cluster-playbook.yaml