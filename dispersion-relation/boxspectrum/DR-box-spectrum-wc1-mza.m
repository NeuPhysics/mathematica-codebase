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
filenamepostfix="-wc1";
spectrum=spectWC1;
prangeomegareal={-0.31,-0.01}
mrangeomegareal={0.01,3.4}

(* Calculate LSA for real omega *)

mzaplsadata=Table[
{
   omegareal, k/.FindRoot[ConAxialSymOmegaNMZApEqnLHSComplex[omegareal, k, spectrum], {k, 0.1 I}, MaxIterations -> 10000]
},
{omegareal,prangeomegareal[[1]],prangeomegareal[[2]],0.01}
]

Export["mzaplsadata-box-spectrum"<>filenamepostfix<>".csv",Flatten@#&/@mzaplsadata]
Print["Exported mazaplsadata-box-spectrum"<>filenamepostfix<>".csv"]


mzamlsadata=Table[
{
   omegareal,
   k/.FindRoot[ConAxialSymOmegaNMZAmEqnLHSComplex[omegareal, k, spectrum], {k, 0.1 I}, MaxIterations -> 10000]
},
{omegareal,mrangeomegareal[[1]],mrangeomegareal[[2]],0.01}
]//Quiet

Export["mzamlsadata-box-spectrum"<>filenamepostfix<>".csv",Flatten@#&/@mzamlsadata]
Print["Exported mazamlsadata-box-spectrum"<>filenamepostfix<>".csv"]

