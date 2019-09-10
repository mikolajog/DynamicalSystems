%Sprawozdanie Mikolaj Ogarek gr 2b Sroda 13:00
function [result] = funkcja2(t,x,opcje)
    if opcje == 1  %normalny wykres
        result = [-x(1); -x(2)^2];
    elseif opcje == 2 %punkt równowagi
        result = [-1,0;0,0]*x;
    end
end
