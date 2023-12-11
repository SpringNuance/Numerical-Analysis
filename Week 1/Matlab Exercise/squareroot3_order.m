clc;
% I choose n = 5 to obtain a correct rate of convergence
% The rate of converge to sqrt(3) for x = 1 to 5 are 
for x = 1:5
errors = squareroot3(x,5);
disp("The errors for x = " + x)
disp(errors);
disp(" ");
disp("Rate of convergence for " + x + ": " + detectrate(errors));
end

%{
The errors for x = 1
   7.3205e-01   2.6795e-01   1.7949e-02   9.2050e-05   2.4459e-09            0

 
Rate of convergence for 1: 2.0316
The errors for x = 2
   2.6795e-01   1.7949e-02   9.2050e-05   2.4459e-09            0            0

 
Rate of convergence for 2: 1.9842
The errors for x = 3
   1.2679e+00   2.6795e-01   1.7949e-02   9.2050e-05   2.4459e-09            0

 
Rate of convergence for 3: 1.9537
The errors for x = 4
   2.2679e+00   6.4295e-01   8.7028e-02   2.0818e-03   1.2496e-06   4.5075e-13

 
Rate of convergence for 4: 1.9578
The errors for x = 5
   3.2679e+00   1.0679e+00   2.0366e-01   1.0714e-02   3.2934e-05   3.1310e-10

 
Rate of convergence for 5: 1.9279

=> Rate of convergence: 2
%}