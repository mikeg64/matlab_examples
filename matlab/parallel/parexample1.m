%  Example tutorials script.
%  This is the first examples of the Parallel MATLAB course.
%  It is divided into sections.  You are advised to run each section in
%  the sequence it is listed and observe what happens

%% SECTION 1:  A simple parfor loop.
%
% This is a for loop that is parallelized by simply replacing for by parfor
% It is safe to turn a for loop into a parfor loop only if any change in the
% order of execution of the loop has no baring on the results.
% A good test for this example is that if the loop - 
%  for i=1:1024   will return the same results as for i=1024:-1:1  then we
%  can safely parallelise it.

   parfor i=1:1024
      A(i) = sin( i*2*pi/1024);
   end

%% SECTION 2 : Find out what pool is currently open
%
%Notice that in order to start running the parfor loop MATLAB automatically 
% starts up a pool of workers. By default a pool named 'local' pool is 
% started up with a number of workers that is the same as the number of
% processors in your computer. This ensures that each worker has the sole 
% use of a single processor. 
% You can find out what type of pool have been opened by clicking on the 
% bottom Left Hand of the MATLAB window and choosing
% parallel preferences.
% The keyword gcp refers to the currently open workers pool.
   gcp 
% gcp on its own gives the properties of the currently open workers pool
%% SECTION 3 : Close the current pool of workers. 
  delete(gcp )
  
%% SECTION 4 : Manually starting a parallel pool
% Having closed the pool of workers, we will open a Local pool of workers
% manually
mypool = parpool(8) 

% Note that we now have the handle of the pool stored in mypool and we can
% now refer to the currently open pool via this handle  

%% SECTION 5: And execute the parfor loop again.
  parfor i=1:2048
      A(i) = sin( i*2*pi/1024);
   end
%% Finally close the pool
  delete(mypool ) ;



