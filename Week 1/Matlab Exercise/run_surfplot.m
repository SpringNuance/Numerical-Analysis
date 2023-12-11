% X specifies the location of the points in x-direction
% Y specifies the location of the points in y-direction
X = linspace(0,pi,30); % 30 equidistant points in [0,pi]
Y = linspace(0,2*pi,57); % 57 equidistant points in [0,2*pi]

% Finding arrays XX and YY s.t. (x_i,y_j) = (XX(i,j),YY(i,j))
% This enables us to use elementwise operations easier
[XX,YY] = meshgrid(X,Y); 

% Given the function f(x,y) = sin(xy), find the array ZZ s.t. 
% f(x_i,y_j) = ZZ(i,j)
ZZ = sin(XX.*YY); 

% 2-D plot, where ZZ(i,j) = f(XX(i,j),YY(i,j))
surf(XX,YY,ZZ)