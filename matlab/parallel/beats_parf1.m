% This is the parallelized version of the beats.m script using parfor.
%beats script parallelized using a parfor loop.
% We are parallelizing the inner loop only as it is not allowed 
% to have nested parfor loops.

%id=getenv('SGE_TASK_ID');  %id is a string variable
%id='4';
dim1=100;
t=1:dim1;
% create four wave patterns each with different phase shifts. 
 tic
for k=1:4

    id=num2str( k );   
 
    wave=zeros(20,dim1);
    parfor shift=1:20
          wave( shift ,:)=beat_wave(t,1,1,0.05,k+(shift/20.0),0);
    end
    outfile= [ 'beat', id , '.mat' ] ;
    save(outfile, 'wave');

end;
toc
%  Now plot the waves by calling plotbeats script.
% 
%   plotbeats ;
 
 