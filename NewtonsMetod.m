clc
clear

% input:
z=1; % start point
E=0.00001; % accuracy
syms x   % x is a symbol, not a number   
f=x^2/2-sin(x);% function to analyze
n=10;% max amount of iterations
m=50;% characters after comma

%Newton algoritm:
df=diff(f);
d2f=diff(f,2);
next=z;
for i=1:n 
    d2f=diff(df);
    prev=next;
    next=prev-subs(df,x,prev)/subs(d2f, x, prev);
    if( abs(next - prev) < E )% accuracy condition
        x0=next;
        break;
    end
end

extremum=vpa(x0, m)% equation solution
% wolfram's value=0.7390851332151606416553120876738734040134
