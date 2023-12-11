% Compute the weights of the barycentric formula
function [w] = lagweights(x)
    w = ones([1,length(x)]);
    for k = 1:length(x)
        for j = 1:length(x)
            if k ~= j
                w(k) = w(k) * 1/(x(k) - x(j));
            end 
        end    
    end
end