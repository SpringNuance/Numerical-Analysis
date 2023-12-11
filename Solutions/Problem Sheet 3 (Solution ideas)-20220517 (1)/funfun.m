x = [.5 -.5 .5 1.25 0.25 -1 .5 0.25 -0.25 0 0 -1];
y = [-0.25 .5 1 0 -1 0.25 4 5 4 2 -2.75 -2.25];
n = length(x);
t = 0:1:n-1;
tt = 0:.1:n-1;
xx = spline(t,x,tt); yy = spline(t,y,tt);
figure(); hold on, axis equal
plot(x,y,'o'), grid on
comet(xx,yy')