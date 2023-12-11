m = 3;
n = 7;

X=(0:1/m:1)'* pi;
Y=(0:1/n:1)' * 2 * pi;
[YY,XX]=meshgrid(Y,X);
f = @(s,t) sin(s+t);
ZZ = f(XX,YY);
U= ( 0: 0.02: 1 )' * pi; %uniform partition over [0, pi]
V= ( 0: 0.02: 1 )' * 2 * pi; %uniform partition over [0, 2pi]
W1 = lagweights(X); % weights in the x direction 
W2 = lagweights(Y); % y direction

% numerator of the 2-D barycentric interpolation formula
for p=1:length(X)
    S1(p,:)= specialsum(Y, W2.*ZZ(p,:), V); % inner sum with varying p
end

for j =1:length(V)
    Suv(:,j)=specialsum(X, W1.*S1(:,j), U)'; % outer summation 
end

% denominator
SX =specialsum(X, W1, U);
SY =specialsum (Y, W2, V);
[SSX,SSY]=meshgrid(SX,SY);
Slag= Suv./(SSX .* SSY)'; % our P(s, t), surface lagrange
figure
surf(UU, VV, Slag); %Figure 1, does not look exactly like f(x,y) but something similar
title('P(s,t)')

[VV,UU]=meshgrid(V,U);
Sf=f(UU,VV);
figure
surf(UU,VV,Sf) %Figure 2
title('The function f(s,t)')

figure
surf(UU,VV,Sf-Slag) %Figure 3
title('difference f − P') % error range from -2 to 2

function W = lagweights(x_k)
    W = [];
    for i=1:length(x_k)
        val = setdiff(x_k,[x_k(i)]);
        res = arrayfun(@(x) x_k(i)-x, val);
        W(end+1) = 1/prod(res);
    end
end

function S = specialsum(x, z, t)
    S = [];
    for i=1:length(t)
        sum = 0;
        for j=1:length(x)
            sum = sum + z(j)/(t(i)-x(j));
        end
        S(end+1) = sum;
    end
    S(S == Inf) = NaN; %convert Inf to NaN 
end