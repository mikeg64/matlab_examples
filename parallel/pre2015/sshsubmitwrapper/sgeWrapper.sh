#!/bin/sh
# Ensure that under SGE, we're in /bin/sh too:
#$ -S /bin/sh
#$ -v MDCE_DECODE_FUNCTION,MDCE_STORAGE_LOCATION,MDCE_STORAGE_CONSTRUCTOR,MDCE_JOB_LOCATION,MDCE_TASK_LOCATION,MDCE_MATLAB_EXE,MDCE_MATLAB_ARGS,MDCE_DEBUG

# Copyright 2006 The MathWorks, Inc.
# $Revision: 1.1.6.2 $   $Date: 2006/12/27 20:41:00 $

echo "Executing: ${MDCE_MATLAB_COMMAND}"
exec "${MDCE_MATLAB_EXE}" ${MDCE_MATLAB_ARGS}