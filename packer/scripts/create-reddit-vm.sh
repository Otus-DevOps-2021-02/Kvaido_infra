#!/bin/bash

yc compute instance create --name reddit-app --hostname reddit-app --memory=1  --create-boot-disk name=reddit-full,size=10,image-id=fd8b6mf5i323oln3ke75 --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata serial-port-enable=1 --ssh-key ~/.ssh/appuser.pub
