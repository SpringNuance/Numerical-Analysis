X = pi* ( 0: 1: 100 ) / 100;
X = -cos(X)';
Y = sqrt(abs(X) );
W =lagweights (X);
T= -1:0.002:1;
S1 =specialsum (X,Y .* W,T);
S2 =specialsum (X,W,T);
P = S1./ S2;
plot(X,Y, '--.b',T,P, 'r' )