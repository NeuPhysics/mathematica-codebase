SetDirectory@NotebookDirectory[]
Get["../../../neupackage/mma/dispersion-relation.wl"]

nuediff37 = {#[[1]], #[[2]]/10^(31)} & /@Transpose@N@Import["../garching-data/nuediff37array.csv"];
Print[nuediff37]
nuediff37Red = (DeleteDuplicates@nuediff37)[[;; ;; 2]];
spectFunRaw = Interpolation[nuediff37Red];

spectFun[u_] = CoefficientList[Fit[nuediff37Red, Table[u^n, {n, 0, 20}], u], u].Table[u^n, {n, 0, 20}];

drMAA = Table[{n SpectrumOmegaNMAA[n, 1, -1, spectFun],  SpectrumOmegaNMAA[n, 1, -1, spectFun]}, {n,-0.99, 0.99, 0.001}];

Export["drMAA.csv",drMAA];
Print["Export drMAA.csv"]

drMZAp = Table[{n *#, #} & /@ SpectrumOmegaNMZA[n, 1, -1, spectFun][[1]], {n,-0.99, 0.99,0.001}];

Export["drMZAp.csv",drMZAp];
Print["Export drMZAp.csv"]

drMZAm = Table[{n *#, #} & /@ SpectrumOmegaNMZA[n, 1, -1, spectFun][[2]], {n,-0.99, 0.99,0.001}];

Export["drMZAm.csv",drMZAm];
Print["Export drMZAm.csv"]
