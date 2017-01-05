%This script demonstrates saving calculated MATLAB variables during 
%  a batch job for plotting later.
% The saved variables can later be plotted during an interactive MATLAB 
% session to be viewed on the screen.
% It is a suitable piece of code for producing graphical output from
% batch jobs.
%

% prepare a sample data for 3D plotting
x=rand(10)*4-2; y=rand(10)*4-2; z=x.*exp( -x.^2-y.^2);
t=-2:0.1:2;
[xx,yy]=meshgrid(t,t);
zz=griddata(x,y,z,xx,yy);

save ( 'myplotvars' , 'x' , 'y' , 'z' , 'xx', 'yy' , 'zz' )

%% The commented out lines of code below can be issued later in an interactive session
clear
load ( 'myplotvars' ) ;
h1=figure;  
hold on ;

%  Need to alter the camera position for a better 3D view.
%  The child property of the figure gives us the axes handle.
%
 hax=get(h1,'Children');

 set(hax,'CameraPosition',[-24 -11 5]);     % set camera position 

 mesh(xx,yy,zz);                             % draw the mesh 
 
plot3(x,y,z,'o');                             % plot each point as 'o'

 
hold off;

 