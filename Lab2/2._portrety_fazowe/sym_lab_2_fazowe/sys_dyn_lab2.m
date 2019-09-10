% dane bazowe
P = [ 1 0; 0 1]; % domyslna macierz P
J = [ 1 0; 0 1 ]; % domyslna macierz J
%A = P*J*P^-1;   %domyslna macierz stanu
N=10;
Menu=menu('Portrety fazowe system�w liniowych','1.) Zmodyfikuj macierz P lub J','2.)Wykonaj symulacj� z danych','3.) x1=x2=0 oraz liniowy dzielnik','4.) x1=x2=0 i nieliniowy dzielnik','5.) x1=0 x2=-1','6.) x1=-1 x2=-2','7.) x1=x2=-1, liniowy dzielnik','8.) x1=x2=-1, nieliniowy dzielnik','9.) x1=-1 x2=1 ','10.) Para sprz�ona x=0 +/- i','11.) Para sprz�ona x=-1 +/- i','12.) Zako�cz symulacj�');
while (Menu ~= 12)
    fid=fopen('symulacja2.mdl');     % wczytanie modelu symulacji
    if (Menu == 1)% gdy wybierzemy modyfikaj� macierzy P ...
        Menu2=menu('Przegl�daj lub modyfikuj:','1.) Zobacz macierz P','2.) Zobacz macierz J','3.) Modyfikuj macierz P','4.) Modyfikuj macierz J','Powr�t do wcze�niejszego menu');
        while(Menu2 ~= 5)
            %pocz�tek IF'�w
            if (Menu2 == 1)
                 P;
            end
            if (Menu2 == 2)
                 J;    
            end
            if (Menu2 == 3)     %gdy zadeklarowali�my ch�� zmiany macierzy P
                temp=input('Podaj wartosc P(1,1)\n->','s');
                P(1,1)=sscanf(temp,'%d',[1,1]);
                temp=input('Podaj wartosc P(1,2)\n->','s');
                P(1,2)=sscanf(temp,'%d',[1,1]);
                temp=input('Podaj wartosc P(2,1)\n->','s');
                P(2,1)=sscanf(temp,'%d',[1,1]);
                temp=input('Podaj wartosc P(2,2)\n->','s');
                P(2,2)=sscanf(temp,'%d',[1,1]);P;
            end
            if (Menu2 == 4)
                temp=input('Podaj wartosc J(1,1)\n->','s');
                J(1,1)=sscanf(temp,'%d',[1,1]);
                temp=input('Podaj wartosc J(1,2)\n->','s');
                J(1,2)=sscanf(temp,'%d',[1,1]);
                temp=input('Podaj wartosc J(2,1)\n->','s');
                J(2,1)=sscanf(temp,'%d',[1,1]);
                temp=input('Podaj wartosc J(2,2)\n->','s');
                J(2,2)=sscanf(temp,'%d',[1,1]); J;
            end
            Menu2=menu('Przegl�daj lub modyfikuj:','1.) Zobacz macierz P','2.) Zobacz macierz J','3.) Modyfikuj macierz P','4.) Modyfikuj macierz J','Powr�t do wcze�niejszego menu');
        end
    end
    %%  zaleznosc macierzy J od wyboru Menu
    switch Menu
        case 3, J=[0 0;0 0];
        case 4, J=[0 1;0 0];
        case 5, J=[0 0;0 -1];
        case 6, J=[-1 0;0 -2];
        case 7, J=[-1 0;0 -1];
        case 8, J=[-1 1;0 -1];
        case 9, J=[-1 0;0 1];
        case 10, J=[0 -1;1 0];
        case 11, J=[-1 -1;1 -1];
    end
    if (Menu > 1 && Menu < 12)
        A=P*J*P^-1;
        hold on;
        for I=-N:0.5:N,     %iteracja po warunkach poczatkowych
            figure(1); 
            if (Menu==4 || Menu==5 || Menu==10 || Menu==11)
       
                WPC=[I,I];
            else
                WPC=[sin(I) ; cos(I)];      % usawienie warunk�w poczatkowych
            end
            sim('symulacja2.mdl');      %wykonanie zadanej symulacji
            if(Menu==9)                 % przybli�enie przypadku niestabilnego
                axis([-0.1, 0.1 , -400, 400]);
            end
            plot(x(:,1),x(:,2));     % rysowanie wykresu
            %opis wykresu
            title('Wykres zaleznosci x1 x2');           
            xlabel('x1');   % os X
            ylabel('x2');   % os X
        end
        p0 = [0 0];
        p1 = [1 0];
        p2 = [0 1];
        quiver(p0,p1);
        quiver(p0,p2);
        hold off;
    end
Menu=0;
Menu=menu('Portrety fazowe system�w liniowych','1.) Zmodyfikuj macierz P lub J','2.)Wykonaj symulacj� z danych','3.) x1=x2=0 oraz liniowy dzielnik','4.) x1=x2=0 i nieliniowy dzielnik','5.) x1=0 x2=-1','6.) x1=-1 x2=-2','7.) x1=x2=-1, liniowy dzielnik','8.) x1=x2=-1, nieliniowy dzielnik','9.) x1=-1 x2=1 ','10.) Para sprz�ona x=0 +/- i','11.) Para sprz�ona x=-1 +/- i','12.) Zako�cz symulacj�');
close all;
fclose(fid);
end