clear all;

fun_han = @arenstorf;

x0 = zeros(4,1);
x0(1) = 0.994;
x0(2) = 0;
x0(3) = 0;
x0(4) = -2.00158510637908252240537862224;

dt = 10^-4;
Tspan = 17.0652165601579625588917206249;

[T,Y,lw_eu]=euler(fun_han, [0 Tspan], x0,dt);
[T,Y2,lw_ru]=runge(fun_han, [0 Tspan], x0,dt);


sol=ode45(fun_han, [0 Tspan], x0);
t = 0:dt:Tspan;
x=deval(sol,t);
figure(1);

%lw_eu
%lw_ru = lw_ru*4
%lw_ode45 = length(sol.x)*6

plot(Y(:,1),Y(:,3),'b',Y2(:,1),Y2(:,3),'r',x(1,:),x(3,:),'k');

axis([-1.5 1 -1.5 1.5]);

figure(2)
for i = -6:-2
    
    
    [T,Y,lw_eu]=euler(fun_han, [0 Tspan], x0,dt);
    [T,Y2,lw_ru]=runge(fun_han, [0 Tspan], x0,dt);
    
    op = odeset('RelTol',10^i,'AbsTol',10^i);
    sol=ode45(fun_han, [0 Tspan], x0, op);
    t = 0:dt:Tspan;
    x=deval(sol,t);
    
    
    n_euler = lw_eu
    n_runge = lw_ru*4
    n_ode45 = length(sol.x)*6
    
        
    [me,ne] = size(Y);
    xe0 = Y(1,1);
    xeT = Y(me,1);
    err_E = sqrt((xe0-xeT)'*(xe0-xeT))
    
    [mr,nr] = size(Y2);
    xr0 = Y2(1,1);
    xrT = Y2(mr,1);
    err_R = sqrt((xr0-xrT)'*(xr0-xrT))
    
    [mo,no] = size(x);
    xo0 = x(1,1);
    xoT = x(mo,1);
    err_O = sqrt((xo0-xoT)'*(xo0-xoT))
    
    dt=dt*2;
    
    loglog(n_euler,err_E,'bo',n_runge,err_R,'ro',n_ode45,err_O,'ko');  
    hold on;
    
end

hold off;