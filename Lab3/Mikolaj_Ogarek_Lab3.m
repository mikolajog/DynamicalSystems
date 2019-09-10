%Sprawozdanie Mikołaj Ogarek 

%Zadanie 1

%Ustalam warunek początkowy WPC
WPC=1;

%Wartości parametru lambda, po nich iterujemy
lambdas=[-2, -1, -0.3, 0, 0.3, 1, 2];

for lambd=lambdas
    
    figure; 
    hold on;
    
    %Opis wykresu (osie+tytuł)
    title(strcat('Wykres przy lambda = ',num2str(lambd),' WPC = ',num2str(WPC)));
    xlabel('k');
    ylabel('x(k)');
    
    lambd;
    sim('modelMikolajOgarek');
    
    for i=1:13
        plot(i,results(i),'o');
    end
end


%Zadanie 2
t = sym('t');

A=[0,1;-7,-6];
B=[0;1];
C=eye(2);

%Okres
h=0.1;

%Macierze z plusami
Ap = expm(h*A);  
Bp = double(int(expm(t*A)*B,t,0,h));
Cp = C; 

sim('model2MikolajOgarek.slx');
plot(wynik);
title('Wykres układu dyskretno-ciągłego');
xlabel('t');
ylabel('x(t)');

axis([0 1000 -2 2]);
    


%Zadanie 3

%Ustalam warunek początkowy WPC czyli kwotę początkową lokaty
WPC=1000;

%Okresy to okres kapitalizacji odestek
okresy=[1,2,3,4,6,12];
%Ilość to ile razy wykona się kapitalizacja w roku
ilosc=[12,6,4,3,2,1]; 

figure;

for i=1:6
    %Opis wykresu
    title(strcat('Zależność wartości lokaty od częstości kapitalizacji'));
    xlabel('Ilosc miesiecy (co ile kapitalizujemy)');
    ylabel('Wartość lokaty po zakończeniu');
    
    hold on;
    %Wykonanie obliczeń używając modelu z pierwszego zadania
    lambd=(1+((0.05)/ilosc(i)));
    sim('modelMikolajOgarek');
    
    plot(okresy(i),results(ilosc(i)+1),'o');
end


%Zadanie 4 czyli funkcja Newton-Raphson w pliku newtonRaphsonMikolajOgarek.m 
