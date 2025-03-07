\\ this GP script computes the q-expansions of the modular parameterizations
\\ of the elltiptic curves with lmfdb labels 112.a2 and 117.a4

default(seriesprecision, 200)

\\ The only optimal/strong weil elliptic curve of positive rank and conductor
\\ dividing 112. taken from https://www.lmfdb.org/EllipticCurve/Q/112/a/2
E = ellinit([0, 1, 0, 0, 4])
xy = subst(elltaniyama(E), 'x, q)
print("q-expansions for 112:")
print(xy)

\\ The only optimal/strong weil elliptic curve of positive rank and conductor
\\ dividing 117. taken from https://www.lmfdb.org/EllipticCurve/Q/117/a/4
E = ellinit([1, -1, 1, 4, 6])
xy = subst(elltaniyama(E), 'x, q)
print("q-expansions for 117:")
print(xy)

quit()

