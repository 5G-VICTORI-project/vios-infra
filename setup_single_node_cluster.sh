#!/bin/bash
source ~/.secrets/openstack
cd cluster
ansible-playbook vios-single-node-cluster-playbook.yaml
