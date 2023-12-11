%{
x and z are arrays of size n and t is an array of size s. The
output has to be an array of size s. That is, t has the values where
the interpolation polynomial is evaluated
%}
function [sum] = specialsum(x,z,t)
    sum = zeros([1,length(t)]);
    for i = 1:length(x)
        sum = sum + z(i)./(t - x(i));
    end
end