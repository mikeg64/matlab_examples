%This script demonstrates saving a MATLAB graphics figure into a file in
%  jpeg format. The saved file can later be read as image into an 
% interactive MATLAB session to be viewed on the screen.
% It is a suitable piece of code for producing graphical output from
% batch jobs.
%

% prepare a sample data for 3D plotting
x=rand(10)*4-2; y=rand(10)*4-2; z=x.*exp( -x.^2-y.^2);
t=-2:0.1:2;
[xx,yy]=meshgrid(t,t);
zz=griddata(x,y,z,xx,yy);


%% do the plotting  
h1=figure; 
hold on ;

%  Need to alter the camera position for a better 3D view.
%  The child property of the figure gives us the axes handle.
%
hax=get(h1,'Children');
% set camera position 
set(hax,'CameraPosition',[-24 -11 5]);
% draw the mesh 
mesh(xx,yy,zz);
% plot each point as 'o' 
plot3(x,y,z,'o');

%%

% save the current figure into a file in jpeg format.
print -djpeg 'test3.jpg'
hold off;

%% The commented out lines of code below can be issued later in an interactive session
%  to load and display the saved image.
%imdata=imread('test3.jpg','jpeg');
%
% 
%image(imdata);
