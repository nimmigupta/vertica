#!/bin/bash

for i in {1..3}; 
    do
        echo " Get $i vstack ";
        for host in `grep -P "^v_" /opt/vertica/config/admintools.conf | awk '{print $3}'| awk -F, '{print $1}'`;
        do
            echo " Get vstack of node $host" ;
            echo " **********************">> /tmp/vstack_$host_$i.log;
            echo " $i Vstack Node $host ">> /tmp/vstack_$host_$i.log;
            echo " **********************">> /tmp/vstack_$host_$i.log;
            ssh $host "/opt/vertica/bin/vstack">>/tmp/vstack_$host_$i.log;
        done;
        sleep 100;
    done;