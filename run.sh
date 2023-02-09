#!/bin/bash
source ~/.secrets/openstack
cd setup
ansible-playbook vios-single-node-playbook.yaml
