% lightexample
% Demonstrates animation via changing the position properties of objects 
% as well as the lighting of 3D objects.
%
%
%% Create a sphere that represents a planet as template...
% [ x1 y1 z1 ] is 3 matrices defining the coordinates of the surface.
%
[x1 y1 z1 ]= sphere(48);

%% Generate two new sphere templates for different sizes
% by scaling the original template to 25 percent and 12 percent
% new templates are stored in [x2,y2,z2] and [xx2,yy2,zz2] 
% 
x2=x1*0.25; y2=y1*0.25; z2=z1*0.25;
xx2=x1*0.12; yy2=y1*0.12; zz2=z1*0.12;
% zz3 will be used to help generate more spheres which are shifted
% along the z-direction.
z3=z2+0.9 ; zz3 = zz2 + 0.9  ; 

%% Plot planet1 and define lighting effects on surfaces
% Note : its handle will be s1. 

s1 = surf( x2,y2,z2); 

lighting phong  % better reflections off curved surfaces

% We do not want a clearing of figure window after each draw.
hold on;

%%  Create more spheres  
x3=x2-1.0; xx3 = xx2 - 1.0 ;
%planet 2
s2 = surf( xx3,yy2,zz2);
x4=x2+1.0;
x5 = x2+0.23; xx5 = xx2 + 0.23 ;
%  surf( x4,y2,z2)
y3=y2-1.0; yy3 = yy2 - 1.0 ; 
y4=y2+0.9;
y5 = y2- 0.23;
% three more planets ... 
s3 = surf( xx5,yy3,zz3);
s4 =  surf( x5,y4,-z3);
s5 = surf( x5,y5,z3);
y6 = y2+0.8;
%last one
% % surf( x5,y6,z2)
%% Define axis properties and also create a light source. 
axis equal
shading interp
axis off
% light('Position',[1 0 0],'Style','infinite');
light('Position',[0.5 0 0.9 ],'Style','infinite');
lighting phong 

%%  Give color to each planet. 
set (s1, 'FaceColor' ,  [ 1 0 0 ] ) ;
set (s2, 'FaceColor' ,  [ 0 1 0 ] ) ;
set (s3, 'FaceColor' ,  [ 1 1 0 ] ) ;
set (s4, 'FaceColor' ,  [ 0 0.7 0.7 ] ) 

%% Fix the axis range to drawing area scaling factor .....
ha= gca;
set( ha , 'XLim' , [-3 , 3 ]) ; 
set( ha , 'YLim' , [-3 , 3 ]) ; 
% set( ha , 'Zlim' , [-3 , 3 ] ); 

pause
% set( s2, 'Visible' , 'off' ); This would make a sphere invisible!

%% MAIN ANIMATION LOOP 
% loop around a number of circles ( i.e. 5*(2*pi) ) 
% For each picture we step thro' pi/100 radiant angles.  
%  you can adjust this step-length to see its effects on smoothness 
for a = 1:pi/100:5*pi 
    x = xx3 +1.3*(1.0 - cos(2.5*a) ) ;
    y = yy2 + 1.3*sin(2*a);
    set(s2,'XData' , x );
    set(s2,'YData' , y );
    
    x = x2 -1.4*(1.0 - cos(a) ) ;
    y = y2 -1.4*sin(a);
    set(s1,'XData' , x );
    set(s1,'YData' , y );  
    
    x = xx5 -0.8*(1.0 - cos(3*a) ) ;
    z = zz3 - 0.8*sin(3*a);
    set(s3,'XData' , x );
    set(s3,'ZData' , z );  
      
    x = x5 +1.1*(1.0 - cos(a) ) ;
    y = y5 + 1.1   *sin(a);
    set(s5,'XData' , x );
    set(s5,'YData' , y );
    
    x = x4 -1.1*(1.0 - cos(a) ) ;
    y = y4 + 1.1   *sin(a);
    z = -z3+ 0.4*(1.0-cos(a)) ;
    set(s4,'XData' , x );
    set(s4,'YData' , y );
    set(s4,'ZData' , z ); 
% you can adjust the pause period to improve speed of animation.
    pause(0.10  ) ;    
end
 
    
    
    

