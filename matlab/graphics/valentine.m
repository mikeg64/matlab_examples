% MATLAB GRAPHICS PRIMITIVES EXAMPLES      By Deniz Savas, February 2016
% Example MATLAB script using a few plotting primitives.
% Using the graphics primities provided such as line drawing and shape 
% filling primitives you can draw any shape or picture you like. 
% 
close % close any existing figures.

% Define our plotting space to run between -4 and 4 in X and Y directions.
axis([-4  ,4, -4, 4 , -4 , 4]);
axis equal;  % this ensures that the view aspect ration is the same as 
%               physical aspect ratio.

% If we are building up images using graphics primitives, it is essential
% that we use HOLD ON to stop previous objects dissappearing everytime 
% a new drawing takes place.
hold on

%% generate points that will define one semi circle of the heart.
t = 0.0:0.1:pi ;
X1 = cos(t)-1.0; Y1=sin(t) ;
% generate points for the tail end of the hearth.
t = pi:0.1:2*pi ;
X2 =cos(t)-1.0; Y2 =sin(t)+0.9.*(pi-t); 

% tag points along.
X = [X1 X2 ];
Y = [Y1 Y2 ];
% In 3D we will assume drawing to lie in  Z=0 X/Y plane  
Z = zeros( size(X) ) ;

%% 
% HIDDEN command initiates hidden-line and hidden surface removal mechanism.
hidden on;

%% Draw one half of the heart.
fill3( X, Y, Z , 'red', 'LineStyle' , 'none') ;
% mirror image of first half.
fill3(-X ,Y, Z , 'red' ,'LineStyle' , 'none') ;

%%  Drawing the arrows. 
XA = [0.0 -0.1  -0.1 0.0] ; YA = [ -0.4 -0.4 -0.6 -0.6 ] ;
ZA = [ 1.5 0  0  1.5 ] ;
fill3( XA , YA , ZA, 'yellow' );
XA = [-0.1 -0.2  -0.2 -0.1] ; YA = [ -0.4 -0.6 -0.8 -0.6 ] ;
ZA = [ 0 -1.5 -1.5 0 ] ;
fill3( XA , YA , ZA, 'yellow' );
XB= [ 0 0 0 ] ; YB = [ -0.2 -0.4 -0.8 ] ; ZB = [ 1.5 1.9 1.5 ];
fill3( XB , YB , ZB, 'yellow' );

%%  Remove axes from the drawing  and change colour for esthetics. 
axis off
set ( gcf ,'Color', [ 1  1  1 ] ) ;
 