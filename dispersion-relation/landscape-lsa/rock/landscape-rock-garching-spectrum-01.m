(* This Mathmatica script calculates the dispersion relation for a given spectrum and calculates the unstable k and omega values *)

SetDirectory@NotebookDirectory[]

(*load the package*)
Get["../../../../neupackage/mma/dispersion-relation.wl"]
(*predefined spectra*)

nuediff37 = {#[[1]], #[[2]]/10^(31)}&/@Transpose@N@Import["../../garching-data/nuediff37array.csv"];

Print["Data Imported"]

nuediff37Red = (DeleteDuplicates@nuediff37)[[;; ;; 2]];

spectFunRaw = Interpolation[nuediff37Red]

spectFun[u_] = CoefficientList[ Fit[nuediff37Red, Table[u^n, {n, 0, 20}], u], u].Table[u^n, {n, 0, 20}]


(* change the following parameters *)
stepsize=0.01;
stepsizeimag=0.01;
filenamepostfix="-garching-rock-01";

spectrum=spectFun


(* Calculate LSA landscape for real omega; dr appears as 0 *)

maalsalandscapeRaw=ParallelTable[ {omega,kreal,SpectrumOmegaKMAAEqnLHSComplex[omega,0,kreal,kimag,spectrum], kimag}, {omega, -1, 2, stepsize}, {kreal, -1, 2, stepsize}, {kimag, 0, 2, stepsizeimag}]

maalsalandscape = Flatten[
ParallelTable[
 Sort[
   maalsalandscapeRaw[[i,j]], Abs[#1[[3]]] < Abs[#2[[3]]] &
   ][[1]],
 {i, 1, Length@maalsalandscapeRaw},{j,1,Length@maalsalandscapeRaw[[1]]}
],
1]


ClearAll@maalsalandscapeRaw

Export["maalandscape-spectrum"<>filenamepostfix<>".csv", maalsalandscape ]

Print["Exported maalandscape-spectrum"<>filenamepostfix<>".csv"]

ClearAll@maalsalandscape;

mzalsalandscapeRaw=ParallelTable[
{
   omega, kreal,SpectrumOmegaKMZAEqnLHSComplex[omega, 0, kreal,kimag, spectrum],kimag
},
{omega,-1,2,stepsize},{kreal,-1,2,stepsize},{kimag,0,2,stepsizeimag}
]

mzalsalandscape = Table[
 Sort[
   mzalsalandscapeRaw[[i,j]], Abs[#1[[3]]] < Abs[#2[[3]]] &
   ][[1]],
 {i, 1, Length@mzalsalandscapeRaw},{j,1,Length@mzalsalandscapeRaw[[1]]}
]

ClearAll@mzalsalandscapeRaw

Export["mzalandscape-spectrum"<>filenamepostfix<>".csv",mzalsalandscape ]
Print["Exported mzalandscape-spectrum"<>filenamepostfix<>".csv"]





