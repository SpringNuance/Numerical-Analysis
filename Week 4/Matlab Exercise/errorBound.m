clc;
format long
% The two roots of the polynomial p2
root0 = (15 + 2*sqrt(30))/35;
root1 = (15 - 2*sqrt(30))/35;
l1w = @(x) (1./sqrt(x)).*(x - root0)/(root1 - root0);
% A1 
alpha1=quadl(l1w,0,1);
disp("The weighted term A1 is: " + alpha1);
l2w = @(x) (1./sqrt(x)).*(x - root1)/(root0 - root1);
alpha2=quadl(l2w,0,1);
disp("The weighted term A2 is: " + alpha2);
pi2w = @(x)(1./sqrt(x)).*((x.^2)-(6/7).*x + 3/35).*((x.^2)-(6/7).*x + 3/35);
% Estimate for c2
c2 = quadl(pi2w,0,1)/24;
disp("The estimate for c2 is: " + c2);