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


(* change the following parameters *)
filenamepostfix="-wc2";
spectrum=spectWC2;


(* Calculate LSA for real omega *)

maalsadata=Table[{omegareal, {kreal, kimag} /.FindRoot[
ConAxialSymOmegaNMAAEqnLHS[omegareal, 0, kreal, kimag, spectrum], {kreal, 0.1}, {kimag, 0.1}]},
{omegareal, -4.499, 4.499, 0.01}];

Export["maalsadata-box-spectrum"<>filenamepostfix<>".csv", Flatten@#&/@maalsadata]

Print["Exported maalsadata-box-spectrum"<>filenamepostfix<>".csv"]

mzaplsadata=Table[
{
   omegareal, k/.FindRoot[ConAxialSymOmegaNMZApEqnLHSComplex[omegareal, k, spectrum], {k, 0.1 I}]
},
{omegareal,-4.499,4.499,0.01}
]

Export["mzaplsadata-box-spectrum"<>filenamepostfix<>".csv",Flatten@#&/@mzaplsadata]
Print["Exported mazaplsadata-box-spectrum"<>filenamepostfix<>".csv"]


mzamlsadata=Table[
{
   omegareal,
   k/.FindRoot[ConAxialSymOmegaNMZAmEqnLHSComplex[omegareal, k, spectrum], {k, 0.1 I}]
},
{omegareal,-4.499,4.499,0.01}
]//Quiet

Export["mzamlsadata-box-spectrum"<>filenamepostfix<>".csv",Flatten@#&/@mzamlsadata]
Print["Exported mazamlsadata-box-spectrum"<>filenamepostfix<>".csv"]

(* Calculate LSA for real k *)

maarealklsadata=Table[
{kreal,
{omegareal,omegaimag}/.FindRoot[
ConAxialSymOmegaNMAAEqnLHS[omegareal,omegaimag,kreal,0,spectFun],
{omegareal, 0.1},{omegaimag,0.1}
]
},
{kreal,-4.499,4.499,0.01}
]

Export["maarealklsadata-box-spectrum"<>filenamepostfix<>".csv", Flatten@#&/@maarealklsadata]
Print["Exported maarealklsadata-box-spectrum"<>filenamepostfix<>".csv"]


mzaprealklsadata=Table[
{kreal,
omega/.FindRoot[ConAxialSymOmegaNMZApEqnLHSComplex[omega, kreal, spectrum], {omega, 0.1 I}]
},
{kreal,-4.499,4.499,0.01}
]//Quiet

Export["mzaprealklsadata-box-spectrum"<>filenamepostfix<>".csv",Flatten@#&/@mzaprealklsadata]
Print["Exported mazaprealklsadata-box-spectrum"<>filenamepostfix<>".csv"]


mzamrealklsadata=Table[
{
   kreal,
   omega/.FindRoot[ConAxialSymOmegaNMZAmEqnLHSComplex[omega, kreal, spectrum], {omega, 0.1 I}]
},
{kreal,-4.499,4.499,0.01}
]//Quiet

Export["mzamrealklsadata-box-spectrum"<>filenamepostfix<>".csv",Flatten@#&/@mzamrealklsadata]
Print["Exported mazamrealklsadata-box-spectrum"<>filenamepostfix<>".csv"]
