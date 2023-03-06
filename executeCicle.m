function [matrixTwo,sick,healthy,immune,dead] = executeCicle (population,matrixOne,sick,healthy,immune,dead)
  matrixTwo = zeros(population,population);
  a=0;
  b=0;
  c=0;
  d=0;
  for i = 1:population
    for j = 1:population
      if (matrixOne(i,j) == 1)
        if(Probability(10))
          dead = dead+1;
          matrixTwo(i,j) = 0;
        elseif (Probability(15))
          immune = immune+1;
          matrixTwo(i,j) = 3;
        else
          sick = sick+1;
          matrixTwo(i,j) = 1;
        endif
      elseif (matrixOne(i,j) == 2)
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
        if(Probability(3))
          dead = dead+1;
          matrixTwo(i,j) = 0;
        elseif(a == 1 || b == 1 || c == 1 || d == 1)
          if(calculateDisease(a,b,c,d))
            sick = sick+1;
            matrixTwo(i,j) = 1;
          endif
        else
          healthy =healthy+1;
          matrixTwo(i,j) = 2;
        endif
      else
        matrixTwo(i,j) = matrixOne(i,j);
      endif
    endfor
  endfor

  return
endfunction
