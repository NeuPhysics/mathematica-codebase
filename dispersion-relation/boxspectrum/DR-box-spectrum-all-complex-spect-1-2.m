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


(* calculate C1 spectrum*)

(*
    omegakcomplexC1 = Table[
  {
   omegareal + omegaimag I,
   k /. FindRoot[
     ConAxialSymOmegaNMZAmEqnLHSComplex[omegareal + omegaimag I, k, 
      spectC1], {k, 0.1 I}]
         },
  {omegareal,-4.5,4.5,0.1}, {omegaimag, -10, 10, 0.1}
      ]
    

Export["export/allcomplex/omegakcomplexc1.csv", omegakcomplexC1]

Print["Exported export/allcomplex/omegakcomplexc1.csv"]

*)

omegakcomplexC1Ext = Table[
  {
   omegareal + omegaimag I,
   k /. FindRoot[
     ConAxialSymOmegaNMZAmEqnLHSComplex[omegareal + omegaimag I, k, 
      spectC1], {k, 0.1 I}]
         },
  {omegareal,-4.5,4.5,0.1}, {omegaimag, -20, 20, 0.1}
      ]


Export["export/allcomplex/omegakcomplexc1ext.csv", omegakcomplexC1Ext]

Print["Exported export/allcomplex/omegakcomplexc1ext.csv"]


(* calcualte WC1 spectrum *)

omegakcomplexWC1 = Table[
  {
   omegareal + omegaimag I,
   k /. FindRoot[
     ConAxialSymOmegaNMZAmEqnLHSComplex[omegareal + omegaimag I, k, 
      spectWC1], {k, 0.1 I}]
         },
  {omegareal,-4.5,4.5,0.1}, {omegaimag, -10, 10, 0.1}
      ]
    

Export["export/allcomplex/omegakcomplexwc1.csv", omegakcomplexWC1]

Print["Exported export/allcomplex/omegakcomplexwc1.csv"]


omegakcomplexWC1Ext = Table[
  {
   omegareal + omegaimag I,
   k /. FindRoot[
     ConAxialSymOmegaNMZAmEqnLHSComplex[omegareal + omegaimag I, k, 
      spectWC1], {k, 0.1 I}]
         },
  {omegareal,-4.5,4.5,0.1}, {omegaimag, -20, 20, 0.1}
      ]


Export["export/allcomplex/omegakcomplexwc1ext.csv", omegakcomplexWC1Ext]

Print["Exported export/allcomplex/omegakcomplexwc1ext.csv"]


(* C2 Spectrum *)



omegakcomplexC2 = Table[
  {
   omegareal + omegaimag I,
   k /. FindRoot[
     ConAxialSymOmegaNMZAmEqnLHSComplex[omegareal + omegaimag I, k, 
      spectC2], {k, 0.1 I}]
         },
  {omegareal,-4.5,4.5,0.1}, {omegaimag, -10, 10, 0.1}
      ]
    

Export["export/allcomplex/omegakcomplexc2.csv", omegakcomplexC2]

Print["Exported export/allcomplex/omegakcomplexc2.csv"]


omegakcomplexC2Ext = Table[
  {
   omegareal + omegaimag I,
   k /. FindRoot[
     ConAxialSymOmegaNMZAmEqnLHSComplex[omegareal + omegaimag I, k, 
      spectC2], {k, 0.1 I}]
         },
  {omegareal,-4.5,4.5,0.1}, {omegaimag, -20, 20, 0.1}
      ]


Export["export/allcomplex/omegakcomplexc2ext.csv", omegakcomplexC2Ext]

Print["Exported export/allcomplex/omegakcomplexc2ext.csv"]



(* WC2 spectrum *)





omegakcomplexWC2 = Table[
  {
   omegareal + omegaimag I,
   k /. FindRoot[
     ConAxialSymOmegaNMZAmEqnLHSComplex[omegareal + omegaimag I, k, 
      spectWC2], {k, 0.1 I}]
         },
  {omegareal,-4.5,4.5,0.1}, {omegaimag, -10, 10, 0.1}
      ]
    

Export["export/allcomplex/omegakcomplexwc2.csv", omegakcomplexWC2]

Print["Exported export/allcomplex/omegakcomplexwc2.csv"]


omegakcomplexWC1Ext = Table[
  {
   omegareal + omegaimag I,
   k /. FindRoot[
     ConAxialSymOmegaNMZAmEqnLHSComplex[omegareal + omegaimag I, k, 
      spectWC2], {k, 0.1 I}]
         },
  {omegareal,-4.5,4.5,0.1}, {omegaimag, -20, 20, 0.1}
      ]


Export["export/allcomplex/omegakcomplexwc2ext.csv", omegakcomplexWC2Ext]

Print["Exported export/allcomplex/omegakcomplexwc2ext.csv"]


