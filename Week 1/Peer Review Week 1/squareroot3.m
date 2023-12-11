function e=squareroot3(x0,n)
    x = zeros(n+1, 1);
    e = zeros(n+1,1);
    
    x(1) = x0;
    e(1) = x0-sqrt(3);
    for k = 1:n
       x(k+1) = 0.5*(x(k) + (3 / x(k)));
       e(k+1) = x(k+1) - sqrt(3); 
    end
    % The order of the method is 2
end
