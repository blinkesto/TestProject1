#!/bin/sh

# Script to pull ansible role changes

cd /var/lib/rundeck/ansible/roles/apache
git pull

# This would not be done IRL, you can make a subproject of the playbooks dir 
cd /var/lib/rundeck/ansible/playbooks/TestProject1
git pull

# Demo change