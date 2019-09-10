%%%%%%%%%%%%  Zadanie 2  %%%%%%%%%%%%%%%

% do tf podaje w macierzy wspó³czynniki wielomianów G(s)
% pierwsza macierz to wspó³czynniki wielomianu w liczniku
% druga macierz to wspó³czynniki wielomianu w mianowniku

hold on;

sys1 = tf([1], [1 1 2]);
nyquist(sys1,'b');

sys2 = tf([1 0], [1 -0.1 1]) ;
nyquist(sys2,'g');

plot(-1, 0, 'or');

hold off;

