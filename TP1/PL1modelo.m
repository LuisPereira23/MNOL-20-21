function [m] = PL1modelo(c,x) % c: coeficientes do modelo, x: dados

m= c(1) + c(2)./x + c(3)*x.^2 + c(4)*x.^3 + c(5)*(x).^4 + c(6)*x.^5 + c(7).*exp(0.5*x);
%resnorm = 24.6834

end

