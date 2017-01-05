% TUTORIAL 3                                 By Deniz Savas, February 2016
% Having read into MATLAB the trend data by running tutorial 1 or 2
% perform the following tasks to plot the data.
% 
% Given that y1 is the first column of data 
%            y2 is the second column of data
%            Y= [y1 , y2 ] 
%%
% TASK 1 : Plotting
% Constract a vector called x  that is the same length and shape as y1 
%  and contains numbers from 1 to 100 ( or scaled by 100 so that it runs
%  from 0.01 to 1.00
% HINT you can either use notation the : notation. I.e start:interval:stop 
%  				or  LINSPACE function .
% 
% Plot y1 against x 
% HINT: type DOC PLOT  to find out about the use of plot command. 

%%
% TASK 2: Plotting multiple curves in one graph. 
% Open another graphics window. HINT: use FIGURE command.
%  Plot y1 against x and y2 against x on the same plot using a single PLOT 
%  command. 

%%
% TASK 3: Overlaying Plots
%  
%  Plot y1 against x and y2 against x on the same plot  
%   but this time use two PLOT commands.
%  HINT: use HOLD command.

%%
% TASK 4 :  Using subplots 
% Split your graphics window into two sections and plot y1 in one section 
% and scattered values of y1 in another section.
% HINT: Use SUBPLOT and SCATTER commands. 
% 

%% 
% TASK 5 : Properties of Graphical objects
%  Draw a scatter plot of y1 
%  Fill the data markers with red colour.
%  HINT: Save the handle of the scatter plot while creating it.
%        [ i.e.   s1= scatter( ....     ]
% and then type  s1 to see its common properties names and values.
%
% Redefine the MarkerFaceCOlor property of the plot to be red ( i.e. 'r' ) 
% HINT : assign a value to  object.PropertyName
%
%%
% TASK 6 : Decorating a graph
% 
% Use the commands  TITLE , XLABEL , YLABEL  to label the graph.
% Use the GTEXT command to add the anotation 'Turning Point' to a suitable
% location on the graph. 

%%
% TASK 7 : Manipulating the axis characteristics 
% Using the XLIM and YLIM commands or the AXIS command adjust the plotting 
% range and observe the graph. 
% You can add grid lines to your graph using the GRID command. 
% Experiment with grid on/off , axis on/off commands.

%%
% TASK 8 : Using the axes handle
% gca returns the handle of the currently used axes.
% Having aquired the handle of the current axes we can interrogate and also
% change its properties via the get and set commands respectively
get(gca ) 
% Use the set command to change the range of the y axis limits by filling
% in the missing two parameters of the following set command;
% set ( gca , '......' , '.......' ) 


