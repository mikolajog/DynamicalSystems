%Sprawozdanie Mikolaj Ogarek gr 2b Sroda 13:00
function [result] = funkcja3(t,x,opcje)
    if opcje==1 %normalny wykres
        result = [x(2); -2*x(1)-3*x(1)^2-x(2)];
    elseif opcje==2 %punkt równowagi
        result=[0,1;-2,-1]*x;
    else %punkt równowagi
        result=[0,1;2,-1]*(x-[-2/3;0]);
    end
end