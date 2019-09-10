n = 10; % ile krokow dla rownania roznicowego
krok = 0.02; % krok dla rownania rozniczkowego
lambda = -1; % roznicowe
alfa = -0.2; % rozniczkowe
hold on; % rysuj po 2 linie na wykresie

% równanie ró¿nicowe (dyskretne)
T = transpose(0:n);
X = [1];
for k = 1:n
    X = [ X ; X(1)*lambda^k ];
end
stem(T, X);

% równanie ró¿niczkowe
T = transpose(0:krok:n);
X = [1];
for t = (0+krok):krok:n
    X = [ X ; exp(alfa*t) ];
end
plot(T, X);

grid on; % ustaw parametry wykresow
title('System dyskretny i system ciagly');
xlabel('k, t');
ylabel('x(k), x(t)');
hold off;