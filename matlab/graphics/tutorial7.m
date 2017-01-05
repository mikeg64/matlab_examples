% TUTORIAL 7                                 By Deniz Savas, February 2016
%            3D PLOTTING OF IRREGULAR DATA EXERCISES
%
% Generate some data that can be used to demonstrate 3D graphs
t = 0:0.2:10*pi;
x = sin(t).*exp(-t/30);
y = cos(t).*exp(-t/30);
%%  TASK 1: 2D plotting
% Now plot x versus y

%% TASK 2: Using the t vector as the 3rd dimension now perform a 3D plot.


%% TASK 3: 3D Rotations 
% After plotting the 3D image  click on the Rotate 3D icon and experiment



%% TASK 4: Surface plotting from irregular observation data.
% read in the raw data of random observations taken for the depth of a small river section 
load river.txt
% first  column is the x coordinates of the measurement locations
  x=river(:,1) ;
% second column is the y coordinates of the measurement locations
  y=river(:,2) ;
% third column is the depth measured at the corresponding ( x,y ) coordinates.
   d=river(:,3) ;
% First do a 3D scatter graph to see the raw measurements spacial
% distribution.
scatter3 ( x , y , d ) ; 
%% Define domain limits and number of intervals to use.
% Now we want to define our domain of interest which will lie in a
% rectangular area defined by opposite corners P1=(xmin, ymin) and P2=( xmax,ymax ) 
 xmax=max(x) ; xmin=min(x) ; 
 ymax=max(y) ; ymin=min(y) ;  
% We want to divide this area into 20 by 20 squares  
 intervals=20 ;

% Define the grid-lines along the X direction  
        xi=linspace(xmin,xmax,intervals) ; xi=xi' ;
% Define the grid-lines along the Y direction
        yi=linspace(ymin,ymax,intervals) ; 
        
%%  We now use the GRIDDATA command to generate a di matrix.
% The di matrix contains the values of depth d, interpolated at each grid location
% (i.e. intersection of grid lines) defined by xi and yi vectors. 
%  d is a function of  x and y . I.e.  d = f( x,y )  
% interpolated values di are :  di(i,j) = f( xi(i) , yi(j) )  

         di = griddata ( x , y, d ,xi, yi ) ;  
         
% We may now surface plot f(x,y)
         figure   % start a new figure. 
 % Plot the surface
         surf(di) 
 %% Scaling the plot to realistic aspect ratios.       
 % The x and y coordinated were scaled differently. To get a better
 % visualization we will draw the surface again but using actual (x,y) 
 % coordinate values and make x coordinate limits same length as 
 % y coordinate limits. 
         figure
         surf(xi,yi,di) 
         xlim ( [xmin,xmin+ymax-ymin] ) 
         axis off
%%  Finally publish the work in HTML format.
%%  Use the Publish TAB and click Publish.
