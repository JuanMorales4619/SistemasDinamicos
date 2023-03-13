function disease = calculateDisease(a,b,c,d)
  number = 0;
  if(a == 1)
    number = number + 10+randi(15);
  endif
  if(b == 1)
    number = number + 10+randi(15);
  endif
  if(c == 1)
    number = number + 10+randi(15);
  endif
  if(d == 1)
    number = number + 10+randi(15);
  endif
  if(randi(100) <= number)
    disease = true;
  else
    disease = false;
  endif
  return
endfunction
