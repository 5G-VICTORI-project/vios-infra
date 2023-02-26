#!/bin/bash
source ~/.secrets/openstack
cd playbooks
ansible-playbook vios-single-node-cluster-playbook.yaml
