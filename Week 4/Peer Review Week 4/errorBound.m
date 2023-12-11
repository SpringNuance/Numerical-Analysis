format long

% Calculating the approximate weights first

alpha1=quadl('l1w' ,0,1)
alpha2=quadl('l2w' ,0,1)

% Calculating the value for the inner product with the normalized version
% of the acquired polynomial p2, where we have:

% p2 = 105*sqrt{2}/16*x^2-45*sqrt{2}/8*x+9*sqrt{2}/16
% p2_normed = 16/(105*sqrt{2})*p2 = x^2-6/7*x+3/35

quadl('pi2w' ,0,1)/24

