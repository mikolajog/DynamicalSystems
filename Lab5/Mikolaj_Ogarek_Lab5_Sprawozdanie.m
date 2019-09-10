%Sprawozdanie Mikolaj Ogarek gr 2b Sroda 13:00

%Zamknij poprzednie okna
close all;

%%%%%%%%%%%%%%%%%%%%%%%Przykład1%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Zakres = 1.79;
t = 0:0.1:Zakres;
epsilon = 0.2;

%Rysujemy oryginalny wykres - niebieski
figure;
title('Przykład 1: x=0');
hold on;
r1 = @(t,x) funkcja1(t,x,epsilon,1);
for WPC = 0:1:6
    fun1 = ode45(r1, [0,Zakres], WPC);
    wartosci = deval(fun1, t);
    plot(t,wartosci,'b');
end

%Rysujemy linearyzacje w x=0 - zielony
r1 = @(t,x) funkcja1(t,x,epsilon,2);
for WPC = 0:1:6
    fun1 = ode45(r1, [0,Zakres], WPC);
    wartosci = deval(fun1, t);
    plot(t,wartosci,'g');
end

%Rysujemy oryginalny wykres - niebieski
figure;
title('Przykład 1: x=1/epsilon');
hold on;
r1 = @(t,x) funkcja1(t,x,epsilon,1);
for WPC = 0:1:6
    fun1 = ode45(r1, [0,Zakres], WPC);
    wartosci = deval(fun1, t);
    plot(t,wartosci,'b');
end

%Rysujemy linearyzacje w x=1/epsilon - czerwony
r1 = @(t,x) funkcja1(t,x,epsilon,3);
for WPC = 0:1:6
    fun1 = ode45(r1, [0,Zakres], WPC);
    wartosci = deval(fun1, t);
    plot(t,wartosci,'r');
end

hold off;

%%%%%%%%%%%%%%%%%%%%%%%Przykład2%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on;
title('Przykład 2: jedyny punkt równowagi');

Zakres = 8;
t = 0:0.1:Zakres;

%Rysujemy oryginalny wykres - niebieski
hold on;
r2 = @(t,x) funkcja2(t,x,1);
for g = -3:3
        for d =-0.1:0.01:0.1
            WPC = [g d];
            fun2 = ode45(r2, [0,Zakres], WPC);
            wartosci = deval(fun2, t);
            plot(wartosci(2,:),wartosci(1,:),'b');
        end
end

%Rysujemy linearyzacje - czerwony
r2 = @(t,x) funkcja2(t,x,2);
for g = -3:3
        for d =-0.1:0.01:0.1
            WPC = [g d];
            fun2 = ode45(r2, [0,Zakres], WPC);
            wartosci = deval(fun2, t);
            plot(wartosci(2,:),wartosci(1,:),'g');
        end
end

hold off; 

%%%%%%%%%%%%%%%%%%%%%%%Przykład3%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on;
title('Przykład 3: x=0');

Zakres = 0.5;
t = 0:0.1:Zakres;

%Rysujemy oryginalny wykres - niebieski
hold on;
r3 = @(t,x) funkcja3(t,x,1);
for g =-1:0.1:0.5
        for d =-1:0.1:0.5
            WPC = [g d];
            fun3 = ode45(r3, [0,Zakres], WPC);
            plot(fun3.y(1,:),fun3.y(2,:),'b');
        end
end

%Rysujemy linearyzacje w x=0 - zielony
r3 = @(t,x) funkcja3(t,x,2);
for g =-1:0.1:0.5
        for d =-1:0.1:0.5
            WPC = [g d];
            fun3 = ode45(r3, [0,Zakres], WPC);
            plot(fun3.y(1,:),fun3.y(2,:),'g');
        end
end

hold off;

figure;

%Rysujemy oryginalny wykres - niebieski
hold on;
r3 = @(t,x) funkcja3(t,x,1);
for g =-1:0.1:0.5
        for d =-1:0.1:0.5
            WPC = [g d];
            fun3 = ode45(r3, [0,Zakres], WPC);
            plot(fun3.y(1,:),fun3.y(2,:),'b');
        end
end

%Rysujemy linearyzacje w x=[-2/3 0]T - zielony
r3 = @(t,x) funkcja3(t,x,3);
for g =-1:0.1:0.5
        for d =-1:0.1:0.5
            WPC = [g d];
            fun3 = ode45(r3, [0,Zakres], WPC);
            plot(fun3.y(1,:),fun3.y(2,:),'r');
        end
end

hold off;
