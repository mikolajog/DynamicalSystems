WPC = 0;      % warunek początkowy
C = 0.1;      % pojemność [F]
R = 10;       % opór [Ω]
K = 1/(R*C);  % stała w równaniu

open('model1') % otwiera model simulink
sim('model1')  % uruchamia symulację

%tworzymy wykres
plot(tout,x); % x to stan układu
hold on;
plot(ster); % ster to sterowanie
hold off;
legend('Stan','Sterowanie'); %legenda
title('Wykres sterowania i stanu układu') %tytuł wykresu
xlabel('Czas [s]') %opis osi x
ylabel('Napięcie[V]') %opis osi y
grid on; %siatka