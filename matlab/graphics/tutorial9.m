% TUTORIAL 9                                 By Deniz Savas ,February 2016
%
%
% Define an interesting function  Z3=f(x,y) over a square X/Y mesh.
 x= -15:1:15   ;  y = -15:1:15 ;
[ X , Y ] = meshgrid(x,y);

Z1 = X.*X - Y.*Y ;
Z2 = Z1 + 30*cos(Z1/20) ; 
Z2(13:17,13:17)=-30;Z2(14:16,14:16)=-60; Z2(15,15)=-100;
% surface plot it .
h2 = surf(Z2 ); 
axis off
shading interp 
%% Example of rotating the image horizantally ( i.e. around the Z axis )
%% Using the camera to view the image from different positions 
% Using the VIEW function obtain the camera position 
[az , e ] = view  ;
% 
v=linspace(0 , 180 , 120 ) ;
for vi = v 
    view( az+vi , e ) 
    pause( 0.2 )
end

%% TASK1 :  
%  Now move the camera in the direction of the Z axis in a smooth manner 
% similar to the above example. I.e. manipulate elevation angle.
% This time start from the top view and move smoothly to bottom view.
view(3)  % This resets the view to normal 3D view. 
pause(0.5)
ee = linspace( -90 , 90 , 120 ) ;
for elev = ee 
  view(az , elev )
  pause (0.2 )
end 

%% TASK2 Changing the colour palette.
% By using the COLORMAP command set the colormap palette to 'jet' 
% 
% Experiment with other color palettes. Type DOC COLORMAP for info. 
%

%% Changing the colour axis limits to see the effects on the graph
% When surfaces are drawn, the surface heights are mapped linearly to the
% colour palette in use so that maximum value of the surface corresponds
% to the highest color and the  minimum value of the surface corresponds
% to the lowest colour in the colour map. 
% We can alter this mapping by redefining the minimum and maximum values 
% that map onto the colour map via the CAXIS command. 

% First we find out what are automatically set limits are;
   view(3)    % reset the view 
  [cmin , cmax] = caxis;
% Next we define an array of 32 values uniformly distributed between
% cmin to cmax values. 
 cc = linspace( cmin , cmax , 32 ) ;
 
 for c = cc 
     caxis([ c , cmax+eps*200 ] ) 
     pause (0.5 ) 
 end
caxis([ cmin , cmax ] ) ; 

%% TASK 3 : Now  modify the upper limit to in a similar manner to display
%           features at the lower value ranges. 

%% TASK 4 : What is a color map ?
mymap = colormap; 
% Inspect elements of mymap array. What do you think it represents ?

%% TASK 5 : Experiment with the COLORMAPEDITOR command

%% TASK 6 :  Cutting a hole in a surface ....
%   Setting some of the surface data to NaN ignores those surfaces during
% drawing which creates holes on the surface. 
Z3= Z2;
Z3(5:10,15:20)=NaN;  set(h2, 'ZData', Z3 ) ;

