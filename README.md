# Basic Ansible NSO playbook collection
___

## _Summary_

An ansible collection that will install NSO and its packages and configurations into 
target systems based on an NSO system installation.   The playbooks are intended to consist of small
units of functionality that can be run sequentially to achieve an operations goal.

## Basic Theory of Ops

3 variables are used for the playbooks
* nsobin - the filename of the NSO installation binary
* pkgdst - a directory on the destination where files will be uploaded
* pkgsrc - a local directory where the NSO installer and the packages and NEDs are stored.  This directory is 
expected to be prepared in advance of the playbook calls and have a structure of (pkgsrc = path/to/distribution):

```
           distribution/
                 |
     -----------------------
     |                     |
 nso-installer.bin      packages/
                  (.tgz or .tar.gz packages)
 ```
 
## Setup

For best results, the following actions should be performed on the target system

* add the management user.  "tailf" is the example user in these playbooks.  Other usernames should be 
changed in all files where they occur
* add <tailf> to the sudoers file as: tailf  ALL=(ALL)       NOPASSWD: ALL
* if you cannot do the previous line, you will need to add --ask-sudo-pass to most of the playbook lines
* add the manager ssh keys for the tailf user on the target system
* edit the inventory file to add the target hosts


## Examples
Basic examples of sequences below to show command execution from a bash shell (the variables have been set in advance).

### To install

* ansible-playbook -i inventory copy_packages.yml -e "pkgsrc=$SRCDIR pkgdst=$DSTDIR"
* ansible-playbook -i inventory install_nso.yml -e "nsobin=$NSOBIN pkgdst=$DSTDIR"
* ansible-playbook -i inventory start_nso.yml

### To update the packages on an installation
* ansible-playbook -i inventory copy_packages.yml -e "pkgsrc=$SRCDIR pkgdst=$BASEDIR"
* ansible-playbook -i inventory update_packages.yml -e "pkgdst=$DSTDIR"
* ansible-playbook -i inventory reload_packages.yml

### To stop and remove an installation
* ansible-playbook -i inventory stop_nso.yml
* ansible-playbook -i inventory clean_nso.yml
