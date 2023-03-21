# 5G-VIOS Installation Playbooks

This repository contains the playbooks for automatically installing and configuring the different components of the `5G-VIOS` ecosystem within a cloud environment.

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

Global variables for all playbooks are set in a single place located in a file called [all.yaml](https://github.com/5G-VICTORI-project/vios-infra/blob/main/playbooks/group_vars/all.yaml).

| **Variable**                    | **Description**                                                |
|:--------------------------------|:---------------------------------------------------------------|
| **`app_node_image`**            | The base image to use to build your `5G-VIOS` nodes            |
| **`app_node_base_flavor_name`** | The resources flavour to use for support nodes                 |
| **`app_node_key_flavor_name`**  | The resources flavour to use for key `5G-VIOS` nodes           |
| **`app_node_region`**           | The cloud region to use for `5G-VIOS` nodes                    |
| **`app_node_az`**               | The cloud availability zone to use for `5G-VIOS` nodes         |
| **`app_remote_user`**           | The remote ssh user to use to access your `5G-VIOS` nodes      |
| **`app_network`**               | The cloud network to attach your `5G-VIOS` nodes to            |
| **`app_sec_group`**             | The cloud security group to attach your `5G-VIOS`nodes to      |
| **`cloud_key`**                 | The cloud api key to use for secure access                     |
| **`cloud_net_provider`**        | The cloud network provider name, default set to `provider`     |
| **`osm_version`**               | The version of `OSM` you are using                             |
| **`edge_name`**                 | The name to be given as an identifier for an edge              |
| **`edge_vlan_range_start`**     | The starting vlan pool range for your edge, default set to `0` |
| **`edge_vlan_range_end`**       | The ending vlan pool range for your edge, default set to `0`   |  

## Running the Playbooks

The playbooks are designed to be run in a specific order to help with the automation.

### 1. Apply Cloud Environment Variables

Open a new terminal.

Set up the environment variables for your Openstack environment by running the following command, replacing `((file))` with your `OpenStack RC` file, and enter the password when prompted:

```console
source ((file))
```

### 2. Build the 5G-VIOS Cluster

At this stage, you can either build a three node production cluster, or a single node development cluster for `5G-VIOS`.

Run the following command to build a production cluster:

```console
./setup_vios_multi_node_cluster.sh
```

Or, for a development cluster, run:

```console
./setup_vios_single_node_cluster.sh
```

### 3. Build the Vyos Hub Node

Next, you will need to build the Vyos Hub node, which you can do by running the following command:

```console
./setup_vyos_hub.sh
```

### 4. Build the Vyos Spoke Node for your Edge

Before you can build your edge, you first need to set up the `Vyos Spoke` node for your edge.

To do this, run the following command (making sure you have given your edge a name in the `all.yaml` file):

```console
./setup_vyos_spoke.sh
```

### 5. Build your Edge or the EdgeProxy

When building your edge, there are two choices. 

You can either build a fully integrated edge with `OSM` and the `EdgeProxy`, or if you already have `OSM` set up, you can build a separate `EdgeProxy` node.

To build a fully integrated edge with `OSM` and the `EdgeProxy`, run the following command:

```console
./setup_edge.sh
```

Or, to build a separate EdgeProxy node, run the following command:

```console
./setup_edgeproxy_only.sh
```