(* This Mathmatica script calculates the dispersion relation for a given spectrum and calculates the unstable k and omega values *)

SetDirectory@NotebookDirectory[]

(*load the package*)
Get["../../../../neupackage/mma/dispersion-relation.wl"]
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
stepsizeimag=0.01;
filenamepostfix="-s-rock-01";

spectrum=spectS


(* Calculate LSA landscape for real omega; dr appears as 0 *)

maalsalandscapeRaw=ParallelTable[ {omega,kreal, ConAxialSymOmegaNMAAEqnLHSComplex[omega, kreal+I*kimag, spectrum], kimag}, {omega, -1, 2, stepsize}, {kreal, -1, 2, stepsize}, {kimag, 0, 2, stepsizeimag}]

maalsalandscape = Flatten[ ParallelTable[
 Sort[
   maalsalandscapeRaw[[i,j]], Abs[#1[[3]]] < Abs[#2[[3]]] &
   ][[1]],
 {i, 1, Length@maalsalandscapeRaw},{j,1, Length@maalsalandscapeRaw[[1]]}
],1]

ClearAll@maalsalandscapeRaw

Export["maalandscape-spectrum"<>filenamepostfix<>".csv", maalsalandscape ]

Print["Exported landscape-rok-spectrum-"<>filenamepostfix<>".csv"]

ClearAll@maalsalandscape

mzalsalandscapeRaw=ParallelTable[
{
   omega, kreal, ConAxialSymOmegaNMZAEqnLHSComplex[omega, kreal+I*kimag, spectrum],kimag
},
{omega,-1,2,stepsize},{kreal,-1,2,stepsize},{kimag,0,2,stepsizeimag}
]

mzalsalandscape = Flatten[ ParallelTable[
 Sort[
  mzalsalandscapeRaw[[i,j]], Abs[#1[[3]]] < Abs[#2[[3]]] &
   ][[1]],
 {i, 1, Length@mzalsalandscapeRaw},{j,1,Length@mzalsalandscapeRaw[[1]]}
],1]

ClearAll@mzalsalandscapeRaw

Export["mzalandscape-spectrum"<>filenamepostfix<>".csv",mzalsalandscape ]
Print["Exported mzalandscape-spectrum"<>filenamepostfix<>".csv"]


