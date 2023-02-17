#!/bin/bash
source ~/.secrets/openstack
cd cluster
ansible-playbook vios-multi-node-cluster-playbook.yaml