#! /bin/bash

ip link set enp3s0 up
dhcpcd enp3s0
