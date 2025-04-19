#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]

SetDirectory[NotebookDirectory[]];

Needs["MaTeX`"];
SetDirectory[NotebookDirectory[]];
Unprotect[MaTeX`Developer`Texify];
MaTeX`Developer`Texify[TextCell[code_,___]]:=ToString[code]

nbFileName="Chapter02B_01.fig.wls";
nbPDFName="build/"<>StringReplace[nbFileName,"wls"->"pdf"];
nbPDFNameList=(StringReplace[nbPDFName,".fig"->#<>".fig"]&)/@Alphabet[];
Export[nbPDFName,""]

BFunc[k_,p_,n_]:=Binomial[n,k]p^k (1-p)^(n-k)
PFunc[k_,\[Lambda]_]:=(\[Lambda]^k Exp[-\[Lambda]])/k!
ExpFunc[x_,\[Theta]_]:=1/\[Theta] Exp[-(x/\[Theta])]
ExpFuncF[x_,\[Theta]_]:=1-Exp[-(x/\[Theta])]
GauFunc[x_,\[Mu]_,\[Sigma]_]:=1/(Sqrt[2Pi]\[Sigma]) Exp[-((x-\[Mu])^2/(2\[Sigma]^2))]
GauFuncF[x_,\[Mu]_,\[Sigma]_]:=1/2 (1+Erf[(x-\[Mu])/(\[Sigma] Sqrt[2])])

(* BFunc *)
fig1=DiscretePlot[
{BFunc[k,0.1,50],BFunc[k,0.3,50],BFunc[k,0.5,50],BFunc[k,0.7,50],BFunc[k,0.9,50]},{k,0,50},
Frame->True,
BaseStyle->{FontFamily->"Latin Modern Roman",FontSize->8},
GridLines->Automatic,
PlotRange->{0,0.2},
PlotLegends->{MaTeX["p=0.1"],MaTeX["p=0.3"],MaTeX["p=0.5"],MaTeX["p=0.7"],MaTeX["p=0.9"]}
]

(* PFunc *)
fig2=DiscretePlot[
{PFunc[k,5],PFunc[k,10],PFunc[k,20],PFunc[k,30],PFunc[k,40]},{k,0,50},
Frame->True,
BaseStyle->{FontFamily->"Latin Modern Roman",FontSize->8},
GridLines->Automatic,
PlotRange->{0,0.2},
PlotLegends->{MaTeX["\\lambda=5"],MaTeX["\\lambda=10"],MaTeX["\\lambda=20"],MaTeX["\\lambda=30"],MaTeX["\\lambda=40"]}
]

(* ExpFunc *)
fig3=Plot[{ExpFunc[x,1],ExpFunc[x,2],ExpFunc[x,4],ExpFunc[x,8]},{x,0,10},
Frame->True,
BaseStyle->{FontFamily->"Latin Modern Roman",FontSize->8},
PlotRange->{-0.05,1.05},
GridLines->Automatic,
PlotStyle->ColorData[10],
PlotLegends->{MaTeX["\\theta=1.0"],MaTeX["\\theta=2.0"],MaTeX["\\theta=4.0"],MaTeX["\\theta=8.0"]}
]

(* ExpFuncF *)
fig4=Plot[{ExpFuncF[x,1],ExpFuncF[x,2],ExpFuncF[x,4],ExpFuncF[x,8]},{x,0,10},
Frame->True,
BaseStyle->{FontFamily->"Latin Modern Roman",FontSize->8},
PlotRange->{-0.05,1.05},
GridLines->Automatic,
PlotStyle->ColorData[10],
PlotLegends->{MaTeX["\\theta=1.0"],MaTeX["\\theta=2.0"],MaTeX["\\theta=4.0"],MaTeX["\\theta=8.0"]}
]

(* GauFunc *)
fig5=Plot[{GauFunc[x,5,0.5],GauFunc[x,5,1],GauFunc[x,5,2],GauFunc[x,5,4]},{x,0,10},
Frame->True,
BaseStyle->{FontFamily->"Latin Modern Roman",FontSize->8},
PlotRange->{-0.05,1.05},
GridLines->Automatic,
PlotStyle->ColorData[24],
PlotLegends->{MaTeX["\\sigma=0.5"],MaTeX["\\sigma=1.0"],MaTeX["\\sigma=2.0"],MaTeX["\\sigma=4.0"]}
]

(* GauFuncF *)
fig6=Plot[{GauFuncF[x,5,0.5],GauFuncF[x,5,1],GauFuncF[x,5,2],GauFuncF[x,5,4]},{x,0,10},
Frame->True,
BaseStyle->{FontFamily->"Latin Modern Roman",FontSize->8},
PlotRange->{-0.05,1.05},
GridLines->Automatic,
PlotStyle->ColorData[24],
PlotLegends->{MaTeX["\\sigma=0.5"],MaTeX["\\sigma=1.0"],MaTeX["\\sigma=2.0"],MaTeX["\\sigma=4.0"]}
]

(* Erf *)
fig7=Plot[Erf[x],{x,-4,4},
Frame->True,
BaseStyle->{FontFamily->"Latin Modern Roman",FontSize->8},
PlotRange->{-1.05,1.05},
GridLines->Automatic,
PlotStyle->Black,
PlotLegends->{MaTeX["\\text{erf}(x)"]}
]

fig={fig1,fig2,fig3,fig4,fig5,fig6,fig7}

figWithName=Transpose[{fig,nbPDFNameList[[1;;Length[fig]]]}];
ReleaseHold[(Hold[Export[#[[2]],#[[1]],ImageResolution->2000]]&)/@figWithName]
