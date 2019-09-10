
open('dys2'); %Sine wawe -> state space ->to workspace sine wawe(ten sam) -> zoh -> discrete state space
s=sym('dys2');
h=1;
WPC=5;

A=[-1,1;0,-1];
B=[1;0];

C=eye(size(A));
D=zeros(size(B));

Adys = expm(h*A);
Bdys = double( int(expm(s*A)*B,s,0,h));
Cdys = C;

figure;
hold on;
grid on;
plot(continous);
for(i=1:11)
       plot(i-1,discrete(i,1),'*r');
       plot(i-1,discrete(i,2:end),'*c');
end;
title('uk�ad ci�g�y vs dyskretny');
