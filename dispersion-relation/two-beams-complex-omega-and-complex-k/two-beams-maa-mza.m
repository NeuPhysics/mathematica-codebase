(* ::Package:: *)

SetDirectory@NotebookDirectory[]

Get["../../../neupackage/mma/dispersion-relation.wl"]

rangeOmega ={{-4,4,0.01},{-10,10,0.01}};

(* Begin Define the spectra *)
spectDBWC1={{1,-0.6},{1,0.6}}
spectDBWC2={{0.5,-0.6},{1,0.6}}
spectDBWC3={{0.1,-0.6},{1,0.6}}

spectDBC1={{-1,-0.6},{1,0.6}}
spectDBC2={{-0.5,-0.6},{1,0.6}}
spectDBC3={{-0.1,-0.6},{1,0.6}}
(* End of Define the spectra *)



{lsaMAADataRawDBWC1,lsaMAADataRawDBWC2,lsaMAADataRawDBWC3,lsaMAADataRawDBC1,lsaMAADataRawDBC2,lsaMAADataRawDBC3}=ParallelTable[ Flatten[ LSAMAADataRawDB[spectra,rangeOmega], 1],
{spectra,{spectDBWC1,spectDBWC2,spectDBWC3,spectDBC1,spectDBC2,spectDBC3}}
]//Quiet;

Table[
Export["export/lsaMAADataRawDB"<>spectraid<>".csv",Symbol["lsaMAADataRawDB"<>spectraid]],
{spectraid,{"WC1","WC2","WC3","C1","C2","C3"}}
];

Print["Exported MAA csv data"]


(* MZAp *)

{lsaMZApDataRawDBWC1,lsaMZApDataRawDBWC2,lsaMZApDataRawDBWC3,lsaMZApDataRawDBC1,lsaMZApDataRawDBC2,lsaMZApDataRawDBC3}=ParallelTable[
Flatten[ LSAMZApDataRawDB[spectra, rangeOmega ], 1],
{spectra,{spectDBWC1,spectDBWC2,spectDBWC3,spectDBC1,spectDBC2,spectDBC3}}
]//Quiet;

Table[
Export["export/lsaMZApDataRawDB"<>spectraid<>".csv",Symbol["lsaMZApDataRawDB"<>spectraid]],
{spectraid,{"WC1","WC2","WC3","C1","C2","C3"}}
];

Print["Exported MZAp csv data"]



(* MZAm *)

{lsaMZAmDataRawDBWC1,lsaMZAmDataRawDBWC2,lsaMZAmDataRawDBWC3,lsaMZAmDataRawDBC1,lsaMZAmDataRawDBC2,lsaMZAmDataRawDBC3}
=
ParallelTable[
Flatten[ LSAMZAmDataRawDB[spectra, rangeOmega ], 1],
{spectra,{spectDBWC1,spectDBWC2,spectDBWC3,spectDBC1,spectDBC2,spectDBC3}}
]//Quiet;

Table[
Export["export/lsaMZAmDataRawDB"<>spectraid<>".csv",Symbol["lsaMZAmDataRawDB"<>spectraid]],
{spectraid,{"WC1","WC2","WC3","C1","C2","C3"}}
];

Print["Exported MZAm csv data"]
