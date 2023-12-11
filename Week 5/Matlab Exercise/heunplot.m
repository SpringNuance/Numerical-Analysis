n = 40;
epsilon=0.01;
f1 = @(t,y) (-150)*y + 49 - 150*t;

figure(1)
[t,u]=heun(f1, [0, 1], 1/3 + epsilon, n);
y = epsilon * exp(-150.*t) - t + 1/3;
plot(t, y,'r')
hold on
plot(t, u,'b')
legend('Exact values y','Approximated values u')
title("n = 40")
xlabel("time step")
error40 = max(abs(u - y));
disp("Maximum error when n = 40: " + error40)


figure(2)
n = 73;
[t,u]=heun(f1, [0, 1], 1/3 + epsilon, n);
y = epsilon * exp(-150.*t) - t + 1/3;
plot(t, y,'r')
hold on
plot(t, u,'b')
legend('Exact values y','Approximated values u')
title("n = 73")
xlabel("time step")
error73 = max(abs(u - y));
disp("Maximum error when n = 73: " + error73)

figure(3)
n = 75;
[t,u]=heun(f1, [0, 1], 1/3 + epsilon, n);
y = epsilon * exp(-150.*t) - t + 1/3;
plot(t, y,'r')
hold on
plot(t, u,'b')
legend('Exact values y','Approximated values u')
title("n = 75")
xlabel("time step")
error75 = max(abs(u - y));
disp("Maximum error when n = 75: " + error75)