#!/bin/bash -l

# Author: Lighton Phiri <lighton.phiri@gmail>
# http://lightonphiri.org
# 
# February 1, 2013
#
# A basic DSpace ingest script
# It basically makes use of DSpace's metadata-import utility to 
# ingest 1k batch files for specified workloads
# 

# 
for workload in `seq 1 10`
   do
      echo "START: "$workload
      for file in `ls -1 /home/phiri/Projects/masters/dspace/ingestion/workloads/w$workload/*-1000-*.csv`
         do 
            echo "START: "$file
            #echo /usr/local/workloads/w$workload/bin/dspace metadata-import -f $file -e lphiri@cs.uct.ac.za -s
            sh /usr/local/workloads/w$workload/bin/dspace metadata-import -f $file -e lphiri@cs.uct.ac.za -s
            echo "END: "$file;
         done
      echo "END: "$workload
      # sleep for two minutes before processing next workload
      sleep 60
   done
