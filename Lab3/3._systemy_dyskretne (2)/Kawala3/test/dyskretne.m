%Zad. 1
open('dys1'); %Ground -> Discrete state space -> to worksape
WPC=0.2;
l=[-1.5, -1, -.5, 0, .5, 1, 1.5];
for(lambda=l)
    figure; %obrazek
    hold on;
    title(strcat('lambda = ',num2str(lambda),' WPC = ',num2str(WPC)));
    lambda;
    sim('dys1');
    for(i=1:11)
        plot(i,x(i),'*r');
    end;
end;
%wyswietla rozwiazania ukladu dyskretnego dla ro¿nych lambda 
%wykresy dyskretne dla ró¿nych porzypadków lambdy
