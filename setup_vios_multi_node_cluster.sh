#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook vios-multi-node-cluster-playbook.yaml