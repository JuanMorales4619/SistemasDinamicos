function disease = calculateDisease(a,b,c,d)
  number = 0;
  if(a == 1)
    number = number + (int32(round(10 + (25-10)*rand())));
  endif
  if(b == 1)
    number = number + (int32(round(10 + (25-10)*rand())));
  endif
  if(c == 1)
    number = number + (int32(round(10 + (25-10)*rand())));
  endif
  if(d == 1)
    number = number + (int32(round(10 + (25-10)*rand())));
  endif
  disease = Probability(number);
  return
endfunction
