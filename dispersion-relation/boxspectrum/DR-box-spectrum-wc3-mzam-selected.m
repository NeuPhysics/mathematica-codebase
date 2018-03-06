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
filenamepostfix="-wc3";
spectrum=spectWC3;
prangeomegareal={-0.31,-0.01}
mrangeomegareal={0.01,3.4}

(* Calculate LSA for real omega *)

(*
    mzaplsadata=Table[
{
   omegareal, k/.FindRoot[ConAxialSymOmegaNMZApEqnLHSComplex[omegareal, k, spectrum], {k, 0.1 I}, MaxIterations -> 10000]
},
{omegareal,prangeomegareal[[1]],prangeomegareal[[2]],0.01}
]

Export["mzaplsadata-box-spectrum"<>filenamepostfix<>"-improved.csv",Flatten@#&/@mzaplsadata]
Print["Exported mazaplsadata-box-spectrum"<>filenamepostfix<>"-improved.csv"]
*)


mzamlsadata=Table[
{
   omegareal,
   k/.FindRoot[ConAxialSymOmegaNMZAmEqnLHSComplex[omegareal, k, spectrum], {k, -I, I}, Method->"Secant", MaxIterations -> 100000000,AccuracyGoal->5]
},
{omegareal,{-0.1,-0.05,-0.01,0.01,0.05,0.1}}
]//Quiet

Export["mzamlsadata-box-spectrum"<>filenamepostfix<>"-selected-secant.csv",Flatten@#&/@mzamlsadata]
Print["Exported mazamlsadata-box-spectrum"<>filenamepostfix<>"-selected-secant.csv"]

mzamlsadataNewton=Table[
{
   omegareal,
   k/.FindRoot[ConAxialSymOmegaNMZAmEqnLHSComplex[omegareal, k, spectrum], {k, -0.5-I}, MaxIterations -> 100000000,AccuracyGoal->5]
},
{omegareal,{-0.1,-0.05,-0.01,0.01,0.05,0.1}}
]//Quiet

Export["mzamlsadata-box-spectrum"<>filenamepostfix<>"-selected-newton.csv",Flatten@#&/@mzamlsadataNewton]
Print["Exported mazamlsadata-box-spectrum"<>filenamepostfix<>"-selected-newton.csv"]

