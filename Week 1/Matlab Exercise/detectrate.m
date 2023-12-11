function rate = detectrate(error)
%DETECTRATE Summary of this function goes here
%   Detailed explanation goes here

error = abs(error);
I = find(error);
error = log(error(I));

poly = polyfit(error(1:end-1),error(2:end),1);
rate = poly(1);
end

