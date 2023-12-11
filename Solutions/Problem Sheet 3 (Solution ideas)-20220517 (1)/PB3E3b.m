a=0;b=2;
y1=0;y2=16;s1=0;s2=32;
n=500;
z=1;
C=quadhermite(a,b,z,y1,y2,s1,s2);
t=0:1/n:1;

B20=(1-t).^2;
B21=2*t.*(1-t);
B22=t.^2;

x2=[a:(z-a)/n:z,z:(b-z)/n:b];
g2=[C(1)*B20+C(2)*B21+C(3)*B22,C(3)*B20+C(4)*B21+C(5)*B22];

B30=(1-t).^3;
B31=3*t.*(1-t).^2;
B32=3*t.^2.*(1-t);
B33=t.^3;x3=2*t;
g3=y1*B30+(y1+(b-a)*s1/3)*B31+(y2-(b-a)*s2/3)*B32+y2*B33;

f2=x2.^4;
f3=x3.^4;
subplot(1,2,1)
plot(x2,g2,x3,g3,'--',x3,f3,'-.')
title('Function and interpolants')
subplot(1,2,2)
plot(x2,g2-f2,x3,g3-f3,'--')
title('Errors')