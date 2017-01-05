%% TUTORIAL 8                              By Deniz Savas, February 2016
%   Experimenting with contour plotting.
%
% Define an generate a mesh in X/Y plane. 
x= -15:1:15   ;  y = -15:1:15 ;
[ X , Y ] = meshgrid(x,y);

%% Define an interesting function of Z1=f(x,y) 
Z1 = X.*X - Y.*Y ;
%%  You can also experiment with surface plotting Z2 if you wish to do so
Z2 = Z1+ 300*cos( (X+Y)/5 ) ;

%% Define another function of Z3=f(x,y) 
Z3 = Z1 + 30*cos(Z1/20) ; 
Z3(13:17,13:17)=-30;Z3(14:16,14:16)=-60; Z3(15,15)=-100;

%% TASK 1: Experiment with contour plotting Z1  Z2 or Z3 surfaces by using
%  the CONTOUR command.
%

%% TASK 2 : Contour Labels
% Having drawn the contours you can now add labels to the contours by using 
% the CLABEL command.
% HINT: To be able to label the contours using CLABEL you will first have 
% to return the contour level vectors and handles by using the contour
% command as  [ C, h ] = contour ( .......     ) 

%% Try to label contours manually that will allow you to select the 
% position of the contour labels via the mouse. 

%% TASK 3 : Filled Contours and also selecting no. of contours to plot
% Try plotting filled contours by using the CONTOURF command and 
% also select the number of contour lines you wish to plot.

%% TASK 4 : 3D Contour Plotting
%%  Using the CONTOUR3 command plot one of the surfaces. 

%% TASK 4:  Surface Plotting 
%  Now to refresh your knowledge, surface plot these Z1,Z2 or Z3 surfaces
%   using the SURF command. Experiment with SHADING and AXIS commands. 
 
