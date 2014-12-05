#!/bin/bash 
#$ -cwd
#$ -m be
#$ -l h_rt=160:00:00
#$ -l arch=intel-e5-2650v2
#$ -l gpu=1
#$ -l mem=64G
#$ -l rmem=24G
#$ -P cstest
#$ -M mabbasi1@sheffield.ac.uk

/usr/local/bin/matlab2013a -nojvm -nosplash -nodisplay -r testNestedArrayfun

