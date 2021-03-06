% An example script for testing SPMD method of parallel working
% This script finds the maximum value of a large set of data as in 
% parexample3b but it also finds the location of this maximum in the data.

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
% This is the same as in parexample5b but we will also find the location of
% the maximum in the original array.
% We go into spmd parallel mode. Default number of workers are started 
%  Whole of array ar1 is still accessible from each worker as the workers 
% can communicate with each other and gather this array. However this 
% involves communications between workers which may reduce efficiency.
% What we need to do is to access only the bit of the array that is already
% on the worker (i.e. the local part of the array )bu using the  
% getLocalPart() function.
 
 
spmd
     
    aa = getLocalPart( ar1 );  % aa is only the local section of ar1 
    
% we now find the mapping of the local part of array ( i.e aa() ) into the 
% global array indices of original array ar1() .     
    [k1 , k2] = globalIndices(ar1,2) ;
    
    lmax = max( aa ) ; % lmax is the maximum value in the local section
% location index of the maximum in the aa array corresponds to location 
% index (imax) in the ar1() array.  
    imax = find( aa == lmax ) + k1 -1 ;
  
end
%% We are now back in serial mode of operating again.
%
%  

allmax = cell2mat(lmax(:) ) ; % gather all local lmax values
iimax = cell2mat( imax(:) ) ;  % gather global index values of maximums
amax = max(allmax) ;         % find maximum of maximums
ifound = find( allmax == amax ); % search for location of maximum
format long
disp ('Maximum value is ' ) , disp(amax) 
disp ( 'Location of the Maximum is ' ) , disp (iimax(ifound)  ) 
 
format short 

