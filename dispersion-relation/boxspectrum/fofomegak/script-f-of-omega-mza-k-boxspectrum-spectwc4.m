SetDirectory@NotebookDirectory[]
Get["../../../../neupackage/mma/dispersion-relation.wl"]



id = "WC4"


spectWC1={{{-1,-0.3},1},{{-0.3,1},1}};
spectWC2={{{-1,-0.3},0.5},{{-0.3,1},1}};
spectWC3={{{-1,-0.3},0.1},{{-0.3,1},1}};
spectWC4={{{-1,-0.3},0},{{-0.3,1},1}};
spectC1={{{-1,-0.3},-0.1},{{-0.3,1},1}};
spectC2={{{-1,-0.3},-0.5},{{-0.3,1},1}};
spectC3={{{-1,-0.3},-1},{{-0.3,1},1}};
spectC4={{{-1,-0.3},-1.5},{{-0.3,1},1}};
spectC5={{{-1,-0.3},-15},{{-0.3,1},1}};
spectC6={{{-1,-0.3},-0.01},{{-0.3,1},1}};
spectC7={{{-1,-0.3},0.01},{{-0.3,1},1}};
spectWC5={{{0.1,0.3},1},{{0.3,1},1}};

maaLogDPAbs[omega_,spect_,calRange_:{{-1,1},{-1,1}},pltRange_:{Automatic,Automatic,Automatic}]:=Module[{krealRangeM,kimagRangeM},

krealRangeM=calRange[[1]];
kimagRangeM=calRange[[2]];


DensityPlot[
Log@Abs@ConAxialSymOmegaNMAAEqnLHSComplex[omega,kreal+kimag*I,spect],
{kreal,krealRangeM[[1]],krealRangeM[[2]]},
{kimag,kimagRangeM[[1]],kimagRangeM[[2]]},
PlotLegends->Automatic,PlotRange->pltRange,ImageSize->Large,PlotPoints->100,MaxRecursion->7,PlotLabel->"MAA Log(|f(\[Omega]="<>ToString@omega<>",k)|) for spectrum "<>ToString[spect],FrameLabel->{"k.real","k.imag"}
]

];



mzapLogDPAbs[omega_,spect_,calRange_:{{-1,1},{-1,1}},pltRange_:{Automatic,Automatic,Automatic}]:=Module[{krealRangeM,kimagRangeM},

krealRangeM=calRange[[1]];
kimagRangeM=calRange[[2]];


DensityPlot[
Log@Abs@ConAxialSymOmegaNMZApEqnLHSComplex[omega,kreal+kimag*I,spect],
{kreal,krealRangeM[[1]],krealRangeM[[2]]},
{kimag,kimagRangeM[[1]],kimagRangeM[[2]]},
PlotLegends->Automatic,PlotRange->pltRange,ImageSize->Large,PlotPoints->100,MaxRecursion->7,PlotLabel->"MZA+ Log(|f(\[Omega]="<>ToString@omega<>",k)|) for spectrum "<>ToString[spect],FrameLabel->{"k.real","k.imag"}
]

];

mzamLogDPAbs[omega_,spect_,calRange_:{{-1,1},{-1,1}},pltRange_:{Automatic,Automatic,Automatic}]:=Module[{krealRangeM,kimagRangeM},

krealRangeM=calRange[[1]];
kimagRangeM=calRange[[2]];


DensityPlot[
Log@Abs@ConAxialSymOmegaNMZAmEqnLHSComplex[omega,kreal+kimag*I,spect],
{kreal,krealRangeM[[1]],krealRangeM[[2]]},
{kimag,kimagRangeM[[1]],kimagRangeM[[2]]},
PlotLegends->Automatic,PlotRange->pltRange,ImageSize->Large,PlotPoints->100,MaxRecursion->7,PlotLabel->"MZA- Log(|f(\[Omega]="<>ToString@omega<>",k)|) for spectrum "<>ToString[spect],FrameLabel->{"k.real","k.imag"}
]

];



mzaPlt1 = Grid@{{
mzapLogDPAbs[0.1,Symbol["spect"<>id],{{-2,2},{-2,2}},{Automatic,Automatic,{-10,1}}],
mzamLogDPAbs[0.1,Symbol["spect"<>id],{{-2,2},{-2,2}},{Automatic,Automatic,{-10,1}}]
}};

mzaPlt2 = Grid@{{
mzapLogDPAbs[-0.1,Symbol["spect"<>id],{{-2,2},{-2,2}},{Automatic,Automatic,{-10,1}}],
mzamLogDPAbs[-0.1,Symbol["spect"<>id],{{-2,2},{-2,2}},{Automatic,Automatic,{-10,1}}]
}};

mzaPlt3 = Grid@{{
mzapLogDPAbs[1,Symbol["spect"<>id],{{-10,10},{-2,2}},{Automatic,Automatic,{-10,1}}],
mzamLogDPAbs[1,Symbol["spect"<>id],{{-10,10},{-2,2}},{Automatic,Automatic,{-10,1}}]
}};

mzaPlt4 = Grid@{{
mzapLogDPAbs[-1,Symbol["spect"<>id],{{-10,10},{-2,2}},{Automatic,Automatic,{-10,1}}],
mzamLogDPAbs[-1,Symbol["spect"<>id],{{-10,10},{-2,2}},{Automatic,Automatic,{-10,1}}]
}};

Print["Calculated Images"]

Export["export/f-of-omega-0.1-k-mza-boxspectrum-spect"<>id<>".png",mzaPlt1]
Export["export/f-of-omega-m0.1-k-mza-boxspectrum-spect"<>id<>".png",mzaPlt2]
Export["export/f-of-omega-1-k-mza-boxspectrum-spect"<>id<>".png",mzaPlt3]
Export["export/f-of-omega-m1-k-mza-boxspectrum-spect"<>id<>".png",mzaPlt4]

Print["Exported Images"]
