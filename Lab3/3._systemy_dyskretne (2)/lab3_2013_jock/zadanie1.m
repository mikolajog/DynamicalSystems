%%%%%%%%%%%%  Zadanie 1  %%%%%%%%%%%%%%%
%       Analiza równania liniowego     %

x0 = .5;
lambdas = [-1.5, -1, -.5, 0, .5, 1, 1.5];

%{ 
% Z u¿yciem simulinka

%open('zadanie1mdl.mdl'); %Ground -> Discrete state space -> to worksape
for l = 1 : length(lambdas);
    figure; %nowy obrazek
    hold on;
    sim('zadanie1mdl.mdl');
    for(i=1:10)
        x = out(i);
        plot(i,x,'p');
        %grid on;
        xlabel('k');
        ylabel('x(k)');
        title(['Uk³ad dyskretny, lambda = ' num2str(lambdas(l))]);
        axis([0 10 -3.5 3.5]); %?? bez moze jest ladniej
    end;
    hold off;
end;
%}

%%{ 
% bez simulinka
for l = 1 : length(lambdas);
    x(1)=x0;
    figure; %nowy obrazek
    
    %System Dyskretny (równanie ró¿nicowe)
    for(i=2:10)
        x(i) = lambdas(l)*x(i-1);
        plot(x,'o');
        grid on;
        xlabel('n');
        ylabel('x(n)');
        title(['Uk³ad dyskretny, lambda = ' num2str(lambdas(l))]);
        axis([0 10 -3.5 3.5]); %?? bez moze jest ladniej
    end;
        
    %System ci¹g³y (równanie ró¿niczkowe)
    %%{
    figure; 
    hold on;
    X=[];
    Y=[];
    j=1;
    for(i=1:.2:10)
        X(j)= i;
        Y(j)= exp(lambdas(l)*i);
        j=j+1;
    end;
    plot(X,Y);
    xlabel('t');
    ylabel('x(t)');
    grid on;
    title(['Uk³ad ci¹g³y, alpha = ' num2str(lambdas(l))]);
    hold off;
    %}
    
end;
%}