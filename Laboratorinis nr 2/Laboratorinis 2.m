clc;
clear all;

% x reiksmes
x = 0.1:1/22:1;

% isejimo reiksmes
d = (1 + 0.6*sin(2*pi*x/0.7) + 0.3*sin(2*pi*x))/2;

%% busiams vaizdas
plot(x,d,'r-*');

%% pirmasis skaiciavimas
% E funkcija

% 1 Random koficientai
    w11=randn(1);
    w12=randn(1);
    w13=randn(1);
    w14=randn(1);
    b11=randn(1);
    b12=randn(1);
    b13=randn(1);
    b14=randn(1);
    
 % 2 Random koficientai
    w21=randn(1);
    w22=randn(1);
    w23=randn(1);
    w24=randn(1);
    b21=randn(1);
    
 % isejimo vektorius  
     y=zeros(1,20);

 % skITC isejimo vektorius
 for i=1:20
 % 1 isejimo skaiciavimas    
 y1=1/(1+exp(-x(i)*w11-b11));
 y2=1/(1+exp(-x(i)*w12-b12));
 y3=1/(1+exp(-x(i)*w13-b13));
 y4=1/(1+exp(-x(i)*w14-b14));
 % Isejimo sumos skaiciavimas
 y(i)=y1*w21+y2*w22+y3*w23+y4*w24+b21;
 % Klaidos skaiciavimas
 e(i)=d(i)-y(i);
 end  
 
% Nustatoma absoliucios klaidos reiksme
eB=0; 
for i=1:20
    eB=eB+abs(e(i)); %Bendra klaida
end
 
%% first try
figure;
plot(x,d,'r-*',x,y,'b-o');

%% mokomas perceptronas
Iter=0;%iteraciju skaicius

while eB ~= 0.001 % apmokomas perceptronas kol kliada nelygi 0.001 arba neatliekama 1000000 iteraciju


n=0.02; % Svorio koficienytas

% Perskaiciuojami 2 isejimo svoriai
for i=1:20
w21=w21+n*e(i)*y1;
w22=w22+n*e(i)*y2;
w23=w23+n*e(i)*y3;
w24=w24+n*e(i)*y4;
b21=b21+n*e(i)*1;
end

% Svoriu keitimas paslepto sluoksnio (1 isejimo)
for i=1:20
delta1=(1/(1+exp(-x(i)*w11-b11)))*(1-1/(1+exp(-x(i)*w11-b11)))*e(i)*w21;
w11=w11+n*delta1*x(i);
delta2=(1/(1+exp(-x(i)*w12-b12)))*(1-1/(1+exp(-x(i)*w12-b12)))*e(i)*w22;
w12=w12+n*delta2*x(i);
delta3=(1/(1+exp(-x(i)*w13-b13)))*(1-1/(1+exp(-x(i)*w13-b13)))*e(i)*w23;
w13=w13+n*delta3*x(i);
delta4=(1/(1+exp(-x(i)*w14-b14)))*(1-1/(1+exp(-x(i)*w14-b14)))*e(i)*w24;
w14=w14+n*delta4*x(i);
b11=b11+n*delta1;
b12=b12+n*delta2;
b13=b13+n*delta3;
b14=b14+n*delta4;
end

% Naujas isejimo skaiciavimas
 for i=1:20
 % 1 isejimo skaiciavimas    
 y1=1/(1+exp(-x(i)*w11-b11));
 y2=1/(1+exp(-x(i)*w12-b12));
 y3=1/(1+exp(-x(i)*w13-b13));
 y4=1/(1+exp(-x(i)*w14-b14));

 y(i)=y1*w21+y2*w22+y3*w23+y4*w24+b21;

 e(i)=d(i)-y(i);
 end
 

eB=0; 
for i=1:20
    eB=eB+abs(e(i)); 
end
Iter=Iter+1; 
eba=eB; 

% Iteracij7 sustabdymas
if Iter==10000000
    eB=0.001; % Proceso sustapdymui isejimo klaida priskiriama norimai gauti
end

% klaios sustabdymas 
if eB<=0.001 % Tikrinamas ar klaida mazesne
    eB=0.001; % Priskiriama norima klaida
end
end
%% Graph prediction-reality
figure;
plot(x,d,'r-*',x,y,'b-o'); % Rezultatu kreive