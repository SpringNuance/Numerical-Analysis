function R = l2w(x)
x0=(15-2*sqrt(30))/35;
x1=(15+2*sqrt(30))/35;
R = 1./sqrt(x).*(x-x0)./(x1-x0);
end