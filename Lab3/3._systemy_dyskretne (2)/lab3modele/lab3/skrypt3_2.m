x(1)=1;  % warunki poczatkowe
lambda=input('lambda:');
for i=2:10
  x(i) = lambda*x(i-1);
end
plot(x);
axis([1 10 -2 2]);
for i=2:10
  x(i) = exp(lambda*i);      % alfa=lambda
end
hold on;
plot(x);
hold off;