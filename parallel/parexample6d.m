% An example script for creating a codistibuted array within an SPMD block
% that can help reduce the memory requirements.
% Try to run this, why does it not work ?  
%  Question: Rewrite this script that will create the random array ar2 that
% is stored as a distributed array only. 
%  
%  
%  
spmd
   ar1=rand(1,90000);   % ar1 is a replicated array, i.e. it is stored in its
                        % entirety on each worker, thus taking up memory
   ar2=codistributed(ar1) ; % ar2 is codistributed to workers, i.e. each worker
                            % contain only a portion of the ar1 array.
%   ar2= codistributed( rand(1,90000) );
    clear ar1   % we try to reduce memory requirement on each worker.
  
end
amax= max(ar2) ; % find the maximum value of the codistributed array
     