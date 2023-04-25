#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook os-vyos-hub-playbook.yaml