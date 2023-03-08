#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook vios-single-node-cluster-playbook.yaml
