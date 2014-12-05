%qscatter
%partial wave analysis of scattering
%simple demo script for matlab dce
%test by Mike Griffiths 22nd January 2007
%updated by Mitra 5th December 2014 

deltah=0.01;
nsteps=200;
%parconfig='sge';
numprocs=4;


%In old examples function findreasource has been used instead of parcluster
%function.
%resource = findResource('scheduler', 'configuration', parconfig);

%In matlab2013a parcluster is used to create cluster object
%resource = parcluster('scheduler', 'configuration', 'sge');
%set(resource, 'configuration', 'sge');

defaultProfile=parallel.defaultClusterProfile;
resource=parcluster(defaultProfile);

%set(resource, 'SubmitFcn', @sgeSubmitFcn);
%set(resource, 'ParallelSubmitFcn', @sgeParallelSubmitFcn);
%set(resource, 'ClusterMatlabRoot', '/usr/local/packages6/matlab/R2013a');

%In matlab2013a createCommunicatingJob has been replaced with
%createParallelJob.
%parjob=createParallelJob(resource);

parjob=createCommunicatingJob(resource);


% In the new release, use NumWorkersRange instead of NumWorkersRange and MaximumNumberOfWorkers
%set(parjob,'MinimumNumberOfWorkers',numprocs);
%set(parjob,'MaximumNumberOfWorkers',numprocs);

%Set the number of workers required for parallel execution:
parjob.NumWorkersRange = [4 4];



createTask(parjob, 'qscatterpar1', 2, {1});


submit(parjob);
tic

%wait for job to complete before continuing
%new release waitForState changed to wait
%waitForState(job);
wait(parjob);


myruntime=toc;

% In the new release fetchOutputs is replaced with getAllOutputArguments
%parout = getAllOutputArguments(parjob);

parout = parjob.fetchOutputs;


%save('results1.mat', 'parout', '-v6');
sumouter=parout{1,1};

% In new release delete is replaced with destroy
%destroy(parjob);
delete(parjob);
plot(sumouter);


