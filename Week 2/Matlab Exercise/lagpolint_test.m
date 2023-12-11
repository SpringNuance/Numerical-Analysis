%{
Test lagpolint.m by sampling from the function y = sqrt(|t|) on [−1; 1].
Try first 9 uniform points and then 101 Chebyshev points
xj = − cos(j*pi/n); j = 0; 1;...; 100 := n:
Plot the polynomials.
%}
clc;
fun = @(t)sqrt(abs(t)); % y = sqrt(|t|)
T=-1:0.002:1;
% 9 Chebyshev points
figure(1)
j=0:9;
X = -cos(j.*pi/9);
P = lagpolint(X, T, fun); disp(P)
% 101 Chebyshev points
figure(2)
j=0:100;
X = -cos(j.*pi/100);
P = lagpolint(X, T, fun); disp(P)
