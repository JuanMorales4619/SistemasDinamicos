function disease = calculateDisease(a,b,c,d)
  number = 0;
  if(a == 1)
    number = number + 20+randi(5);
  endif
  if(b == 1)
    number = number + 20+randi(5);
  endif
  if(c == 1)
    number = number + 20+randi(5);
  endif
  if(d == 1)
    number = number + 20+randi(5);
  endif
  if(25<=number)
    disease = true;
  else
    disease = false;
  endif
  return
endfunction
