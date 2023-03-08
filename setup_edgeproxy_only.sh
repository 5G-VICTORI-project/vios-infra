#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook edgeproxy-only-playbook.yaml