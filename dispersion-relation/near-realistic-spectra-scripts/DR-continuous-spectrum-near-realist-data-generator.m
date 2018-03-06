SetDirectory@NotebookDirectory[]



Get["../../neupackage/mma/dispersion-relation.wl"]



colorf=Blend[{Blue,Red},#]&;
colorRainbow=ColorData["Rainbow"];
colorTemp=ColorData["Temperature"];
plotLegend[{min_,max_},n_,col_]:=Graphics[{{col[(#-1)/(n-1)],Rectangle[{0,#-1},{1,#}]},{Black,Text[NumberForm[Rescale[#,{1,n},{min,max}],{4,2}],{3,#-.5},{1,0}]}}&/@Range@n,Frame->True,FrameTicks->None,PlotRangePadding->.5]



dataFake={{-1,1.3},{-0.8,1.4},{-0.7,1.5},{-0.6,1.7},{-0.5,2},{0,2.5},{0.5,8},{1,6}} 
(* dataFake={{-1, -1.3}, {-0.8, -1.0}, {-0.7, -0.8}, {-0.6, -0.3}, {-0.5, -0.1}, {0, 0.5}, {0.5, 8}, {1, 6}} *)



spectFun[u_]=CoefficientList[
Fit[dataFake,{1,u,u^2,u^3,u^4,u^5},u],
u].{1,u,u^2,u^3,u^4,u^5}



spectFun2[u_]:=1



IntFun0nFF[n_,ct1_,ct2_,spectrumFun_]:= NIntegrate[(spectrumFun@u)/(1-n u),{u,ct1,ct2},Method->"PrincipalValue"];



IntFun1nFF[n_,ct1_,ct2_,spectrumFun_]:= NIntegrate[(spectrumFun@u)u/(1-n u),{u,ct1,ct2},Method->"PrincipalValue"];



IntFun2nFF[n_,ct1_,ct2_,spectrumFun_]:= NIntegrate[(spectrumFun@u)u^2/(1-n u),{u,ct1,ct2},Method->"PrincipalValue"];



SpectrumOmegaNMAA[n_?NumberQ,ct1_,ct2_,spectrumFun_]:=(IntFun0nFF[n,ct1,ct2,spectrumFun]-IntFun2nFF[n,ct1,ct2,spectrumFun])/(-4)



SpectrumOmegaNMZA[n_?NumberQ,ct1_,ct2_,spectrumFun_]:=-{(IntFun0nFF[n,ct1,ct2,spectrumFun]-IntFun2nFF[n,ct1,ct2,spectrumFun]+\[Sqrt]((IntFun0nFF[n,ct1,ct2,spectrumFun]+IntFun2nFF[n,ct1,ct2,spectrumFun]-2IntFun1nFF[n,ct1,ct2,spectrumFun])(IntFun0nFF[n,ct1,ct2,spectrumFun]+IntFun2nFF[n,ct1,ct2,spectrumFun]+2IntFun1nFF[n,ct1,ct2,spectrumFun])))/(-4),
(IntFun0nFF[n,ct1,ct2,spectrumFun]-IntFun2nFF[n,ct1,ct2,spectrumFun]-\[Sqrt]((IntFun0nFF[n,ct1,ct2,spectrumFun]+IntFun2nFF[n,ct1,ct2,spectrumFun]-2IntFun1nFF[n,ct1,ct2,spectrumFun])(IntFun0nFF[n,ct1,ct2,spectrumFun]+IntFun2nFF[n,ct1,ct2,spectrumFun]+2IntFun1nFF[n,ct1,ct2,spectrumFun])))/(-4)
}



SpectrumOmegaNMAA[0.3,1,-1,spectFun]



SpectrumOmegaKMAAEqnLHS[omegaR_?NumberQ,omegaI_?NumericQ,kR_?NumberQ,kI_?NumberQ,spect_]:=Module[{eqnLHSM,spectM,IntFun0nFFM,IntFun1nFFM,IntFun2nFFM},


spectM=spect;

IntFun0nFFM=NIntegrate[(spectM@u)/(1-(kR+I*kI) u/(omegaR+I*omegaI)),{u,-1,1}];
IntFun2nFFM=NIntegrate[(spectM[u]u^2)/(1-(kR+I*kI) u/(omegaR+I*omegaI)),{u,-1,1}];


eqnLHSM[omega_,k_]:=omega-(IntFun0nFFM-IntFun2nFFM)/(-4);


{ComplexExpand[Re[
eqnLHSM[omegaR+I omegaI,kR+I kI]
]],
ComplexExpand[Im[
eqnLHSM[omegaR+I omegaI,kR+I kI]
]]
}


]



FindRoot[
SpectrumOmegaKMAAEqnLHS[0.4,0,kreal,kimag,spectFun],
{kreal,0.1},{kimag,0.1}
]






maalsadata=Table[
{omegareal,
{kreal,kimag}/.FindRoot[
SpectrumOmegaKMAAEqnLHS[omegareal,0,kreal,kimag,spectFun],
{kreal,0.1},{kimag,0.1}
]
},
{omegareal,-4.499,4.499,0.01}
];



Export["maalsadata-fakedata-principalvalue-supernova.csv",Flatten@#&/@maalsadata]
Print["Exported maalsadata-fakedata-principalvalue-supernova.csv"]


SpectrumOmegaKMZApEqnLHS[omegaR_?NumberQ,omegaI_?NumericQ,kR_?NumberQ,kI_?NumberQ,spect_]:=Module[{eqnLHSM,spectM,IntFun0nFFM,IntFun1nFFM,IntFun2nFFM},


spectM=spect;

IntFun0nFFM=NIntegrate[(spectM@u)/(1-(kR+I*kI) u/(omegaR+I*omegaI)),{u,-1,1}];
IntFun1nFFM=NIntegrate[(spectM@u)u/(1-(kR+I*kI) u/(omegaR+I*omegaI)),{u,-1,1}];
IntFun2nFFM=NIntegrate[(spectM[u]u^2)/(1-(kR+I*kI) u/(omegaR+I*omegaI)),{u,-1,1}];


eqnLHSM[omega_,k_]:=omega-((IntFun0nFFM-IntFun2nFFM+\[Sqrt]((IntFun0nFFM+IntFun2nFFM-2IntFun1nFFM)(IntFun0nFFM+IntFun2nFFM+2IntFun1nFFM)))/(-4));



{ComplexExpand[Re[
eqnLHSM[omegaR+I omegaI,kR+I kI]
]],
ComplexExpand[Im[
eqnLHSM[omegaR+I omegaI,kR+I kI]
]]
}


]



SpectrumOmegaKMZAmEqnLHS[omegaR_?NumberQ,omegaI_?NumericQ,kR_?NumberQ,kI_?NumberQ,spect_]:=Module[{eqnLHSM,spectM,IntFun0nFFM,IntFun1nFFM,IntFun2nFFM},


spectM=spect;

IntFun0nFFM=NIntegrate[(spectM@u)/(1-(kR+I*kI) u/(omegaR+I*omegaI)),{u,-1,1}];
IntFun1nFFM=NIntegrate[(spectM@u)u/(1-(kR+I*kI) u/(omegaR+I*omegaI)),{u,-1,1}];
IntFun2nFFM=NIntegrate[(spectM[u]u^2)/(1-(kR+I*kI) u/(omegaR+I*omegaI)),{u,-1,1}];


eqnLHSM[omega_,k_]:=omega-((IntFun0nFFM-IntFun2nFFM-\[Sqrt]((IntFun0nFFM+IntFun2nFFM-2IntFun1nFFM)(IntFun0nFFM+IntFun2nFFM+2IntFun1nFFM)))/(-4));



{ComplexExpand[Re[
eqnLHSM[omegaR+I omegaI,kR+I kI]
]],
ComplexExpand[Im[
eqnLHSM[omegaR+I omegaI,kR+I kI]
]]
}


]



mzaplsadata=Table[
{omegareal,
{kreal,kimag}/.FindRoot[
SpectrumOmegaKMZApEqnLHS[omegareal,0,kreal,kimag,spectFun],
{kreal,0.1},{kimag,0.1}
]
},
{omegareal,-4.491,4.491,0.01}
]//Quiet;



Export["mzaplsadata-fakedata-principalvalue-supernova.csv",Flatten@#&/@mzaplsadata]
Print["Exported mzaplsadata-fakedata-principalvalue-supernova.csv"]


mzamlsadata=Table[
{omegareal,
{kreal,kimag}/.FindRoot[
SpectrumOmegaKMZAmEqnLHS[omegareal,0,kreal,kimag,spectFun],
{kreal,0.1},{kimag,0.1}
]
},
{omegareal,-4.491,4.491,0.01}
]//Quiet;



Export["mzamlsadata-fakedata-principalvalue-supernova.csv",Flatten@#&/@mzamlsadata]
Print["Exported mzamlsadata-fakedata-principalvalue-supernova.csv"]
