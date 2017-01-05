% TUTORIAL 5                                 By Deniz Savas, February 2016
%      MANIPUTATING and SAVING PICTURES and PLOTS
% Using the "Figure Editor" we can edit and change most of the graphical
% objects in a picture.

%%   We read in and plot either the trend data  
  Y= load( 'trend.txt' );
  plot (Y) ;

%% TASK 1: Now experiment with using the Edit Plot icon ( arrow )  
% double click one of the plotted curves and observe the resulting
% property-editor subwindow. 
% Try to change the properties of the curve such as line-thickness, colour
% plot type , marker type/colour
% Click on more-properties button and observe all the possible properties. 
% Click on View menu and make other windows visible.  Each of these windows
% will allow you to edit some aspect of your graph.

%% TASK 2: Saving figures into files.
%  Close all the helper windows , leaving just the main Plot Figure .
%  Now Click on FILE > SAVE AS .. on the Figure Window 
% (1) Save the file as a figure file ,
% (2) Save the file as a jpg or bmp file

%% TASK 3: Reading saved figures or graphics data files
%  You can use the OPENFIG command to open a saved (.fig ) figure file. 
% You can also double click a saved .fig file and it will open
% automatically. 
%   Try to open your saved .fig file. 

%% TASK 4:Reading in  saved Graphics Format images
%  You can read image files written in many formats into MATLAB 
%  by using the IMREAD command. 
%  IMREAD will return an image bit-map matrix that can then be visualised
% by using the IMAGE command. 
% Experiment with axis equal and axis normal commands
%