load "divisors.m";


p := 3;
F := GF(p);
A<u,v> := AffineSpace(F,2);

// these equations are taken from the maple file

f := u^10*v + 25*u^6*v^5 + 162*u^2*v^9 - 5*u^8*v^2 - 77*u^4*v^6 - 81*v^10 + u^6*v^3 - 78*u^2*v^7 + u^8 + 31*u^4*v^4 + 126*v^8 - 4*u^6*v - 53*u^2*v^5 - 6*u^4*v^2 - 85*v^6 + 17*u^2*v^3 + 28*v^4 + u^2*v - 4*v^2;
E := [0, 1, 0, 0, 4];
x := -(4*u^4*v^3 + 81*v^7 + u^6 - 7*u^2*v^4 - 7*u^4*v - 15*v^5 + 14*u^2*v^2 - 7*v^3)/(v*(u^6 - u^4*v^2 + 9*u^2*v^4 - 5*u^4*v - u^2*v^3 - 45*v^5 - u^4 - 4*u^2*v^2 + 21*v^4 + 6*u^2*v + 31*v^3 + u^2 - 8*v^2 - 4*v));
y := -(2*u^8*v + 9*u^6*v^3 + 41*u^4*v^5 + 135*u^2*v^7 + 81*v^9 - u^6*v^2 - 25*u^4*v^4 + 66*u^2*v^6 - 27*v^8 - u^6*v - 5*u^4*v^3 + 25*u^2*v^5 - 81*v^7 + 3*u^6 + 17*u^4*v^2 + 2*u^2*v^4 + 48*v^6 - 6*u^4*v - 31*u^2*v^3 + 41*v^5 - 6*u^2*v^2 - 27*v^4 - u^2*v - 11*v^3 + 6*v^2 + 2*v)/(u*v*(v - 1)*(u^4*v^2 - 9*u^2*v^4 + u^4*v + u^2*v^3 - 36*v^5 + u^4 - 11*u^2*v^2 - 21*v^4 - 6*u^2*v + 5*v^3 - u^2 + 8*v^2 + 3*v));


X0 := Curve(A,f);
X := ProjectiveClosure(X0);
assert Genus(X) eq 11;
assert IsReduced(X);
assert IsIrreducible(X);

E := ChangeRing(EllipticCurve(E),F);
phi :=  map< X -> E | [x,y,1]>;
assert Degree(phi) eq 8;
zero := E ! 0;
P := [P : P in Points(E) | Order(P) eq 6][1];

D0 := Pullback(phi,Place(P))-Pullback(phi,Place(zero));
// D0 is the image of a generator on E(F_3) under  E -> J_0

divs := Divisors_of_Degree(5,X);
print "Nr. of divisors over F_3 to check:", #divs;

todo := [];
for D in Setseq(divs) do
  dim := Dimension(RiemannRochSpace(D[1]+D0));
  if dim gt 0 then
    Append(~todo, D[1]);
  end if;
end for;
print "Nr. of divisors D such that D+D0 in W_5^0:", #todo;

todo2 := [];
for D in todo do
  dims := [Dimension(RiemannRochSpace(D+i*D0)) : i in [1..5]];
  //print dims;
  if 0 notin dims then
     Append(~todo2, D[1]);
  end if;
end for;

assert #todo2 eq 0;

print "Nr. of divisors D such that D+i*D0 in W_5^0 for i=1,...,5:", #todo2;
print "computations for X0(112) finished";

exit;


