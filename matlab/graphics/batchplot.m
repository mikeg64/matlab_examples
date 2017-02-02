% This example demonstrates how to generate graphical output files
% without actually displaying any graphics at all on the screen.
%
% This is particularly useful when you are running MATLAB in batch 
% mode or running MATLAB remotely via a text-only line-mode terminal.  
% In these situations it is not possible to direct output to a graphics 
% screen and so you need to save graphical output into file for viewing 
% them later.
% 

%%  Generate the surface to be plotted 
x=rand(10)*4-2; y=rand(10)*4-2; z=x.*exp( -x.^2-y.^2);
t=-2:0.1:2;
[xx,yy]=meshgrid(t,t);
zz=griddata(x,y,z,xx,yy);

%% Turn Graphics OFF

h1=figure('Visible','off');
% We can manipulate the appearance of the figure via the handle (h1) 
% if we wish to do so. 
% For example to change the background colour:
% set(h1,'Color' , [ 1.0, 1.0, 1.0 ] ;



%% Mesh plot the surface ....
mesh(xx,yy,zz);

% Keep the mesh plot for overlaying subsequent drawing on it.
hold on; 

% and overlay the plot with grid location markers. 
plot3(x,y,z,'o');

% Switch overlaying of graphs off
hold off;

%%  Manipulate axes properties if required.

%If we wish to change axes properties such as axis labels 
% we can get and use the graphics axes handle
%For examle : we need to  to alter the camera position so
ha=gca;
set(ha,'CameraPosition',[-24 -11 5]);
% Or the X axis label
xlabel=text(1.0,1.0 , 'North' ) ;
set( ha,'XLabel', xlabel ) ;

%% Save the figure into a JPEG file

print -djpeg 'test3.jpg'
% and close the figure.
% close all
%% 

%% During a subsequent interactive MATLAB session you can load the 
%  saved image from the file by uncommenting the commands below.
% Read the image.
%    imdata=imread('test.jpg','jpeg');

% Display the imported image
%    h2=figure('Visible','On');
%   image(imdata);