

r = 0.15;
k = 50000;
F = @(t,y)(r.*y(1).*(1-(y(1)/k)));
t0 = 0;
reps = 50;
tau=7;
x0 = 5;
tq=[];
xq=[];
mq=[];
h = 0.4;
%0.65 stable

for i = 1:reps
    tspan=[t0 t0+tau];
    [t x] = ode45(F,tspan,x0);
    n = length(x);
    x0=x(n,:);

    x0 = (1-h).*x(n,1);
     tf=t(n);
 tq=[tq;t(1:n)];
 xq=[xq;x((1:n),:)];
 mq=[mq;mean(x)];
 t0=tf;
end

plot(tq,xq(:,1))
ylabel('Rabbits Population')
title('Rabbits population growth at (h = 0.4 )')
grid on 
hold on 
xlabel('Time in days')



