vars = num2cell([0,2,1,0,16,0,32]);
[a,b,z,y1,y2,s1,s2] =  deal(vars{:});
C = quadhermite(a,b,z,y1,y2,s1,s2);
t = 0:1/n:1;
t2 = 1:1/n:2;
B10 = (1-t).^2;
B11 = 2*t.*(1-t);
B12 = t.^2;
B20 = (1-t).^2;
B21 = t*2.*(1-t);
B22 = t.^2;
x2 = [a:(z-a)/n:z,z:(b-z)/n:b];
g2 = [C(1).*B10 + C(2).*B11 + C(3).*B12, C(3).*B20 + C(4).*B21 + C(5).*B22];

x3 = 2*t;
B30 = (1-t).^3; 
B31 = 3*t.*((1-t).^2);
B32 = 3*(t.^2).*(1-t);
B33 = t.^3;

g3 = [0.*B30 + 0.*B31 - 16/3.*B32 + 16.*B33]; 
f2 = x2.^4;
f3 = x3.^4;
subplot(1,2,1)
plot(x2,g2,x3,g3,'--',x3,f3,'-.')
title('Function and interpolants')
subplot(1,2,2)
plot(x2,g2-f2,x3,g3-f3,'--')
title('Errors')