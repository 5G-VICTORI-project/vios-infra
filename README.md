# 5G-VIOS Installation Playbooks

This repository contains the playbooks for automatically installing and configuring the different components of the `5G-VIOS` ecosystem.

## Playbooks

The playbooks use `Ansible` as the automation platform, and are outlined as follows:

| **Playbook**                            | **Description**                                              |
|:----------------------------------------|:-------------------------------------------------------------|
| **`vios-multi-node-cluster-playbook`**  | Builds a three node `VIOS` production cluster                |
| **`vios-single-node-cluster-playbook`** | Builds a single node `VIOS` development cluster              |
| **`vyos-hub-playbook`**                 | Builds the `Vyos` Hub node                                   |
| **`edge-with-osm-edgeproxy-playbook`**  | Builds an edge node with `OSM` and the `EdgeProxy` installed |
| **`edgeproxy-only-playbook`**           | Builds a single node with just the `EdgeProxy` installed     |
| **`vyos-spoke-playbook`**               | Builds a `Vyos` Spoke node                                   |

## Prerequisites

To run the playbooks you will need to fulfil a number of prerequisites.

### Secrets

Create a new file in your home directory to store secret environment variables:

```console
mkdir ~/.secrets
touch ~/.secrets/ansible
```

In the `ansible` file you just created, set the following environment variables, replacing `((value))` with your own corresponding values, and save the file:

```console
export CLOUD_SERVER=((value))
export CLOUD_USERNAME=((value))
export CLOUD_PASSWORD=((value))
export CLOUD_AUTH_URL=((value))
export CLOUD_TENANT_NAME=((value))
```

### OpenStack
For your given cloud tenant to run the playbooks against, you will also need to download to your home directory your `OpenStack RC (Identity API v3)` file, which you can do from Horizon.

You will also need to create a key pair.  In Horizon, you can either create a new key pair, or upload the public key of an existing key pair. Name you key pair as `ansible`.

## Group Variables

Global variables for all playbooks are set in a single file located in a file called [all.yaml](https://github.com/5G-VICTORI-project/vios-infra/blob/main/playbooks/group_vars/all.yaml).