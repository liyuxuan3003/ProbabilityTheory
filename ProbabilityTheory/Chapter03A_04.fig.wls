#!/usr/bin/env wolframscript
 (* ::Package:: *)


ClearAll["Global`*"]

SetDirectory[NotebookDirectory[]];

Needs["MaTeX`"];
SetDirectory[NotebookDirectory[]];
Unprotect[MaTeX`Developer`Texify];
MaTeX`Developer`Texify[TextCell[code_,___]]:=ToString[code]

nbFileName="Chapter03A_04.fig.wls";
nbPDFName="build/"<>StringReplace[nbFileName,"wls"->"pdf"];
nbPDFNameList=(StringReplace[nbPDFName,".fig"->#<>".fig"]&)/@Alphabet[];
Export[nbPDFName,""]

fig1=Flatten@Table[Plot3D[1/(2 Pi Subscript[\[Sigma], 1] Subscript[\[Sigma], 2]Sqrt[1-\[Rho]^2]) Exp[-1/(2(1-\[Rho]^2)) ((x-Subscript[\[Mu], 1])^2/Subscript[\[Sigma], 1]^2-2\[Rho] ((x-Subscript[\[Mu], 1])(y-Subscript[\[Mu], 2]))/(Subscript[\[Sigma], 1] Subscript[\[Sigma], 2])+(y-Subscript[\[Mu], 2])^2/Subscript[\[Sigma], 2]^2)],
{x,-2,2},
{y,-2,2},
PlotRange->{0,1},
PlotPoints->100,
BaseStyle->{FontFamily->"Latin Modern Roman",FontSize->8},
ColorFunction->ColorData["DarkRainbow"],
ColorFunctionScaling->None,
PlotLegends->BarLegend[{Automatic,{0.0,1.0}}],
PerformanceGoal->"Quality",
ViewPoint->{80,-100,60}],
{Subscript[\[Sigma], 1],{0.4}},
{Subscript[\[Sigma], 2],{0.4}},
{Subscript[\[Mu], 1],{0}},
{Subscript[\[Mu], 2],{0}},
{\[Rho],{0}}]

fig2=Flatten@Table[ContourPlot[1/(2 Pi Subscript[\[Sigma], 1] Subscript[\[Sigma], 2]Sqrt[1-\[Rho]^2]) Exp[-1/(2(1-\[Rho]^2)) ((x-Subscript[\[Mu], 1])^2/Subscript[\[Sigma], 1]^2-2\[Rho] ((x-Subscript[\[Mu], 1])(y-Subscript[\[Mu], 2]))/(Subscript[\[Sigma], 1] Subscript[\[Sigma], 2])+(y-Subscript[\[Mu], 2])^2/Subscript[\[Sigma], 2]^2)],
{x,-2,2},
{y,-2,2},
PlotRange->{0,1},
PlotPoints->100,
Contours->30,
ColorFunction->ColorData["DarkRainbow"],
ColorFunctionScaling->None,
PerformanceGoal->"Quality"],
{Subscript[\[Sigma], 1],{0.4,0.5,0.6,0.7}},
{Subscript[\[Sigma], 2],{0.4}},
{Subscript[\[Mu], 1],{0}},
{Subscript[\[Mu], 2],{0}},
{\[Rho],{0}}]

fig3=Flatten@Table[ContourPlot[1/(2 Pi Subscript[\[Sigma], 1] Subscript[\[Sigma], 2]Sqrt[1-\[Rho]^2]) Exp[-1/(2(1-\[Rho]^2)) ((x-Subscript[\[Mu], 1])^2/Subscript[\[Sigma], 1]^2-2\[Rho] ((x-Subscript[\[Mu], 1])(y-Subscript[\[Mu], 2]))/(Subscript[\[Sigma], 1] Subscript[\[Sigma], 2])+(y-Subscript[\[Mu], 2])^2/Subscript[\[Sigma], 2]^2)],
{x,-2,2},
{y,-2,2},
PlotRange->{0,1},
PlotPoints->100,
Contours->30,
ColorFunction->ColorData["DarkRainbow"],
ColorFunctionScaling->None,
PerformanceGoal->"Quality"],
{Subscript[\[Sigma], 1],{0.5}},
{Subscript[\[Sigma], 2],{0.5}},
{Subscript[\[Mu], 1],{0}},
{Subscript[\[Mu], 2],{0}},
{\[Rho],{0,0.25,0.50,0.75}}]

fig=Join[{fig1[[1]][[1]],fig1[[1]][[2]][[1]]},fig2,fig3]

figWithName=Transpose[{fig,nbPDFNameList[[1;;Length[fig]]]}];
ReleaseHold[(Hold[Export[#[[2]],#[[1]],ImageResolution->2000]]&)/@figWithName]
