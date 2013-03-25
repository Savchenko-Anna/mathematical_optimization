clc
clear

syms x   % x is a symbol, not a number   
f=2*x^2-exp(x);% function to analyze
a=-1;
b=2;
e=0.001;
n=10^2;
d=0.001;

fmin=subs(f, x, a);
newa=a;
newb=b;

for i=1:n
    x0=a+(b-a)/2;
    x1=x0-d;
    x2=x0+d;
    f1=subs(f, x, x1);
    f2=subs(f, x, x2);
    
    if(f1<=f2)
        newa=a;
        newb=x2;
        fmin=f1;
    else
        newa=x1;
        newb=b;
        fmin=f2;
    end
    a=newa;
    b=newb;

    if((b-a)<e)
        break;
    end
end

vpa(fmin,50)% function minimum