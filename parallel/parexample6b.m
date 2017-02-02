% An example script for testing SPMD method of parallel working
% by using distributed arrays.
% This script finds the maximum value of a large set of data.
%  
%% This section is running on the client. I.e. The normal serial way of 
%  working with matlab. 
% generate a large set of data and save it in a vector named ar1 
ar1= rand(1,2000); 
% Next we declare that during spmd the array ar1 will be divided into 
% (number_of_workers ) of sections and distributed (i.e spread ) onto workers
% i.e. each worker will get just one section.
ar1=distributed(ar1) ;

%% ALTERNATIVE 1: easiest way of finding the maximum ( as in parexample5a )
spmd
     
    [ amax, inx] = max(ar1) ; % lmax is the maximum value in the local section
  
end
format long
disp ('Maximum value is ' ) , disp(amax) 
disp ( 'Location of the Maximum is ' ) , disp( inx  ) 
format short


%% ALTERNATIVE 2. By finding the local maximums in each worker first
% We go into spmd parallel mode. Default number of workers are started 
%  Whole of array ar1 is still accessible from each worker as the workers 
% can communicate with each other and gather this array. However this 
% involves communications between workers which may reduce efficiency.
% What we need to do is to access only the bit of the array that is already
% on the worker (i.e. the local part of the array )bu using the  
% getLocalPart() function.
spmd
     
    aa = getLocalPart( ar1 ) ;  % aa is only the local section of ar1 
    lmax = max( aa ) ;  % lmax is the maximum value in the local section
  
end
%% We are now back in serial mode of operating again.
%
%  Try to see what is in ar1 ?
% Now try to see what is in lmax ? 
% Why can not we just simply type lmax to see what it contains ?
% How do we reference the calculated values of lmax?
allmax = cell2mat(lmax(:) ) ;   % transfer from composite array to array.
amax = max(allmax); % finally find the maximum of the maximums.
format long
disp ('Maximum value using the local search method is ' ) , disp(amax) 
format short 
 
