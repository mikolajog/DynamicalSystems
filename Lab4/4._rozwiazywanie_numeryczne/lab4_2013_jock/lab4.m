%%%%%%%%%%%%  Zadanie 1  %%%%%%%%%%%%%%%
%{
open('zadanie_1')
sim('zadanie_1');
%}

%%%%%%%%%%%%  Zadanie 2  %%%%%%%%%%%%%%%
%{
% do tf podaje w macierzy wspó³czynniki wielomianów G(s)
% pierwsza macierz to wspó³czynniki wielomianu w liczniku
% druga macierz to wspó³czynniki wielomianu w mianowniku

hold on;

sys1 = tf([1], [1 1 2]) 
nyquist(sys1,'b')

sys2 = tf([1 0], [1 -0.1 1]) 
nyquist(sys2,'g')

plot(-1, 0, 'or');

hold off;
%}

%%%%%%%%%%%%  Zadanie 3  %%%%%%%%%%%%%%%
%{

% Dolnoprzepustowy 
GDa = [1];
GDb = [4 1];
GD = tf(GDa, GDb);

% Górnoprzepustowy
GGa = [0.4 0];
GGb = [0.4 1];
GG = tf(GGa, GGb);

% Pasmoprzepustowy
GPa = [1 0];
GPb = [1 2 1];
GP = tf(GPa, GPb);

% Filtr drugiego rzêdu
G2a = [1];
G2b = [1 0.1 1];
G2 = tf(G2a, G2b);

% Parametry sygna³ów
A_tab = [2 3 1 2 4]; 
w_tab = [0.001 1 30 0.01 5];
fi_tab = [1 5 2 1 0];
a_tab = [GDa GGa GPa G2a];
b_tab = [GDb GGb GPb G2b];

name_tab = ['Filtr Dolnoprzepustowy' 'Filtr Górnoprzepustowy' 'Filtr Pasmoprzepustowy' 'Filtr drugiego rzêdu' 'Ÿród³o'];

c_tab = ['y' 'm' 'c' 'r' 'g'];

%{
% Charakterystyki Filtrów

figure;
bode(GD);
title('Filtr Dolnoprzepustowy ');

figure;
bode(GG);
title('Filtr Górnoprzepustowy');

figure;
bode(GP);
title('Filtr Pasmoprzepustowy');

figure;
bode(G2);
title('Filtr drugiego rzêdu'); 

%}


%%{
% Badanie dla parametrów
for (i = 1:5) % dla wszystkich parametrów 
    A = A_tab(i);
    w = w_tab(i);
    fi = fi_tab(i);
    
    fig = figure;
    set(fig, 'Position', [0 (i-1)*100 800 200])
    title(strcat('A =  ', num2str(A), ', w =  ', num2str(w), ', fi =  ', num2str(fi)));
    
    hold on;  
    for (j = 1:4) % dla wszystkich filtrów
        a = a_tab(j);
        b = b_tab(j);
        sim('zadanie_3');
        h(j) = plot(sim_out, c_tab(j));
        
    end;
    
    h(5) = plot(sim_source, c_tab(5));
    legend('Filtr Dolnoprzepustowy', 'Filtr Górnoprzepustowy', 'Filtr Pasmoprzepustowy', 'Filtr drugiego rzêdu', 'Ÿród³o',4);
    
    hold off;  
    
end;
%}
%}

%%%%%%%%%%%%  Zadanie 4  %%%%%%%%%%%%%%%
%%{
f_gr = 5463; % podana przez prowadzacego czêstotliwoœæ graniczna

f = f_gr/64; % bo obciêcie ma byæ -20 dB dla podanej

RC = 1/(2*pi*f);
G = tf([1], [RC, 1]);

figure;
hold on;
bode(G,[f],'o');
bode(G,[f_gr],'*'); % zaznaczenie czêstotliwoœci 
bode(G);
hold off;

%}