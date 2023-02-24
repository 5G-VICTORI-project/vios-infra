#!/bin/bash
source ~/.secrets/openstack
cd cluster
ansible-playbook vyos-hub-playbook.yaml