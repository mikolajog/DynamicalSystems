%Sprawozdanie Mikolaj Ogarek gr 2b Sroda 13:00
function [result] = funkcja1(t,x,eps,opcje)
if opcje==1 %normalny wykres
    result = -x + eps*x^2;
elseif opcje == 2 %punkt równowagi
    result = - x;
else  %punkt równowagi
    result= x - 1/eps;
end  
end