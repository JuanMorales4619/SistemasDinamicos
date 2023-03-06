% enfermos 1
% sanos 2
% inmunes 3
% muertos 0
population = input("Ingrese el tamaño de la poblacion: ");
infected = input("Ingrese el porcentaje de enfermos: ");
cicle = input("Ingrese el numero de generaciones: ");
matrixOne=zeros(population,population);
sick = 0;
healthy = 0;
immune = 0;
dead =0;
for i = 1:population
  for j = 1:population
    percentage = roll(100);
    if (percentage>infected)
      matrixOne(i,j)= 2;
    else
      matrixOne(i,j)= 1;
    endif;
  endfor;
endfor;
for w = 1:cicle
  fprintf('generacion:%f .\n',w);
  fprintf('enfermos:%f\n',sick);
  fprintf('sanos:%f\n',healthy);
  fprintf('inmunes:%f\n',immune);
  fprintf('muertos:%f\n',dead);
  disp(matrixOne);
  [matrixOne,sick,healthy,immune,dead] = executeCicle(population,matrixOne,sick,healthy,immune,dead);
 endfor

