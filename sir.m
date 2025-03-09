function yp = sir(t,x,pars)

yp = zeros(3,1);
yp(1) = -(pars(1)*x(1)*x(2));%/pars(3);
yp(2) = (pars(1)*x(1)*x(2))- pars(2)*x(2);
yp(3) =  pars(2)*x(2);

%DE = @(t,x) [-beta.*x(1).*x(2);beta.*x(1).*x(2) - gamma.*x(2);gamma.*x(2)];

%[~,x] = rkm(DE,0,tf,1,ICs);
%S = x(1,:);
%I = x(2,:);
%R = x(3,:);
%pars=[beta,gamma,N]

end