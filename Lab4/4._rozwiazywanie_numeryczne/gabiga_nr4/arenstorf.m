function yp = arenstorf ( t, y )
mu=0.012277471;
% przydzielenie pamieci
yp = zeros ( size(y) );
% przypisanie wartosci zmiennych
y1 = y(1);
y1p = y(2);
y2 = y(3);
y2p = y(4);
% obliczanie prawej strony
d1 = ((y1+mu)^2+y2^2)^1.5;
d2 = ((y1-(1-mu))^2+y2^2)^1.5;
yp(1) = y1p;
yp(2) = y1 + 2*y2p - (1-mu)*(y1+mu)/d1 - mu*(y1-(1-mu))/d2;
yp(3) = y2p;
yp(4) = y2 - 2*y1p - (1-mu)*y2/d1 - mu*y2/d2;