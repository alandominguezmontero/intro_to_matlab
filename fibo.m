function s =fibo(n)

s = [1,1];

for i = 3:n
  s = [s,s(i-2)+s(i-1)];
end
