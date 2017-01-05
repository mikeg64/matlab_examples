% this will purely submit the beats script for batch processing.
%  This implements just one loop of beats.m serial code as a batch task.
% 
% Submit a batch j
     j = batch( 'beats_parf2' , 'Pool' , 4 , 'CaptureDiary' , true   ) 
     wait (j)
     j.State
     load ( j , 'waves' );
     disp(' The listing of the job diary follow: ' )
     diary(j)
%     delete ( j)
     plotbeatsf
     shg
 
 