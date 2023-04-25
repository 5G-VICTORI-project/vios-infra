#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook os-vios-single-node-cluster-playbook.yaml
