x = 5; % Change this and run the code

if x >= 0 && x <= 1.7*10^(-9)
    arctanx=x;
elseif x > 1.7*10^(-9) && x <= 2*10^(-2)
    arctanx = x - x^3 / 3 + x^5 / 5 - x^7 / 7;
else
    
    if x >= 0 && x <= 1
        y = x;
        a = 0;
        b = 1;
    else
        y = 1/x;
        a = pi / 2;
        b = -1;
    end

if y>=0 && y <= sqrt(2) - 1
    c = pi/16;
    d = tan(c);
else
    c = 3*pi / 16;
    d = tan(c);
end

u = (y-d)/(1+d*y);
arctanu = u*(135135 + 171962.46*u^2 + 52490.4832*u^4 + 2218.1*u^6) / ...
(135135 + 217007.46*u^2 + 97799.3033*u^4 + 10721.3745*u^6);

arctanx = a + b*(c+arctanu);


end

arctanx