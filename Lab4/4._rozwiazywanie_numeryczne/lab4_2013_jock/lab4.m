%%%%%%%%%%%%  Zadanie 1  %%%%%%%%%%%%%%%
%{
open('zadanie_1')
sim('zadanie_1');
%}

%%%%%%%%%%%%  Zadanie 2  %%%%%%%%%%%%%%%
%{
% do tf podaje w macierzy wsp�czynniki wielomian�w G(s)
% pierwsza macierz to wsp�czynniki wielomianu w liczniku
% druga macierz to wsp�czynniki wielomianu w mianowniku

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

% G�rnoprzepustowy
GGa = [0.4 0];
GGb = [0.4 1];
GG = tf(GGa, GGb);

% Pasmoprzepustowy
GPa = [1 0];
GPb = [1 2 1];
GP = tf(GPa, GPb);

% Filtr drugiego rz�du
G2a = [1];
G2b = [1 0.1 1];
G2 = tf(G2a, G2b);

% Parametry sygna��w
A_tab = [2 3 1 2 4]; 
w_tab = [0.001 1 30 0.01 5];
fi_tab = [1 5 2 1 0];
a_tab = [GDa GGa GPa G2a];
b_tab = [GDb GGb GPb G2b];

name_tab = ['Filtr Dolnoprzepustowy' 'Filtr G�rnoprzepustowy' 'Filtr Pasmoprzepustowy' 'Filtr drugiego rz�du' '�r�d�o'];

c_tab = ['y' 'm' 'c' 'r' 'g'];

%{
% Charakterystyki Filtr�w

figure;
bode(GD);
title('Filtr Dolnoprzepustowy ');

figure;
bode(GG);
title('Filtr G�rnoprzepustowy');

figure;
bode(GP);
title('Filtr Pasmoprzepustowy');

figure;
bode(G2);
title('Filtr drugiego rz�du'); 

%}


%%{
% Badanie dla parametr�w
for (i = 1:5) % dla wszystkich parametr�w 
    A = A_tab(i);
    w = w_tab(i);
    fi = fi_tab(i);
    
    fig = figure;
    set(fig, 'Position', [0 (i-1)*100 800 200])
    title(strcat('A =  ', num2str(A), ', w =  ', num2str(w), ', fi =  ', num2str(fi)));
    
    hold on;  
    for (j = 1:4) % dla wszystkich filtr�w
        a = a_tab(j);
        b = b_tab(j);
        sim('zadanie_3');
        h(j) = plot(sim_out, c_tab(j));
        
    end;
    
    h(5) = plot(sim_source, c_tab(5));
    legend('Filtr Dolnoprzepustowy', 'Filtr G�rnoprzepustowy', 'Filtr Pasmoprzepustowy', 'Filtr drugiego rz�du', '�r�d�o',4);
    
    hold off;  
    
end;
%}
%}

%%%%%%%%%%%%  Zadanie 4  %%%%%%%%%%%%%%%
%%{
f_gr = 5463; % podana przez prowadzacego cz�stotliwo�� graniczna

f = f_gr/64; % bo obci�cie ma by� -20 dB dla podanej

RC = 1/(2*pi*f);
G = tf([1], [RC, 1]);

figure;
hold on;
bode(G,[f],'o');
bode(G,[f_gr],'*'); % zaznaczenie cz�stotliwo�ci 
bode(G);
hold off;

%}