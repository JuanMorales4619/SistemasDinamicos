function [matrixTwo,matrixColors,sick,healthy,immune,dead] = executeCicle (population,matrixOne,matrixColors,sick,healthy,immune,dead)
  matrixTwo = zeros(population,population);
  #healthy=0;
  #dead=0;
  # enfermos 1 Rojo
# sanos 2 Verde
# inmunes 3 Azul
# muertos 0 Negro
  a=0;
  b=0;
  c=0;
  d=0;
  for i = 1:population
    for j = 1:population
      if (matrixOne(i,j) == 1)
        probabilidad_1 = randi(100);
        matrixTwo(i,j) = 1;
        if(probabilidad_1<=2)
          sick = sick-1;
          dead = dead+1;
          matrixTwo(i,j) = 0;
          matrixColors(i,j,1) = 0;
          matrixColors(i,j,2) = 0;                #Muerte
          matrixColors(i,j,3) = 0;
        endif
        if ((probabilidad_1<=3) && (matrixTwo(i,j)!=0))
          sick =sick-1;
          immune = immune+1;
          matrixTwo(i,j) = 3;
          matrixColors(i,j,1) = 0;
          matrixColors(i,j,2) = 0;              #Inmunidad
          matrixColors(i,j,3) = 255;
        endif
        if (probabilidad_1<=7 && matrixTwo(i,j)!=0 && matrixTwo(i,j)!=3)
          healthy =healthy+1;
          sick = sick-1;
          matrixTwo(i,j) = 2;
          matrixColors(i,j,1) = 0;            #Cura pero no inmune
          matrixColors(i,j,2) = 255;
          matrixColors(i,j,3) = 0;
        endif
     endif




      if (matrixOne(i,j) == 2)  # Sano
        matrixTwo(i,j) = 2;
        if(i != 1)
          d = matrixOne(i-1,j);
        endif
        if(i != population)
          a = matrixOne(i+1,j);
        endif
        if(j != population)
          b = matrixOne(i,j+1);
        endif
        if(j != 1)
          c = matrixOne(i,j-1);
        endif
        if(randi(100)<= 1)                             #Muerte
          dead = dead+1;
          healthy =healthy-1;
          matrixTwo(i,j) = 0;
          matrixColors(i,j,1) = 0;
          matrixColors(i,j,2) = 0;
          matrixColors(i,j,3) = 0;
        elseif((a == 1 || b == 1 || c == 1 || d == 1) && matrixTwo(i,j) != 0)
          if(calculateDisease(a,b,c,d))                   #Enfermo
            sick = sick+1;
            healthy =healthy-1;
            matrixTwo(i,j) = 1;
            matrixColors(i,j,1) = 255;
            matrixColors(i,j,2) = 0;
            matrixColors(i,j,3) = 0;
          else
            matrixTwo(i,j) = 2;
            #healthy =healthy+1;
            matrixColors(i,j,1) = 0;
            matrixColors(i,j,2) = 255;
            matrixColors(i,j,3) = 0;
          endif
         endif
       endif




      #if(matrixOne(i,j) == 0)
      #  dead=dead+1;
      #endif


      if(matrixOne(i,j) == 3)
        if(randi(100)<= 1)                             #Muerte
          dead = dead+1;
          immune =immune-1;
          matrixTwo(i,j) = 0;
          matrixColors(i,j,1) = 0;
          matrixColors(i,j,2) = 0;
          matrixColors(i,j,3) = 0;
        else
          matrixTwo(i,j) = matrixOne(i,j);
          matrixColors(i,j,1) = 0;
          matrixColors(i,j,2) = 0;
          matrixColors(i,j,3) = 255;
        endif
      endif
    endfor
  endfor
  return
endfunction
