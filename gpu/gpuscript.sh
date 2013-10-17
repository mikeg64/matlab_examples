#!/bin/bash 
#$ -cwd
#$ -m be
#$ -l h_rt=160:00:00
#$ -l arch=intel*
#$ -l gpu=1
#$ -l mem=15G
#$ -l rmem=15G
#$ -P cs-test
#$ -M mabbasi1@sheffield.ac.uk

/usr/local/bin/matlab2013a -nojvm -nosplash -nodisplay -r testNestedArrayfun

