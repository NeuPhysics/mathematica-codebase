(* ::Package:: *)

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

absFun[x_]:=x[[1]]^2+x[[2]]^2


(* change the following parameters *)
stepsize=1;
stepsizeimag=1;
omegaBeg = -1;
omegaEnd = 2;
krealBeg = -1;
krealEnd = 2;
kimagBeg = 0;
kimagEnd = 2;

filenamepostfix="-garching-rock-1";

spectrum=spectFun

(* Export Basic Data *)

parameters = {
"Omega range: "<>ToString[omegaBeg]<>" to "<>ToString@omegaEnd<>" with stepsize "<>ToString@stepsize<>"; ",
"kreal range: "<>ToString[krealBeg]<>" to "<>ToString@krealEnd<>" with stepsize "<>ToString@stepsize<>"; ",
"kimag range: "<>ToString[kimagBeg]<>" to "<>ToString@kimagEnd<>" with stepsize "<>ToString@stepsizeimag<>"; ",
"Order of tables: omega, kreal, kimag"
}
Export["landscape-rock-spectrum"<>filenamepostfix<>"-parameters.csv", parameters ]
Print["Exported landscape-spectrum"<>filenamepostfix<>"-parameters.csv"]

(* Calculate LSA landscape for real omega; dr appears as 0 *)

kimagTab = Table[kimag,{kimag,kimagBeg,kimagEnd,stepsizeimag}];

maalsalandscapeRaw=Flatten[
ParallelTable[SpectrumOmegaKMAAEqnLHS[omega,0,kreal,kimag,spectrum],{omega, omegaBeg, omegaEnd, stepsize}, {kreal, krealBeg, krealEnd, stepsize}, {kimag, 0, 2, stepsizeimag}]
,2]//Quiet;



Export["maalandscape-spectrum"<>filenamepostfix<>".csv", maalsalandscape ]
Print["Exported maalandscape-spectrum"<>filenamepostfix<>".csv"]

ClearAll@maalsalandscape;

mzalsalandscape=Flatten[
ParallelTable[ SpectrumOmegaKMZAEqnLHS[omega, kreal,kimag, spectrum], {omega,-1,2,stepsize},{kreal,-1,2,stepsize},{kimag,0,2,stepsizeimag}],
2]


Export["mzalsalandscape-spectrum"<>filenamepostfix<>".csv",mzalsalandscape ]
Print["Exported mzalsalandscape-spectrum"<>filenamepostfix<>".csv"]

ClearAll@mzalsalandscape

