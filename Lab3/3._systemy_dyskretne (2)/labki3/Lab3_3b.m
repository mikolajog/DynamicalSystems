n = 20; % ile wyrazow obliczyc
F = 0; % wyrazy ciagu
T = 0; % czasy obliczania kazdego wyrazu
for i = 1:n
    tic % rozpocznij pomiar czasu
    F(i) = 1/sqrt(5) * (((1 + sqrt(5))/2)^i - ((1 - sqrt(5))/2)^i);
    T(i) = toc; % zapisz czas
end

stem(1:n, T); % narysuj wykres dyskretny, sformatuj
grid on;
title('Czasy obliczen wyrazow ciagu Fibonacciego (ze wzoru jawnego)');
xlabel('Ktory wyraz ciagu');
ylabel('Czas w sekundach');
