arrn = 5000:10:5100;
epsilon=0.01;
f1 = @(t,y) (-150)*y + 49 - 150*t;
for i=1:length(arrn)
n=arrn(i);
[t,u]=heun(f1, [0,1], 1/3 + epsilon, n);
y = epsilon * exp(-150.*t) - t + 1/3;
arrerror(i)=norm(u-y,inf);
end
plot(log(arrn),log(arrerror),'.--')
a=polyfit (log(arrn), log(arrerror) ,1);
title (['Slope of the regression line : ', num2str(a(1))])
xlabel('log(n)')
ylabel('log(error)')