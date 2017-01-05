% Example to be used for running a MATLAB job in batch mode on iceberg.
% This example finds the minimum of an objective function as defined 
% in file myfunct.m , subject to upper and lower bound constraints.
%  The objective function is defined in file myfunct.m as a function of
% two variables  ( x1 and x2 ) and is of the form:
%
%             x1      2     2 
% i.e it is  e   *( 4x  + 2x  + 4x x   + 2x   + 1  ) + 0.5
%                     1     2     1 2      2
%
%  We are imposing the following constraints to our optimization domain;
%     -10 < X1 < 0.4    ,    -8 < X2 < 0.7    
% We can optimize any function of two variables simply by passing 
% its handle in stead of the handle of myfunct below.
%
x0 = [ -1 , 0.0 ] ;
A = [];
b = [];
Aeq = [];
beq = [];
lb = [-10.0 , -8.0 ];
ub = [0.4 , 0.7];

[x , minvalue ] = fmincon( @myfunct , x0 , A , b , Aeq, beq ,lb,ub ) ;
disp ( ' The minimum value is located at: ' );
disp ( x ) ;
disp ( ' The minimum is: ' );
disp ( minvalue ) ;


