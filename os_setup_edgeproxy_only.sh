#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook os-edgeproxy-only-playbook.yaml