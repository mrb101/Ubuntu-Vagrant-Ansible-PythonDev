#!/bin/sh

ansible-playbook devops/site.yml -i devops/hosts --private-key=$HOME/.vagrant.d/insecure_private_key
