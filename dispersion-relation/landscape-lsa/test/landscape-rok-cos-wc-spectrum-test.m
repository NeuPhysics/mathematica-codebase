(* This Mathmatica script calculates the dispersion relation for a given spectrum and calculates the unstable k and omega values *)

SetDirectory@NotebookDirectory[]

(*load the package*)
Get["../../../neupackage/mma/dispersion-relation.wl"]
(*predefined spectra*)

nuediff37 = {#[[1]], #[[2]]/10^(31)}&/@Transpose@N@Import["../garching-data/nuediff37array.csv"];

nuediff37Red = (DeleteDuplicates@nuediff37)[[;; ;; 2]];

spectFunRaw = Interpolation[nuediff37Red]

spectFun[u_] = CoefficientList[ Fit[nuediff37Red, Table[u^n, {n, 0, 20}], u], u].Table[u^n, {n, 0, 20}]

spectFunCos[u_]=Cos[u Pi/2];

(* change the following parameters *)
stepsize=2;
filenamepostfix="-cos-wc-rok-test";

spectrum=spectFunCos


(* Calculate LSA landscape for real omega; dr appears as 0 *)

maalsalandscape=ParallelTable[ {omega,k, SpectrumOmegaKMAAEqnLHSComplex[omega,0,k,0,spectrum]}, {omega, -4.499, 4.499, stepsize}, {k, -4.499, 4.499 , stepsize}]

Export["maalandscape-spectrum"<>filenamepostfix<>".csv", Flatten[maalsalandscape,1] ]

Print["Exported landscape-spectrum"<>filenamepostfix<>".csv"]
ClearAll@maalsalandscape

mzalsalandscape=ParallelTable[
{
   omega, k,SpectrumOmegaKMZAEqnLHSComplex[omega,0,k,0,spectrum]
}, 
{omega, -4.499, 4.499, stepsize}, {k, -4.499, 4.499 , stepsize}
] 

Export["mzalandscape-spectrum"<>filenamepostfix<>".csv",Flatten[mzalsalandscape,1] ]
Print["Exported mzalandscape-spectrum"<>filenamepostfix<>".csv"]



