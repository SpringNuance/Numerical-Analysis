%{
If x is the exact value, x0 is the approximation value 
=> Absolute error: Abs_e = x - x0 
=> Relative error: Rel_e = Abs_e/x.
%}
clc;
t=linspace(0,2*pi,10000);
rt = atan(t);
for i=1:length(t)
    at(i)=arctanappr(t(i)); 
end
figure(1);
plot(t,rt-at)
title("Absolute error of arctanappr")
figure(2);
plot(t,(rt-at)./rt)
title("Relative error of arctanappr")
