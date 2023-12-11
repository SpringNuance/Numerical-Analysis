%{
Write a program interpolsurf.m such that given the grid
points as x and y, and the sampled values z = (f(xi; yj)) of R(m+1)×(n+1),
computes the values of the polynomial P(s,t).
Test with f(s,t) = sin(s + t), m = 3, x a uniform partition of [0; π],
and n = 7, y a uniform partition of [0; 2π]. Plot P(s,t), f(s,t), and the
difference f − P
The interpolation grid is given as U x V, where size(U) = 51 is uniform 
partition on [0; π] and size(V) = 101 is uniform partition on [0; 2π]
%}
clc;
f = @(X,Y) sin(X + Y);
m = 3; n = 7;
X = (0:1/m:1) * pi;
Y = (0:1/n:1) * 2 * pi;
[XX,YY] = meshgrid(X,Y);
ZZ = f(XX,YY);
U = (0:0.02:1) * pi;
V = (0:0.01:1) * 2 * pi;

W1 = lagweights(X);
W2 = lagweights(Y);

% numerator
Suv = zeros([length(V) length(U)]);
for i = 1:length(V)
    for j = 1:length(U)
        for q = 1:length(Y)
            for p = 1:length(X)
                Suv(i,j) = Suv(i,j) + (W1(p) * W2(q) * ZZ(q, p))/((U(j) - X(p))*(V(i) - Y(q)));
            end
        end
    end
end

% denominator
SX = specialsum(X, W1, U);
SY = specialsum(Y, W2, V);
[SSX,SSY] = meshgrid(SX,SY);
Pst = Suv./(SSX .* SSY);
[UU,VV] = meshgrid(U,V);
% Plotting f(UU,VV) or f(s,t)
fst = f(UU,VV);
figure(1)
surf(UU,VV,fst)
title("The function f(s,t)")
figure(2)
surf(UU,VV,Pst)
title("The interpolation P(s,t)")
figure(3) 
surf(UU,VV, Sf - Pst)
title("The difference f - P")