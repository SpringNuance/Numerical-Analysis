% computes the barycentric form of p at points t
function [P] = lagpolint(X, T, fun)
    Y=fun(X);
    W=lagweights(X);
    S1=specialsum(X, W.*Y, T);
    S2=specialsum(X, W, T);
    P=S1./S2;
    plot(X,Y,'.b',T,P,'r')
end