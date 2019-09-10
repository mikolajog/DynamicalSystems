open('model3.mdl');

s = sym('s');
A=[0,0;0,-1];
B=[1;1];
C=eye(2);

h=0.1;  %okres probkowania

Aplus = expm(h * A);  %A+
Bplus = double( int( expm( s*A )*B, s, 0, h ) );  %B+
Cplus = C;  %C+

sim('model3.mdl');

plot(x);
axis([0 1001 -4 4]);