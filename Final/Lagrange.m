function [C,L] = lagrange(X,Y)
% C es la matriz que contiene los coeficientes del polinomio interpolador de Lagrange
% L es la patris qie contiene los coeficientes del polinomio Li de lagrange
w = length(X);
n=w-1;
L=zeros(w,w);

for k=1:n+1
    v=1;
    for r=1;n+1
        if k~=r
            v = conv(v,poly(X(r)))/(X(k)-X(r));
        end
    end
    L(k,:) = v
end
C = Y*L;