%{
The absolute and relative errors of the four cases. 
This is a useful implementation because both the absolute error and 
the relative error are extremely small (in magnitudes of e-15 to e-14) 

First case: x = 1e-9
arctan(x) = 1e-09
Absolute error: 0
Relative error: 0
 
Second case: x = 2e-5
arctan(x) = 2e-05
Absolute error: 0
Relative error: 0
 
Third case: x = pi/4
arctan(x) = 0.66577
Absolute error: 1.7764e-15
Relative error: 2.6681e-15
 
Fourth case: x = pi
arctan(x) = 1.2626
Absolute error: -1.1102e-14
Relative error: -8.793e-15
%}
function val = arctanappr(x)
    if x >= 0 && x <= 1.7e-9
        val = x;
    elseif x > 1.7e-9 && x <= 2e-2
        val = x - (x^3)/3 + (x^5)/5 - (x^7)/7;
    elseif x >= 0 && x <= 1
        y = x;
        a = 0;
        b = 1;
        if y >= 0 && y <= sqrt(2) - 1
            c = pi/16;
            d = tan(c);
        elseif y > sqrt(2) - 1 && y <= 1
            c = 3*pi/16;
            d = tan(c);
        end
        u = (y - d)/(1 + d * y);
        arctan_u = u * ((135135 + 171962.46*u^2 + 52490.4832*u^4 + 2218.1*u^6)/(135135 + 217007.46*u^2 + 97799.3033*u^4 + 10721.3745*u^6));
        val = a + b*(c + arctan_u);
    elseif x > 1
        y = 1/x;
        a = pi/2;
        b = -1;
        if y >= 0 && y <= sqrt(2) - 1
            c = pi/16;
            d = tan(c);
        elseif y > sqrt(2) - 1 && y <= 1
            c = 3*pi/16;
            d = tan(c);
        end
        u = (y - d)/(1 + d * y);
        arctan_u = u * ((135135 + 171962.46*u^2 + 52490.4832*u^4 + 2218.1*u^6)/(135135 + 217007.46*u^2 + 97799.3033*u^4 + 10721.3745*u^6));
        val = a + b*(c + arctan_u);
    end
end


