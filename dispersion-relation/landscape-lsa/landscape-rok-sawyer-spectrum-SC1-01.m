(* This Mathmatica script calculates the dispersion relation for a given spectrum and calculates the unstable k and omega values *)

SetDirectory@NotebookDirectory[]

(*load the package*)
Get["../../../neupackage/mma/dispersion-relation.wl"]
(*predefined spectra*)

spectWC1 = {{{-1, -0.3}, 1}, {{-0.3, 1}, 1}};
spectWC2 = {{{-1, -0.3}, 0.5}, {{-0.3, 1}, 1}};
spectWC3 = {{{-1, -0.3}, 0.1}, {{-0.3, 1}, 1}};
spectWC4 = {{{-1, -0.3}, 0}, {{-0.3, 1}, 1}};

spectC1 = {{{-1, -0.3}, -0.1}, {{-0.3, 1}, 1}};
spectC2 = {{{-1, -0.3}, -0.5}, {{-0.3, 1}, 1}};
spectC3 = {{{-1, -0.3}, -1}, {{-0.3, 1}, 1}};
spectC4 = {{{-1, -0.3}, -1.5}, {{-0.3, 1}, 1}};

spectB = { {{ 0,1 }, 1} }
uNueBarMin = Cos[ArcSin[0.93]]
alpha = 0.77 (1/0.93)^2;
spectS = {{{0, uNueBarMin}, 1}, {{uNueBarMin, 1}, 1 - alpha}}

spectSC1 = {{{0, uNueBarMin}, 1}, {{uNueBarMin, 1}, -0.1}}
spectSC2 = {{{0, uNueBarMin}, 1}, {{uNueBarMin, 1}, -0.3}}

(* change the following parameters *)
stepsize=0.01;
filenamepostfix="-sc1-rok-01";
spectrum=spectSC1


(* Calculate LSA landscape for real omega; dr appears as 0 *)

maalsalandscape=ParallelTable[ {omega,k, ConAxialSymOmegaNMAAEqnLHSComplex[omega, k, spectrum]}, {omega, -1, 2, stepsize}, {k, -1, 2, stepsize}]

Export["maalandscape-spectrum"<>filenamepostfix<>".csv", Flatten[maalsalandscape,1] ]

Print["Exported landscape-rok-spectrum"<>filenamepostfix<>".csv"]
ClearAll@maalsalandscape

mzalsalandscape=ParallelTable[
{
   omega, k, ConAxialSymOmegaNMZAEqnLHSComplex[omega, k, spectrum]
},
{omega,-1,2,stepsize},{k,-1,2,stepsize}
]

Export["mzalandscape-spectrum"<>filenamepostfix<>".csv",Flatten[mzalsalandscape,1] ]
Print["Exported mzalandscape-spectrum"<>filenamepostfix<>".csv"]



