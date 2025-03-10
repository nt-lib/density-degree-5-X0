load "QuadraticPoints/models_and_maps.m";

function DegreeMapSearch(D, d)
  // Helper function to seach for a degree d function in RiemannRochspace(D).
  // Warning note if this function returns false then RiemannRochspace(D)
  // might still contain a function of degree d. However, if it returns
  // true then one is guaranteed to have a degree d function and it is
  // returned as the second argument.
  assert IsEffective(D);
  V,f := RiemannRochSpace(D);
  if Dimension(V) ge 2 then
    for v in Basis(V) do
      if Degree(f(v)) eq 5 then
        return true, f(v);
      end if;
    end for;
  end if;
  return false, V ! 0;
end function;

function X0Degree5MapSearch(N,d)
  X,ws,pairs:= eqs_quos(N,[[d]]);
  Xw:=pairs[1,1];
  f:=pairs[1,2];
  if genus_quo(N,[d]) le 2 or IsHyperelliptic(Xw) then
    ptsXw:=Points(Xw : Bound:=1000);
  else
    ptsXw:=PointSearch(Xw,1000);
  end if;
  //#ptsXw;
  pb:=[Pullback(f,Place(p)):p in ptsXw];
  pls1:={}; pls2:={};
  for i:=1 to #pb do
    dec:=Decomposition(pb[i]);
    if #dec eq 2 then
      pls1:= pls1 join {dec[1,1], dec[2,1]};
    else
      pls2:= pls2 join {dec[1,1]};
    end if;
  end for;
  pls1:=SetToSequence(pls1);
  pls2:=SetToSequence(pls2);
  //#pls1, #pls2;


  for i:=1 to #pls1 do
    for j:=i to #pls1 do
      for k:=j to #pls1 do
        for l:=k to #pls1 do
          for m:=l to #pls1 do
            D:=pls1[i]+pls1[j]+pls1[k]+pls1[l]+pls1[m];
            has_deg_5_map, f := DegreeMapSearch(D, 5);
            if has_deg_5_map then
              return has_deg_5_map, f;
            end if;
          end for;
        end for;
      end for;
    end for;
  end for;

  for i:=1 to #pls1 do
    for j:=i to #pls1 do
      for k:=j to #pls1 do
        for l:=1 to #pls2 do
          D:=pls1[i]+pls1[j]+pls1[k]+pls2[l];
          has_deg_5_map, f := DegreeMapSearch(D, 5);
          if has_deg_5_map then
            return has_deg_5_map, f;
          end if;
        end for;
      end for;
    end for;
  end for;

  for i:=1 to #pls1 do
    for j:=1 to #pls2 do
      for k:=j to #pls2 do
        D:=pls1[i]+pls2[j]+pls2[k];
        has_deg_5_map, f := DegreeMapSearch(D, 5);
        if has_deg_5_map then
          return has_deg_5_map, f;
        end if;
      end for;
    end for;
  end for;

  return has_deg_5_map, f;
end function;
