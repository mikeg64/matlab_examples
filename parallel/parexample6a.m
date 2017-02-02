% An example script for testing SPMD method of parallel working
% by using distributed arrays.
% This script finds the maximum value of a large set of data and its
% location in the array.
%  
%% This section is running on the client. I.e. The normal serial way of 
%  working with matlab. 

% generate a large set of data and save it in a vector named ar1 
ar1= rand(1,2000); 
% Next we declare that during spmd the array ar1 will be divided into 
% (number_of_workers ) of sections and distributed (i.e spread ) onto workers
% i.e. each worker will get just one section.
ar1=distributed(ar1) ;
 
%% Now we go into spmd parallel mode. Default number of workers are started 
%  Whole of array ar1 is still accessible from each worker as the workers 
% can communicate with each other and gather this array. However this 
% involves communications between workers which reduce efficiency.
% What we need to do is to access only the bit of the array that is already
% on the worker. 
% getLocalPart() function does this.
 
spmd
     
    [ amax, inx] = max(ar1) ; % lmax is the maximum value in the local section
  
end
format long
disp ('Maximum value is ' ) , disp(amax) 
disp ( 'Location of the Maximum is ' ) , disp( inx  ) 
format short
 
 
