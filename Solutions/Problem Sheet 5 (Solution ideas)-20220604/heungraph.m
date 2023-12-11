n=40
epsilon=0.01;
[t,u]=heun('f1',[0,1],1/3+epsilon,n);
y=epsilon*exp(-150*t)-t+1/3;
plot(t,u,'.--',t,y)
error=norm(u-y,inf)
