(* ::Package:: *)

SetDirectory@NotebookDirectory[];
Get["../../../neupackage/mma/dispersion-relation.wl"]



spectWC1 = {{{-1, -0.3}, 1}, {{-0.3, 1}, 1}};
spectWC2 = {{{-1, -0.3}, 0.5}, {{-0.3, 1}, 1}};
spectWC3 = {{{-1, -0.3}, 0.1}, {{-0.3, 1}, 1}};
spectWC4 = {{{-1, -0.3}, 0}, {{-0.3, 1}, 1}};

spectC1 = {{{-1, -0.3}, -0.1}, {{-0.3, 1}, 1}};
spectC2 = {{{-1, -0.3}, -0.5}, {{-0.3, 1}, 1}};
spectC3 = {{{-1, -0.3}, -1}, {{-0.3, 1}, 1}};
spectC4 = {{{-1, -0.3}, -1.5}, {{-0.3, 1}, 1}};




Total[#[[2]] IntFun0n[k/omega,#[[1,1]],#[[1,2]]]&/@spectWC1]


ConAxialSymOmegaNMAAEqnLHSComplex[0.1, 0.4, spectWC1]


N[
k/.NSolve[
ConAxialSymOmegaNMAAEqnLHSComplex[0.1, k, spectWC1]==0,
k
]
]



