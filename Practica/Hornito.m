hold off

clear all

close all

NumDatos=1000;

c1 = -1.7135;

c2 = 7.1861*(10^-01);

c3 = 1.8204*(10^-03);

c4 = 1.8320*(10^-02);

Temp = input("Temp: ");
for i=1:NumDatos;
  x(i) = Temp;
endfor
Origin = x;
y(1)=0;

y(2)=c4;

y(3)=-c1*c4+c3 + c4;


for i = 3:NumDatos

    y(i) = -c1*y(i-1) - c2*y(i-2) + c3*y(i-1) + c4*x(i-2); %%Poner mucho cuidado para no modificar esta línea de código
    if(y(i)<= Temp)
      x= Origin;
    elseif(y(i)> Temp)
      x=zeros(NumDatos);
    endif
end

plot (y)

xlabel("Tiempo")

ylabel("Comportamientode la temperatura en el horno")

grid on
