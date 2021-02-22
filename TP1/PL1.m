% Modelo Polinomial

%% Numero de infetados nos dias de pico começando em 4 setembro
clear all
clc
% Dias: 4/9 11/9 18/9 3/10 10/10 16/10 24/10 30/10
A= [1 8 13 28 35 41 49 55];
B= [406 687 780 963 1646 2608 3669 4656];

%% polinomio de grau 1
[p1,s1] = polyfit(A,B,1)  % p1(x)= 73.1411x - 175.9315
SQR1 = s1.normr^2         % SQR1 = 2.4761e+06 // Soma quadrado dos residuos

%% polinomio de grau 2
[p2,s2] = polyfit(A,B,2) % p2(x)= 1.9989x² - 37.6063 + 671.8507
SQR2 = s2.normr^2        % SQR2 = 2.4593e+05

%% polinomio de grau 3
[p3,s3] = polyfit(A,B,3) % p3(x)= 0.0242x³ - 0.0886x² + 9.0903x + 497.0454
SQR3 = s3.normr^2        % SQR3 = 1.7702e+05

%% polinomio de grau 4
[p4,s4] = polyfit(A,B,4) % p4(x)= -0.0025x⁴ + 0.2940x³ - 9.2623x² + 108.6019x + 303.7066
SQR4 = s4.normr^2        % SQR4 = 3.4001e+04

%% polinomio de grau 5
[p5,s5] = polyfit(A,B,5) % p5(x)= 0.000046434x⁵ - 0.0090545x⁴ + 0.62251x³ - 15.94434x² + 155.14150x + 252.67148
SQR5 = s5.normr^2        % SQR5 = 2.8129e+04
vpa(p5)

%% polinomio de grau 6
[p6,s6] = polyfit(A,B,6) % p6(x)= 0.0000071494x⁶ - 0.0011856x⁵ + 0.071544x⁴ - 1.85320x³ + 19.41315x² - 37.12615x + 426.65131
SQR6 = s6.normr^2        % SQR6 = 3.0910e+03
vpa(p6) % aumento da precisão 

%% polinomio de grau 7
[p7,s7] = polyfit(A,B,7) % p7(x)= 0.00000033459x⁷ - 0.000058264x⁶ + 0.0038624x⁵ - 0.12319x⁴ + 2.06061x³ - 19.26915x² + 119.20656x + 304.12137
SQR6 = s7.normr^2        % SQR7 = 2.6147e-19
vpa(p7) % aumento da precisão 


%% Nao polinomial 

[coef,resnorm] = lsqcurvefit(@PL1modelo,[1,1,1,1,1,1,1],A,B) 
PL1modelo(coef,8) %teste

%% Representar graficamente
A_data = 1:0.1:55; % mais pontos intermedios 
p7_data = polyval(p7,A_data);
m_data = PL1modelo(coef,A_data);

% representar pontos a preto, polinomial grau 6 a vermelho e Nao polinomial
% a azul
plot(A,B,'ok',A_data,p7_data,'r',A_data,m_data,'b')
