%%%%%%%%%%%%  Zadanie 2  %%%%%%%%%%%%%%%
%      Analiza uk³adu dyskretnego      %

%%{
for (h=0.4:.2:1)
    h=h*h;
    
    s = sym('s');

    A=[-5, 1; -1, -5];
    B=[1; 0];
    C=[0, 1];

    Ap = expm(h*A);
    Bp = double( int(expm(s*A)*B,s,0,h));
    Cp = C;

    sim('zadanie2mdl.mdl');

    figure;
    hold on;
    grid on;
    plot(x2,'o');

    title(['Analiza uk³adu dyskretnego, h=' num2str(h)]);
    hold off;
end;
%}

