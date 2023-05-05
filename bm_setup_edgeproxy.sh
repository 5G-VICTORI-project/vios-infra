#!/bin/bash
cd playbooks
ansible-playbook -i ../inventory bm-edgeproxy-only-playbook.yaml
