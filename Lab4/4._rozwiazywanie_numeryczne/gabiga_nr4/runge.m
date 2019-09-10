function [T,Y,lw]=runge(fhan, Tspan, x0,dt)
T = Tspan(1):dt:Tspan(2);
lw = 0;
[m,n] = size(x0);
if ( m ~= 1 && n == 1 )
    x0 = x0';
end
Y=zeros(length(T), length(x0));
Y(1,:)=x0;

for I=1:length(T)-1,
    k1=feval(fhan, T(I), Y(I,:)');
    k2=feval(fhan, T(I)+(dt/2), Y(I,:)' +(k1*(dt/2)));
    k3=feval(fhan, T(I)+(dt/2), Y(I,:)' +(k2*(dt/2)));
    k4=feval(fhan, T(I)+dt, Y(I,:)' +(k3*dt));
    Y(I+1,:)=Y(I,:) + dt*(1/6)*(k1+2*k2+2*k3+k4)';
    lw = lw + 1;
end
T = T';