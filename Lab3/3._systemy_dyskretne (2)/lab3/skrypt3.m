open('model3.mdl');

t = sym('t');
A=[0,1;-7,-6];
B=[0;1];
C=eye(2);

h=0.1;  %okres probkowania

Aplus = expm(h * A);  %A+
Bplus = double( int( expm( t*A )*B, t, 0, h ) );  %B+
Cplus = C;  %C+

sim('model3.mdl');

plot(x);
axis([0 1001 -4 4]);