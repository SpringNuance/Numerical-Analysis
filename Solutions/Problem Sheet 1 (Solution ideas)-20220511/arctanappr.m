function val = arctanappr(x)
%ARCTANAPPR Summary of this function goes here
%   Detailed explanation goes here

lim1 = 1.7 * 10^(-9);
lim2 = 2*10^(-2);

if (0 <= x) && (x <= lim1)
    val = x;
    return;
elseif (lim1 < x) && (x <= lim2)
    poly = [-1/7,0,1/5,0,-1/3,0,1,0];
    val = polyval(poly, x);
    return
else
    if x <= 1
        y = x;
        a = 0;
        b = 1;
    else
        y = 1/x;
        a = pi/2;
        b = -1;
    end
    
    if y <= sqrt(2)-1
        c = pi/16;
        d = tan(c);
    else
        c = 3*pi/16;
        d = tan(c);
    end
    
    u = (y - d) / (1 + d * y);
    polydenom = [10721.3745, 0, 52490.4832, 0, 171962.46, 0, 135135 ];
    polynumer = [2218.1, 0, 97799.3033, 0, 217007.46, 0, 135135 ];
    au = u * polyval(polynumer,u) / polyval(polydenom,u);
    val = a + b * (c + au);
    return
end
end

