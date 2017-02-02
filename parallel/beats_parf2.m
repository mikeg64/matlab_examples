% This is another parallelized version of the beats.m script using parfor.
% This time we are parallelizing the outer loop.
% As it is not allowed to have nested parfor loops.
% Note that not all functions are allowed inside parfor loops
% save() being one of them.
 
dim1=100;
t=1:dim1;
% create four wave patterns each with different phase shifts. 
 tic
parfor k=1:4

    id=num2str( k );   
 
    wave=zeros(20,dim1);
    for shift=1:20
          wave( shift ,:)=beat_wave(t,1,1,0.05,k+(shift/20.0),0);
    end
    
   
% save function is not allowed in a parfor loop ( transparency rules ) 
% Therefore commented out next two lines 
%    outfile= [ 'beat', id , '.mat' ] ;
%    save(outfile, 'wave');
% So, instead we are saving waves to a cell array.  
   waves{k} = wave;
end;
toc
%  Now plot the waves by calling plotbeats script.
% 
    plotbeatsf ;
 
 