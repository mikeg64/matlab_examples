% An example script for testing SPMD method of parallel working
%  
%% This section is running on the client. I.e. The normal serial way of 
%  working with matlab. 

factor= 0.1 ; 
k = 3;
%% Now we go into spmd parallel mode. Default number of workers are started 
%  On each worker p , k and t are calculated.
spmd
    p= pascal( labindex+1);
    k = labindex*factor ;
    t=p.*k ;
end
%% We are now back in serial mode of operating again.
% Try to see what is in factor ?
% Try to see what is in k ( which was set to 3 before the SPMD block ) ?
% Discuss the reason for the change in k.
% Now try to see what is in t ? 
% Why can not we just simply type t to see what it contains ?
% How do we reference the calculated values of t?