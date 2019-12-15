
x = 0.1:1/22:1;
y = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2; 


c1=0.20;
c2=0.88;
r1=0.12;
r2=0.12;
w1 = randn(1); %pirmines reiksmes
w2 = randn(1);
b = randn(1);
n=0.1;
%spindulio funkcijos
for h=1:100000
for i=1:20
F1 = exp(-(x(i)-c1)^2/(2*r2^2));
F2 = exp(-(x(i)-c2)^2/(2*r1^2));
v=F1*w1+F2*w2+b;
e=y(i)-v;
 w1=w1+n*e*F1; %reiksmiu perskaiciavimas
 w2=w2+n*e*F2; 
 b=b+n*e;
end
V=zeros(1,20);
for i=1:20
F1 = exp(-(x(i)-c1)^2/(2*r2^2));
F2 = exp(-(x(i)-c2)^2/(2*r1^2));
v=F1*w1+F2*w2+b;
V(i)=v;
end
end
plot(x,y,'k-',x,V,'g-');

	