function [W]=lagweights (X)
r = length(X);
M = X * ones (1, r );
B=1./(eye(r)+ M - M' );
W = prod(B, 2 );
end