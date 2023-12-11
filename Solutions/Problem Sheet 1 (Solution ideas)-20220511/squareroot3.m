function e = squareroot3(x, n)

s3 = sqrt(3);
e  = zeros(n + 1,1);

e(1) = x - s3;

for k=1:n
    x = (x + 3/x)/2;
    e(k+1) = x - s3;
end

end