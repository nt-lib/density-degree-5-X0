load "deg_5_function_search.m";

for pairs in [[42,42],[51,51],[52,52],[54,54],[55,55],[56,56],[57,19],[58,58],[63,63],[64,64],[65,65],[67,67],[68,17],[72,72],[73,73],[75,75],[80,80],[91,91],[121,121]] do
  printf "Searching for function of degree 5 on X_0(%o).\n", pairs[1];
  assert X0Degree5MapSearch(pairs[1],pairs[2]);
  print "Degree 5 function found!";
end for;

exit;

