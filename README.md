# Vagrant-Getting-Started
Another PluralSight course, on Vagrant

# Course Exercise Files

Availbe for Wes Higbee's GitHub repo

- [g0t4/course2-vagrant-gs: Getting Started with Vagrant (refresh/2nd edition)](https://github.com/g0t4/course2-vagrant-gs/tree/master)

# ToDo

Things to work on to expand this example.

- Can I get Vagrant to provision VMs on specific networks with specific IPs using VMWare?
  - Or does this only work for Virtual Box and Libvrt?
  - No, since the move to the M series chips, this is not possible with VMWare
- To be able to enable Vagrant to create private networks and assign static IPs we need to use a different hypervisor
  - Try Parallels
    - YES! Parallels is capable of creating private networks and assigning static IPs. These IPs are also reachable from the host system.
  - Try QEMU
- [x] Implement Ansible provisioner but working with my Ansible Docker container
  - See how Miko setup Scalable Vagrant
- [ ] Understand how Miko generated things dynamically by having both Vagrant and Ansible parse the same configuration file
  - [ ] Might need to learn some Ruby for this

# Understanding the Ansible Provisioner

## Documentation

- [Ansible - Provisioning | Vagrant | HashiCorp Developer](https://developer.hashicorp.com/vagrant/docs/provisioning/ansible)
- [Ansible - Short Introduction | Vagrant | HashiCorp Developer](https://developer.hashicorp.com/vagrant/docs/provisioning/ansible_intro)
- [Common Ansible Options - Provisioning | Vagrant | HashiCorp Developer](https://developer.hashicorp.com/vagrant/docs/provisioning/ansible_common)

## When working with Ansible in a container

Sometimes it is preferred to work with Ansible but in a Docker container in order to keep the host environment clean and easily switch between differnt versions of Ansible.
This does present some challenges comapred to working with Ansible installed on the host natively.

The first that needs to be done is provide a custom command for Vagrant to use to invoke Ansible Playbooks. This is more neatly done by creating a wrapper script which encapsulates the more complicated Docker command.

A custom path to the Vagrant inventory file needs to be specified because when this is passed to Ansible, absolute paths are used, which don't exist when Ansible runs inside the container. Even when this is done as a relative path, the Vagrant generated inventory cannot be used because it contains absolute paths in the host var which specifies the host-specific SSH private key file to use.

This means that we have to create our own inventory which provides all the needed host configuration and also uses relative paths which make sense inside the container.
When it comes to specifying IPs for the VMs, to maintain alignment between the configuration which Vagrant uses and the configuration which Ansible uses, it is best practice to define all this in an external YAML configuration file which is part of the Ansible group vars. This file will be parsed by Vagrant when creating VMs and also parsed by a dynamic Ansible inventory.

Currently the inventory is explictly defined. This needs to become dynamic, so that everything remains in line if the IPs change or the machine name, or even the hypervisor being used.
