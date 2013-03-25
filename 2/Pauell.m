clc
clear

syms x   % x is a symbol, not a number   
f=2*x^2-exp(x);% function to analyze
h=0.5; %step
e=0.001;
n=10^2;
xmin=0; %start point

for i=1:n
    x1=xmin;
    x2=x1+h;
    f1=subs(f,x,x1);
    f2=subs(f,x,x2);
    if(f1>f2)
        x3=x1+2*h;
    else
        x3=x1-h;
    end
    
    f3=subs(f,x,x3);
    fmin=min(f1,min(f2,f3));
    if(fmin==f1)
        xmin=x1;
    elseif (fmin==f2)
        xmin=x2;
    else
        xmin=x3;
    end
    
    x0=((x2^2-x3^2)*f1+(x3^2-x1^2)*f2+(x1^2-x2^2)*f3)/(2*((x2-x3)*f1+(x3-x1)*f2+(x1-x2)*f3));
    f0=subs(f,x,x0);

    if(abs(xmin-x0)<e)
        break;
    end

end

vpa(f0,50) % function minimum

