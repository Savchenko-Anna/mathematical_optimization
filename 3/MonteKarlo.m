clc
clear

syms x   % x is a symbol, not a number   
f=2*x^2-exp(x);% function to analyze
a=-3;
b=2;
e=0.01;
N=(b-a)/e -1;

xmin = a + (b-a)*rand(1);
fmin=subs(f, x, xmin);

h=e;% step
for i=1:N-1
    x1=a + (b-a)*rand(1);
    f1=subs(f, x, x1);

    if(f1<fmin)
        fmin=f1;
    end
end

vpa(fmin,50)% function minimum