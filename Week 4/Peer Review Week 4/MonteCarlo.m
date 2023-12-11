
a=1;b=2;c=3;

% Creating 100 000 random points in the cube centered at origin with side
% length 2:
N=100000;
x=rand( N , 3 ).*2-1 ;

% Calculating the eucledian distance from the origin and the amount of
% points that fall into the unit ball:
T1=x(:,1).^2+x(:,2).^2+x(:,3).^2;
N_CB=nnz(T1<= 1);

% Approximating the volume as per exercise 2b
disp ( ' Approximation of volume of K: ' )
vol_k = 8*a*b*c*N_CB/N

% Approximating pi knowing vol_k = 4/3*pi*a*b*c
disp ( ' Approximation of pi : ' )
pi_approx=vol_k/(4/3*a*b*c)