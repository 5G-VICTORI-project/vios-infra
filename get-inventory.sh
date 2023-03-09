#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook test-get-inventory-playbook.yaml -vv