clc
clear

%input:
a=0;
b=2;
E=0.0000001;
syms x   % x is a symbol, not a number   
f=-exp(-x)*log(x);% function to analyze
n=100;% max amount of iterations
m=50;% characters after comma

%Golden section search:
phi=(1+sqrt(5))/2;
for i=1:n
    x1 = b - (b-a)/phi;
    x2 = a + (b-a)/phi;
    if( subs(f,x,x1) >= subs(f,x,x2) )
        a = x1;
    else
        b = x2;
    end
    if( abs(b-a) < E )
        Xmin = (a+b)/2;
        break;
    end
end

minimum = vpa(subs(f,x,Xmin), m)
 
 
