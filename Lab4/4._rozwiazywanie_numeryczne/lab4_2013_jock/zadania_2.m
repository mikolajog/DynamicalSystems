%%%%%%%%%%%%  Zadanie 2  %%%%%%%%%%%%%%%

% do tf podaje w macierzy wsp�czynniki wielomian�w G(s)
% pierwsza macierz to wsp�czynniki wielomianu w liczniku
% druga macierz to wsp�czynniki wielomianu w mianowniku

hold on;

sys1 = tf([1], [1 1 2]);
nyquist(sys1,'b');

sys2 = tf([1 0], [1 -0.1 1]) ;
nyquist(sys2,'g');

plot(-1, 0, 'or');

hold off;

