#! /bin/bash
#------------------------------------------------------------------------------
# preamble
#------------------------------------------------------------------------------
# record the hostname of the node we are running on
hostname > /home/sylvia.biscoveanu/condor/logs/condor_$@.info

# determine if we are running on the head node, and if not, use cit-matlab-init
computer=`hostname`
if [ "$computer" = "ldas-pcdev2" ]
then
  echo "running on the head node"
  init=""
else
  echo "not running on the head node"
  init="/home/ethrane/cit-matlab-init"
fi

# set up environmental variables
source /home/ethrane/condor_setup.sh

# The zeroth job always exits gracefully!
if [ "$@" == 0 ]
  then exit
fi

# limit memory to 4g (low-memory version passes the test on the head node
echo "ulimit -v 4096000"
ulimit -v 4096000

OUTPUTFILE=/home/sylvia.biscoveanu/condor/logs/output.log
echo "Job number $@" >> $OUTPUTFILE
/home/sylvia.biscoveanu/condor/helloWorld.sh $@ >>$OUTPUTFILE
