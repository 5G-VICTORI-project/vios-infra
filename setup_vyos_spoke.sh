#!/bin/bash
source ~/.secrets/ansible
cd playbooks
ansible-playbook vyos-spoke-playbook.yaml