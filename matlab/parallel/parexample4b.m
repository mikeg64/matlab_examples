% PMODE example  
%Example script for reading 4 series of data that are stored in 4 different
% MATLAB data files. 
% The files are named series1.mat , series2.mat , series3.mat and series4.mat
% They were originally saved by a matlab command of the form ;
%   save ( 'series_number'  , y ) 
% 
%%  
% We will have issued the command  pmode('start' , 'local' , 4 ) from the
% initial MATLAB window to startup the pmode command. 
% 
%% We can now read each series into a different worker. 
cindex=num2str( labindex ) ;
filename = [ 'series' , cindex ] ;
load (filename ) 

%% Having read the data and assuming processed it, we can send it to 
% the client for plotting it.
cname=[ 'y' ,cindex ];
command = [ 'pmode lab2client y  ' , cindex , ' ' , cname] ; 
eval ( command ) 
