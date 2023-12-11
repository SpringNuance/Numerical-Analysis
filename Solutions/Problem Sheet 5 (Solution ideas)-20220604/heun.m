function[t,u]=heun(namefunc,I,eta,n)
h=(I(2)-I(1))/n;
t=I(1):h:I(2);
u(:,1)=eta;
for i=1:n
x=feval(namefunc,t(i),u(:,i));
u(:,i+1)=u(:,i)+h/2*(x+...
feval(namefunc,t(i)+h,u(:,i)+h*x));
end