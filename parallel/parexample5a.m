% Examples of non-distributed and distributed arrays in smpd constructs.
%
%% NON-DISTRIBUTED ARRAYS


%%  REPLICATED ARRAY
% A replicated array resides in the workspaces of all workers, and its size
% and content are identical on all workers. 
spmd 
   A = magic(6); 
end

%%  VARIANT ARRAY
% A variant array also resides in the workspaces of all workers, but its 
% content differs on one or more workers
 spmd
     AV = pascal( labindex+1 ) ;
 end
 
%% PRIVATE ARRAY
% A private array is defined on one or more, but not all workers.
spmd
    if labindex == 1 
        AP = sin(1:0.1:4*pi ); 
    end
end

%% DISTRIBUTED ARRAYS 
t = distributed ( 0:0.001:10 );  % t is declared as a distributed array
%                                we are assuming that the compute pool is
%                                active
spmd
    Y= sin( t ) ;
end
%   Y is now also a distributed array. 
plot(Y) 

%% CO-DISTRIBUTED ARRAY
%  Note that within an SPMD block we use function codistributed and not
%  distributed. 
spmd
    arr1=codistributed( 0:0.001:5 );
    Z = arr1.*exp(-labindex ) ;
end
figure
plot(Z)
    