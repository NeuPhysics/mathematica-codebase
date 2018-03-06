SetDirectory@NotebookDirectory[]

img = Plot[Sin[x],{x,-1,1}];
UseFrontEnd[Export["img.png",img] ]
