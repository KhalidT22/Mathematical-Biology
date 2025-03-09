close all
clear all
clc
beta=0.4; %0.4
alpha=1/7; % seven day infectious period
N=1000000.0;
pars=[beta,alpha,N];
 x0=[(1-(1e-6)); (1e-6);0];
h = -0.2;
tq=[];
xq=[];
mq=[];
reps = 14;
tau=30;
t0 = 0;
tspan=[t0 t0+tau];


for i=1:reps
    if x0(1)<= 0
       break
    end
    if x0(2) == 0 
        break
    end
     

[t,x]=ode45(@sir,tspan,x0,[],pars);
 n=length(x);
  x0=x(n,:);

 if t0 >= 0  %&& x0(1) >= 0.05*(1+h)
    tau = 7;
      h = h + 0.2;


   x0(1) = x(n,1) - 0.05*(1+h);
   x0(3) = x(n,3) + 0.05*(1+h);
 end
    

 tf=t(n);
 tq=[tq;t(1:n)];
 xq=[xq;x((1:n),:)];
 mq=[mq;mean(x)];
 t0=tf;
 
 tspan=[t0 t0+tau];


end

plot(tq,xq(:,1))
xlabel('Time ')
ylabel('Proportions of S,I and R')
grid on 
hold on 
plot(tq,xq(:,2))
xlabel('Time in days')
hold on 
plot(tq,xq(:,3))
hold on 
[max_y,index] = max(xq(:,2));
max_x = tq(index) ;
plot(max_x,max_y,'*')
hold on
plot(max_x,xq(index,1),"^")
hold on
plot(max_x,xq(index,3))
fprintf('The time at which the infected reaches its max value is %i\n',max_x)
fprintf('The max value of the infected population is  %i\n',max_y)
fprintf('The area under the infected population curve is  %i\n',trapz(tq,xq(:,2)));
fprintf('The area under the recovered population curve is  %i\n',trapz(tq,xq(:,3)));
[tq,xq(:,3)];

legend('Susceptibles','Infected','Recovered')
title('SIR model with increasing % Vaccination')
