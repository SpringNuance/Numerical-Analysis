(* ::Package:: *)

BeginPackage["MCDemo`"]


OneRun::usage="OneRun[M] Take M samples and estimate \[Pi]."
OneVisualRun::usage="OneVisualRun[M] Take M samples, display the image, and estimate \[Pi]."


Begin["`Private`"]


R=Region[Rectangle[{-1,-1},{1,1}]];
IC=Region[Disk[{0,0},1/4]];
base=Graphics[{Transparent,EdgeForm[Black],Rectangle[{-1,-1},{1,1}],Disk[{0,0},1/4]}];


OneRun[M_Integer]:=Block[{mcp,hits,x,estimate},
mcp=RandomReal[{-1,1},{M,2}];
hits=True /. Counts[RegionMember[IC,#]&/@mcp];
hits=If[hits===True,0,hits];
estimate=x /. First@NSolve[(hits/M)==(x/16)/4,x]
]


OneVisualRun[M_Integer]:=Block[{mcp,hits,x,estimate,scatter},
mcp=RandomReal[{-1,1},{M,2}];
hits=True /. Counts[RegionMember[IC,#]&/@mcp];
hits=If[hits===True,0,hits];
estimate=x /. First@NSolve[(hits/M)==(x/16)/4,x];
scatter=Graphics[{PointSize[0.02],Red,Point[mcp]}];
Show[scatter,base,PlotLabel->"Estimate: "<>ToString[estimate]]
]


End[]


EndPackage[]
