#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook os-vios-multi-node-cluster-playbook.yaml