%Exercise 2

W =lagweights ( [ 1, 2, 3 ] )' 
S =specialsum ((0:3)',(1.5:0.5:3)', -4:0)

%(d)
x1 = linspace(-1,1, 9); 
lagpolint(x1); % with 9 uniform points

figure
j = 0:1:100;
chebyshev = arrayfun(@(j) -cos((j*pi)/100), j); % a bit suspicious about this line,
                                                % but the polynomial does
                                                % pass through the points
                                                % so I guess mostly it's ok  
lagpolint(chebyshev); % with 101 Chebyshev points


%(a)
function W = lagweights(x_k)
    W = [];
    for i=1:length(x_k)
        val = setdiff(x_k,[x_k(i)]);
        res = arrayfun(@(x) x_k(i)-x, val);
        W(end+1) = 1/prod(res);
    end
end

%(b)
% x and z have size n
% t ,size s, has the values where the interpolation polynomial is evaluated.
function S = specialsum(x, z, t)
    S = [];
    for i=1:length(t)
        sum = 0;
        for j=1:length(x)
            sum = sum + z(j)/(t(i)-x(j));
        end
        S(end+1) = sum;
    end
    S(S == Inf) = NaN; %convert Inf to NaN if that's what we want
end

%(c)
function P = lagpolint(t)
    T=-1:0.00001:1; %added more points so that p(x) connects to all data points
    Y=sqrt(abs(t));
    weights = lagweights(t);
    z = weights.*Y;
    S1 = specialsum(t, z, T); % numerator of the barycentric int. formula
    S2 = specialsum(t, weights,T); % denominator
    P=S1./S2;
    plot(t,Y,'.b',T,P,'r')
end





