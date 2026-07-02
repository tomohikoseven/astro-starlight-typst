#set page(width: auto, height: auto, margin: 0pt)
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#diagram(cell-size: 17mm, $
  G edge(f, ->) edge("d", pi, ->>) & im(f) \
  G slash ker(f) edge("ur", tilde(f), "hook-->")
$)
