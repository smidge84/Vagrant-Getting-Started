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
- Implement Ansible provisioner but working with my Ansible Docker container
  - See how Miko setup Scalable Vagrant
