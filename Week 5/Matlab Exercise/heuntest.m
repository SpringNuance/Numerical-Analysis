clc;
f1 = @(t,y) (-150)*y + 49 - 150*t;
[t,u] = heun(f1, [0,1], 1/3, 4);
disp("t is ")
disp(t)
disp("u is" )
disp(u)