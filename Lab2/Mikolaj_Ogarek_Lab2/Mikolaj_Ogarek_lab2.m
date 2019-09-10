%Skrypt Mikołaj Ogarek Lab2

%Dane jednostkowe macierze P i J, zakres powtorzen Z
P = [ 1 0;0 1]; 
J = [ 1 0;0 1 ]; 
Z=10; 
Wybor=menu('Menu portretów fazowych systemów liniowych', '1.Zmień macierz P','2.Zmień macierz J','3.Rysuj: x1=0, x2=0, liniowy dzielnik','4.Rysuj: x1=0, x2=0, nieliniowy dzielnik','5.Rysuj: x1=-1, x2=0','6.Rysuj: x1=-1, x2=-2','7.Rysuj: x1=1, x2=-1 liniowy dzielnik','8.Rysuj: x1=-1, x2=-1 nieliniowy dzielnik','9.Rysuj: x1=-1, x2=1','10. Para sprzężona 0 +/- i', '11. Para sprzężona 0 +/- i ', '12. Zakończ.');

while(Wybor ~=12)
    open('simulinkModel.slx')
     
    %W zależności od wyboru ustawiam J
    switch Wybor
        case 3, J=[0 0;0 0];
        case 4, J=[0 1;0 0];
        case 5, J=[-1 0;0 0];
        case 6, J=[-2 0;0 -1];
        case 7, J=[-1 0;0 -1];
        case 8, J=[-1 1;0 -1];
        case 9, J=[-1 0;0 1];
        case 10, J=[0 -1;1 0];
        case 11, J=[-1 -1;1 -1];
    end
    
    if(Wybor==1) %Zmiana macierzy P, wczytuje nowe wartosci od uzytkownika
        P(1,1)=input('Nowa wartość dla P(1,1):\n');
        P(1,2)=input('Nowa wartość dla P(1,2):\n');
        P(2,1)=input('Nowa wartość dla P(2,1):\n');
        P(2,2)=input('Nowa wartość dla P(2,2):\n');
    end
    if(Wybor==2) %Zmiana macierzy J, wczytuje nowe wartosci od uzytkownika
        J(1,1)=input('Nowa wartość dla J(1,1):\n');
        J(1,2)=input('Nowa wartość dla J(1,2):\n');
        J(2,1)=input('Nowa wartość dla J(2,1):\n');
        J(2,2)=input('Nowa wartość dla J(2,2):\n');
    end
    
    if (Wybor<12 && Wybor > 1)
        
        A=P*J*P^-1; %Macierz A
        
        hold on;
        
        %Iteracja po warunkach poczatkowych
        for Iterator= -Z:0.5:Z
            figure(1); 
            
            %Ustawienie warunku początkowego
            if (Wybor==4 || Wybor==5 || Wybor==10 || Wybor==11)
                WPC=[Iterator ; Iterator];  
            else
               WPC=[sin(Iterator) ; cos(Iterator)];      
            end
            
            %Wykonanie wymulacji
            sim('simulinkModel.slx');      
            
            %Przybliżam osie, dla tego przypadku:
            if(Wybor==9)            
                axis([-0.05, 0.05 , -400, 400]);
            end
            
            %Rysuję wykres
            plot(x(:,1),x(:,2));
           
            %Dodaję opis wykresu
            title('Wykres zaleznosci x2 od x1');           
            xlabel('x1');   % os X
            ylabel('x2');   % os X
        end
        
        %Rysuję wektory własne
        p0 = [0 0];
        p1 = [P(1,1) P(1,2)];
        p2 = [P(2,1) P(2,2)];
        quiver(p0,p0,p1,p2)
        hold off;
    end
    Wybor=menu('Menu portretów fazowych systemów liniowych', '1.Zmień macierz P','2.Zmień macierz J','3.Rysuj: x1=0, x2=0, liniowy dzielnik','4.Rysuj: x1=0, x2=0, nieliniowy dzielnik','5.Rysuj: x1=-1, x2=0','6.Rysuj: x1=-1, x2=-2','7.Rysuj: x1=1, x2=-1 liniowy dzielnik','8.Rysuj: x1=-1, x2=-1 nieliniowy dzielnik','9.Rysuj: x1=-1, x2=1','10. Para sprzężona 0 +/- i', '11. Para sprzężona 0 +/- i ', '12. Zakończ.');

    close all;
end
