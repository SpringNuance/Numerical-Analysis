function [t, u] = heun(func, range,initialvalue, partitions)
t = linspace(range(1),range(2),partitions + 1);
h = (range(2) - range(1))/partitions; 
u = zeros([1, partitions + 1]);
u(1) = initialvalue;
for i=2:partitions+1
    temporary = u(i-1) + h*func(t(i-1),u(i-1));
    u(i) = u(i-1) + (h/2)*(func(t(i-1),u(i-1)) + func(t(i),temporary));
end
