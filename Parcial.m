% enfermos 1 Rojo
% sanos 2 Verde
% inmunes 3 Azul
% muertos 0 Negro
clear;
#Entradas
population = round(sqrt(input("Ingrese el tamaño de la poblacion: ")));
infected = input("Ingrese la cantidad de infectados: ");
cicle = input("Ingrese el numero de generaciones: ");

#Calculos de variables:
matrixOne=ones(population,population);
matrixColors = zeros(population,population,3);
sick = infected;
healthy = population^2 - infected;
immune = 0;
dead =0;



for i = 1:population
  for j = 1:population
      matrixOne(i,j)= 2;
      matrixColors(i,j,1) = 0;
      matrixColors(i,j,2) = 255;
      matrixColors(i,j,3) = 0;
  endfor;
endfor;




while(infected != 0)
  col = randi(population);
  fil = randi(population);
  if(matrixOne(fil,col)== 2)
    matrixOne(fil,col)=1;
    matrixColors(fil,col,1) = 255;
    matrixColors(fil,col,2) = 0;
    matrixColors(fil,col,3) = 0;
    infected = infected-1;
  endif
endwhile


for w = 1:cicle
  healthyV(w)=healthy;
  sickV(w)=sick;
  inmuneV(w)=immune;
  deadV(w)= dead;
  if(w ==1)
    imshow(matrixColors);
    title({'Parcial sistemas dinamicos','Numero de generacion: ',0,healthy,'Enfermos: ',sick, 'Inmunes: ',immune, 'Muertos: ', dead},"fontsize",30);
    pause(0.5);
  endif
  [matrixOne,matrixColors,sick,healthy,immune,dead] = executeCicle(population,matrixOne,matrixColors,sick,healthy,immune,dead);
  imshow(matrixColors);
  title({'Parcial sistemas dinamicos','Numero de generacion: ',w,'Sanos: ',healthy,'Enfermos: ',sick, 'Inmunes: ',immune, 'Muertos: ', dead},"fontsize",30);
  pause(0.5);
  #disp(matrixOne);

 endfor

plot(sickV)
hold on
plot(healthyV)
hold on
plot(inmuneV)
hold on
plot(deadV)
xlabel ("Generaciones");
ylabel ("Individuos");
legend ("Enfernos", "Sanos","Inmunes","Muertos");
