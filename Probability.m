
function number = Probability(probability)
  x = randi(100);
  if(x<probability)
    number = true;
   else
    number = false;
   endif
   return
endfunction
