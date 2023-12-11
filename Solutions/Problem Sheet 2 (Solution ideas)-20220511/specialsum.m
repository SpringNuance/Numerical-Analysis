function S =specialsum (X,Z,T)
[TT,XX]=meshgrid(T,X);
M = diag(Z) * ( 1 ./ (TT - XX) );
S = sum( M);
end