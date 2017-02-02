% Example uses of the gather function 
%
% (1) Gathering a codistributed array onto one of the workers.
%  (2) Moving a codistributed array from the workers into the client workspace.
% 
%  
clear 
spmd
    ar2= codistributed( rand(1,200) );
    y= ar2*10.0 ;    % Notice that because ar2 is distributed y also becomes distributed
    avar = magic(5) + labindex ;  % whereas avar is simply a local array that 
                                  % reflects to the client as a composite object
    gy1 = gather ( y , 1 ) ;     % We are gathering all 200 elements of y into 
                               % the workspace ofworker 1. 
                                  
 
end
amax= max(ar2) ; % find the maximum value of the codistributed array
z = gather(y) ;  % note the type of array z after this gather onto client.

%%