#!/bin/bash

# This file sets up and runs net_test.sh in server mode on a machine and then tests with the local machine.
# Next disk_test.sh is run.
# Lastly, seeker test is done on the local machine.


# net_test.sh server mode
# Ask user for IP address input
echo "Enter the IP address or hostname of the machine you wish to run the net_test server: "
read net_test_server_ip

# Deliver required files for net_test to inputed IP.
echo "Delivering latest version of net_test.sh and qperf-0.4.9"
scp -r ~/Desktop/linux_benchmarks/qperf-0.4.9 ~/Desktop/linux_benchmarks/net_test.sh "invidi@$net_test_server_ip":~/benchmarking

# Start server on IP provided in background
# Use nohup to start in background and persist.
#TODO
# get PID back and kill the PID when net_test is finishing.
#TODO

ssh "invidi@$net_test_server_ip" 'cd benchmarking; nohup bash net_test.sh' &

# Start net_test from local machine and connect with IP provided
echo ""
echo "net_test in progress ... "
bash net_test.sh $net_test_server_ip
