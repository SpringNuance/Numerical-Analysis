function R = l1w(x)
x0=(15-2*sqrt(30))/35;
x1=(15+2*sqrt(30))/35;
R = 1./sqrt(x).*(x-x1)./(x0-x1);
end