#set page(width: auto, height: auto, margin: 0pt)
#import "../../../libs/fletcher/src/exports.typ" as fletcher: diagram, node, edge

#diagram(cell-size: 17mm, $
  G edge(f, ->) edge("d", pi, ->>) & im(f) \
  G slash ker(f) edge("ur", tilde(f), "hook-->")
$)
