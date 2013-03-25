clc
clear

syms x   % x is a symbol, not a number   
f=2*x^2-exp(x);% function to analyze
a=-1;
b=2;
e=0.001;
N=100;
n=10^4;

fmin=subs(f, x, a);
newa=a;
newb=b;
for i=1:n
    h=(b-a)/N;
    for j=0:N
        fj=subs(f, x, a+j*h);
        if (fj<fmin)
            fmin=fj;
            newa=a+h*(j-1);
            newb=a+h*(j+1);
        end
    end    
    a=newa;
    b=newb;
    
    if((b-a)<e)
        break;
    end
end

vpa(fmin,50)