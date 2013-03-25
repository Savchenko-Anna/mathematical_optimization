clc
clear

syms x   % x is a symbol, not a number   
f=2*x^2-exp(x);% function to analyze
a=-3;
b=3;
e=0.01;
N=1+(b-a)/e;

fmin=subs(f, x, a);

h=e;% step
for i=1:N-1
    f1=subs(f, x, a+h*i);

    if(f1<fmin)
        fmin=f1;
    end
end

vpa(fmin,50)% function minimum