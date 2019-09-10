% macierz P, wspólna dla wszystkich systemów dynamicznych
P = [ 1 0;
      0 1 ];

% lista macierzy J dla ka¿dego systemu
% rozk³ad wartoœci w³asnych reprezentowanych w tych macierzach jest opisany
% ni¿ej w zmiennej tytulyLista
Jlista = [
    0 0; %%% 1
    0 0;
    
    0 1; %%% 2
    0 0;
    
    0 0; %%% 3
    0 -1;
    
    -1 0; %%% 4
    0 -2;
    
    -1 0; %%% 5
    0 -1;
    
    -1 1; %%% 6
    0 -1;
    
    -1 0; %%% 7
    0 1;
    
    0 -1; %%% 8
    1 0;
    
    -1 -1; %%% 9
    1 -1;
];

% tytu³y systemów
tytulyLista = {
    'lambda1,2 = 0 -- dzielnik liniowy'
    'lambda1,2 = 0 -- dzielnik nieliniowy'
    'lambda1 = -1, lambda2 = 0'
    'lambda1 = -2, lambda2 = -1'
    'lambda1,2 = -1 -- dzielnik liniowy'
    'lambda1,2 = -1 -- dzielnik nieliniowy'
    'lambda1 = -1, lambda2 = 1'
    'lambda1,2 = 0 +/- 1i'
    'lambda1,2 = -1 +/- 1i'
};

% iloœæ systemów
ileSystemow = 9;

% lista warunków pocz¹tkowych, wspólna dla wszystkich systemów.
% rysowanie portretu fazowego polega na narysowaniu kilku trajektorii
% fazowych, ka¿da z nich ma swój w³asny wektor warunku pocz¹tkowego.
% lista zawiera wszystkie punkty na siatce prostok¹tnej we wspó³rzêdnych od
% -9.5 do 8.5, z krokiem 2.0, zarówno dla x i y.
WPClista = [];
for i = -9.5:2:8.5,
    for j = -9.5:2:8.5,
        WPClista = [ WPClista [ i; j ] ];
    end
end
[rows, cols] = size(WPClista); % ile wektorów WPC wyliczyliœmy?
ileWPC = cols;

% rozpoczynamy symulacjê, otwieramy model
open('Portretyfazowe_model');

% dla ka¿dego systemu
for i = 0:ileSystemow - 1,
    figure(i+1); % otwórz nowy rysunek
    J = [ Jlista(2*i + 1, 1) Jlista(2*i + 1, 2) ; % ustaw macierz J
          Jlista(2*i + 2, 1) Jlista(2*i + 2, 2) ];
    A = P * J * P^-1; % ustaw macierz A
      
    hold on; % bêdziemy rysowaæ po kilka trajektorii na jednym rysunku
    for j = 1:ileWPC,
        WPC = WPClista(:, j); % ustaw wektor warunku pocz¹tkowego
        sim('Portretyfazowe_model'); % uruchom symulacjê
        x1 = x(:, 1); % wybierz x1
        x2 = x(:, 2); % wybierz x2
        plot(x1, x2); % narysuj wykres
    end
    hold off; % koniec rysowania trajektorii
    
    % formatujemy wykres
    tytul = strcat('Portret fazowy systemu dynamicznego: ', tytulyLista(i + 1));
    title(tytul); % tytu³
    xlabel('x1'); % osie: x1 i x2
    ylabel('x2');
    xlim([-10 9]); % zakres: od -10.0 do 9.0
    ylim([-10 9]);
    grid on; % w³¹cz siatkê
end
