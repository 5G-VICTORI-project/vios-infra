#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook vyos-hub-playbook.yaml