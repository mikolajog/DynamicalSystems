%%%%%%%%%%%%  Zadanie 3  %%%%%%%%%%%%%%%
%  Analiza uk³adu dyskretno ci¹g³ego   %

%%{
for (h=0.8:.2:1)
    h=h*h;
    
    s = sym('s');

    A=[0, 0; 0, -1];
    B=[1; 1];
    C=[0, 1];

    Ap = expm(h*A);
    Bp = double( int(expm(s*A)*B,s,0,h));
    Cp = C;

    sim('zadanie3mdl.mdl');

    figure;
    hold on;
    grid on;
    div = fix(length(x1)/length(x2))+1;
    for(i=1:length(x1))
        x(i,1)=x2(fix(i/div)+1);
        x(i,2)=x1(i);
    end;
    plot(x);

    title(['Analiza uk³adu dyskretno ci¹g³ego, h=' num2str(h)]);
    hold off;
end;
%}

