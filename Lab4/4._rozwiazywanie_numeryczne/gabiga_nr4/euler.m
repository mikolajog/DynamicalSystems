function [T,X,lw]=euler(fun_han,Tspan,x0,dt)
T=Tspan(1):dt:Tspan(2);
lw = 0;
[m,n] = size(x0);
if ( m ~= 1 && n == 1 )
    x0 = x0';
end

X=zeros(length(T), length(x0));
X(1,:) = x0;
for J=1:length(T)-1,
X(J+1,:)=X(J,:)+dt*feval(fun_han,T(J),X(J,:)')';
lw = lw + 1;
end
T=T';
