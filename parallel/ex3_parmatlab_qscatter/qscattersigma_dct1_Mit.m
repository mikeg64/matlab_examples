%qscatter
%partial wave analysis of scattering
%simple demo script for matlab dce
%test by Mike Griffiths 22nd January 2007
%updated by Mitra 10th September 2013 

deltah=0.01;
nsteps=200;
parconfig='sge';
numprocs=4;


%In old examples function findreasource has been used instead of parcluster
%function.
%resource = findResource('scheduler', 'configuration', parconfig);

%In matlab2013a parcluster is used to create cluster object
resource = parcluster('scheduler', 'configuration', parconfig);
set(resource, 'configuration', parconfig);

%set(resource, 'SubmitFcn', @sgeSubmitFcn);
%set(resource, 'ParallelSubmitFcn', @sgeParallelSubmitFcn);
%set(resource, 'ClusterMatlabRoot', '/usr/local/packages6/matlab/R2013a');

%In matlab2013a createCommunicatingJob has been replaced with
%createParallelJob.
%parjob=createParallelJob(resource);
parjob=createCommunicatingJob(resource);

set(parjob,'MinimumNumberOfWorkers',numprocs);
set(parjob,'MaximumNumberOfWorkers',numprocs);
createTask(parjob, 'qscatterpar1', 2, {1});


submit(parjob);
tic
waitForState(parjob);
myruntime=toc
parout = getAllOutputArguments(parjob);

%save('results1.mat', 'parout', '-v6');
sumouter=parout{1,1};
destroy(parjob);
plot(sumouter);

