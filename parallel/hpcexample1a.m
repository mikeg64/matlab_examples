% Example script to be used for running a MATLAB job in batch mode on iceberg.
% 
% This example finds the minimum of an objective function as defined 
% in file myfunct.m without any constraints . 
%  The objective function is defined in file myfunct.m as a function of
% two variables  ( x1 and x2 ) and is of the form:
%
%             x1      2     2 
% i.e it is  e   *( 4x  + 2x  + 4x x   + 2x   + 1  ) + 0.5
%                     1     2     1 2      2
%
% We can optimize any function of two variables simply by passing 
% its handle in stead of the handle of myfunct below.
%
x= [ -1 0 ] ;
[xnew , minvalue ] = fminsearch( @myfunct , x ) ;
disp ( ' The minimum value is located at: ' );
disp ( xnew ) ;
disp ( ' The minimum is: ' );
disp ( minvalue ) ;


