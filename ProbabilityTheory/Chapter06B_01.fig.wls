#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]

SetDirectory[NotebookDirectory[]];

Needs["MaTeX`"];

nbFileName="Chapter06B_01.fig.wls";
nbPDFName="build/"<>StringReplace[nbFileName,"wls"->"pdf"];
nbPDFNameList=(StringReplace[nbPDFName,".fig"->#<>".fig"]&)/@Alphabet[];
Export[nbPDFName,""]

Chi=Function[{y,n},1/(2^(n/2) Gamma[n/2]) y^(n/2-1) Exp[-y/2]]
Stu=Function[{t,n},Gamma[(n+1)/2]/(Sqrt[Pi n]Gamma[n/2]) (1+t^2/n)^(-(n+1)/2)]

fig1=Plot[
Evaluate[Table[Chi[y,n],{n,{1,2,3,4,5,6,7,8}}]],{y,0,15},
PlotRange->{-0.03,0.43},
ImageSize->500,
Frame->True,
FrameStyle->BlackFrame,
PlotStyle->ColorData[10],
BaseStyle->{FontFamily->"Latin Modern Roman",FontSize->8},
PlotLegends->LineLegend[
{MaTeX["1"],MaTeX["2"],MaTeX["3"],MaTeX["4"],MaTeX["5"],MaTeX["6"],MaTeX["7"],MaTeX["8"]},
LegendLabel->MaTeX["n"],
LegendFunction->(Framed[#,RoundingRadius->1,FrameStyle->{Thin}]&),
LegendMargins->1],
GridLines->Automatic
]

fig2=Plot[
Evaluate[Table[Stu[t,n],{n,{1,2,4,8,16,2^10}}]],{t,-6,6},
PlotRange->{-0.03,0.43},
ImageSize->500,
Frame->True,
FrameStyle->BlackFrame,
PlotStyle->ColorData[10],
BaseStyle->{FontFamily->"Latin Modern Roman",FontSize->8},
PlotLegends->LineLegend[
{MaTeX["1"],MaTeX["2"],MaTeX["4"],MaTeX["8"],MaTeX["16"],MaTeX["\\infty"]},
LegendLabel->MaTeX["n"],
LegendFunction->(Framed[#,RoundingRadius->1,FrameStyle->{Thin}]&),
LegendMargins->1],
GridLines->Automatic
]

fig={fig1,fig2}

figWithName=Transpose[{fig,nbPDFNameList[[1;;Length[fig]]]}];
ReleaseHold[(Hold[Export[#[[2]],#[[1]],ImageResolution->2000]]&)/@figWithName]
