% My initials are N.X.B
% Drawing initial N
x = [1 1.5 2 2.5]; y = [1 3 1 3];
n = length(x);
t = 0:1:n-1;
tt = 0:.1:n-1;
xx = spline(t,x,tt); yy = spline(t,y,tt); hold on
plot(xx,yy','b','LineWidth',2), plot(x,y,'o'), grid on

% Drawing initial X
x = [3 3.5 4 4.5]; y = [1, 1.25, 2.75, 3];
n = length(x);
t = 0:1:n-1;
tt = 0:.1:n-1;
xx = spline(t,x,tt); yy = spline(t,y,tt); hold on
plot(xx,yy','g','LineWidth',2), plot(x,y,'o'), grid on

x = [3 3.5 4 4.5]; y = [3, 2.75, 1.25, 1];
n = length(x);
t = 0:1:n-1;
tt = 0:.1:n-1;
xx = spline(t,x,tt); yy = spline(t,y,tt); hold on
plot(xx,yy','g','LineWidth',2), plot(x,y,'o'), grid on

% Drawing initial B
x = [5 5.5 5]; y = [1, 2, 3];
n = length(x);
t = 0:1:n-1;
tt = 0:.1:n-1;
xx = spline(t,x,tt); yy = spline(t,y,tt); hold on
plot(xx,yy','r','LineWidth',2), plot(x,y,'o'), grid on

x = [5 6 6.5 5.5]; y = [1, 1, 1.5, 2];
n = length(x);
t = 0:1:n-1;
tt = 0:.1:n-1;
xx = spline(t,x,tt); yy = spline(t,y,tt); hold on
plot(xx,yy','r','LineWidth',2), plot(x,y,'o'), grid on

x = [5 6 6.5 5.5]; y = [3, 3, 2.5, 2];
n = length(x);
t = 0:1:n-1;
tt = 0:.1:n-1;
xx = spline(t,x,tt); yy = spline(t,y,tt); hold on
plot(xx,yy','r','LineWidth',2), plot(x,y,'o'), grid on