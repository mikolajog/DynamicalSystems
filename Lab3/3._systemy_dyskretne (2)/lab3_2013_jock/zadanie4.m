%%%%%%%%%%%%  Zadanie 4  %%%%%%%%%%%%%%%
% Obliczanie wspó³czynników c_1 i c_2  %

syms R_1 R_2 c_2 u
c_2 = solve(-c_2*(1+R_1/(2*R_2)+sqrt(R_1/(2*R_2)*(1+R_1/(4*R_2))))+c_2*(1+R_1/(2*R_2)-sqrt(R_1/(2*R_2)*(1+R_1/(4*R_2))))-u,c_2);
c_1 = -c_2;

