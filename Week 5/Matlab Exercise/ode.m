f1 = @(t,y) (-150)*y + 49 - 150*t;

figure(1)
epsilon=0.1;
[t,u] = ode23(f1,[0,1],1/3 + epsilon);
for i=1:length(t)-1
    delta_t(i) = t(i + 1) - t(i);
end
plot(delta_t)
title("epsilon = 0.1")
xlabel("time step")
ylabel("delta t")

figure(2)
epsilon=0.001;
[t,u] = ode23(f1,[0,1],1/3 + epsilon);
for i=1:length(t)-1
    delta_t(i) = t(i + 1) - t(i);
end
plot(delta_t)
plot(delta_t)
title("epsilon = 0.001")
xlabel("time step")
ylabel("delta t")