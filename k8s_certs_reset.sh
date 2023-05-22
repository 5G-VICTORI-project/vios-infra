#!/bin/bash

sudo cp /etc/kubernetes/admin.conf /etc/kubernetes/admin.old
sudo mv ~/.kube/config ~/.kube/config.old

sudo kubeadm certs renew all
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chown $(id -u):$(id -g) ~/.kube/config
