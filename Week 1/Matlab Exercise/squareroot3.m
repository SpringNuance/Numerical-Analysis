%{
This function uses recursion to implemen the iteration method
We need to find the square root of 3. In other words, we should find the
root of the function x^2 = 3. 
We should convert this function to the form: x = f(x) so that
it will become an iteration method
=> x = 1/2 * (x + 3/x)
In the function, the output is a matrix of errors for n = 0,1,2,3,...
%}
function [errors] = squareroot3(x,n)
    format short e
    errors = inner([],x,n);
end

function [errorsLoop] = inner(errorsInput,x,n)
    if n ~= 0
        x_nextiteration = 1/2 * (x + 3/x); 
        error = [errorsInput, abs(x - sqrt(3))];
        errorsLoop = inner(error, x_nextiteration, n - 1); 
    else
        errorsLoop = [errorsInput, abs(x - sqrt(3))];
    end
end

