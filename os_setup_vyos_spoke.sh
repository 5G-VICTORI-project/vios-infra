#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook os-vyos-spoke-playbook.yaml