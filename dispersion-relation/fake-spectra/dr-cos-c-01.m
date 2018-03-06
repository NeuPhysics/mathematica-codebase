(* This Mathmatica script calculates the dispersion relation for a given spectrum and calculates the unstable k and omega values *)

SetDirectory@NotebookDirectory[]

Get["../../../neupackage/mma/dispersion-relation.wl"]

filenamepostfix="-cos-c-01";

spectFun[u_] =1.5 Cos[u Pi/2] -0.5;



(* calcualte the omega-k data *)

okMAAdata=Table[ {n SpectrumOmegaNMAA[n, 1, -1, spectFun], SpectrumOmegaNMAA[n, 1, -1, spectFun]}, {n,-0.99999999,0.9999999,0.01} ]

Export["okMAAdata"<>filenamepostfix<>".csv",okMAAdata]

Print["Exported okMAAdata"<>filenamepostfix<>".csv"]

okMZApdata=Table[ {n SpectrumOmegaNMZA[n, 1, -1, spectFun][[1]], SpectrumOmegaNMZA[n, 1, -1, spectFun][[1]]}, {n,-0.99999999,0.9999999,0.01} ]

Export["okMZApdata"<>filenamepostfix<>".csv", okMZApdata]

Print["Exported okMZApdata"<>filenamepostfix<>".csv"]



okMZAmdata=Table[{n SpectrumOmegaNMZA[n, 1, -1, spectFun][[2]], SpectrumOmegaNMZA[n, 1, -1, spectFun][[2]]}, {n,-0.99999999,0.9999999,0.01}]

Export["okMZAmdata"<>filenamepostfix<>".csv", okMZAmdata]

Print["Exported okMZAmdata"<>filenamepostfix<>".csv"]



(* Calculate LSA for real omega *)

maalsadata=Table[
{omegareal,
{kreal,kimag}/.FindRoot[
SpectrumOmegaKMAAEqnLHS[omegareal,0,kreal,kimag,spectFun],
{kreal,0.1},{kimag,0.1}
]
},
{omegareal,-4.499,4.499,0.001}
]

Export["maalsadata"<>filenamepostfix<>".csv", Flatten@#&/@maalsadata]

Print["Exported maalsadata"<>filenamepostfix<>".csv"]

mzaplsadata=Table[
{omegareal,
{kreal,kimag}/.FindRoot[
SpectrumOmegaKMZApEqnLHS[omegareal,0,kreal,kimag,spectFun],
{kreal,0.1},{kimag,0.1}
]
},
{omegareal,-4.499,4.499,0.01}
]//Quiet

Export["mzaplsadata"<>filenamepostfix<>".csv",Flatten@#&/@mzaplsadata]
Print["Exported mazaplsadata"<>filenamepostfix<>".csv"]


mzamlsadata=Table[
{omegareal,
{kreal,kimag}/.FindRoot[
SpectrumOmegaKMZAmEqnLHS[omegareal,0,kreal,kimag,spectFun],
{kreal,0.1},{kimag,0.1}
]
},
{omegareal,-4.499,4.499,0.01}
]//Quiet

Export["mzamlsadata"<>filenamepostfix<>".csv",Flatten@#&/@mzamlsadata]
Print["Exported mazamlsadata"<>filenamepostfix<>".csv"]

(* Calculate LSA for real k *)

maarealklsadata=Table[
{kreal,
{omegareal,omegaimag}/.FindRoot[
SpectrumOmegaKMAAEqnLHS[omegareal,omegaimag,kreal,0,spectFun],
{omegareal, 0.1},{omegaimag,0.1}
]
},
{kreal,-4.499,4.499,0.01}
]

Export["maarealklsadata"<>filenamepostfix<>".csv", Flatten@#&/@maarealklsadata]
Print["Exported maarealklsadata"<>filenamepostfix<>".csv"]


mzaprealklsadata=Table[
{kreal,
{omegareal,omegaimag}/.FindRoot[
SpectrumOmegaKMZApEqnLHS[omegareal,omegaimag,kreal,0,spectFun],
{omegareal, 0.1},{omegaimag,0.1}
]
},
{kreal,-4.499,4.499,0.01}
]//Quiet

Export["mzaprealklsadata"<>filenamepostfix<>".csv",Flatten@#&/@mzaprealklsadata]
Print["Exported mazaprealklsadata"<>filenamepostfix<>".csv"]


mzamrealklsadata=Table[
{kreal,
{omegareal,omegaimag}/.FindRoot[
SpectrumOmegaKMZAmEqnLHS[omegareal,omegaimag,kreal,0,spectFun],
{omegareal, 0.1},{omegaimag,0.1}
]
},
{kreal,-4.499,4.499,0.01}
]//Quiet

Export["mzamrealklsadata"<>filenamepostfix<>".csv",Flatten@#&/@mzamrealklsadata]
Print["Exported mazamrealklsadata"<>filenamepostfix<>".csv"]
