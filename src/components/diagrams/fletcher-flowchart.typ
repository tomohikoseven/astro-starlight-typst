#set page(width: auto, height: auto, margin: 0pt)
#import "../../../libs/fletcher/src/exports.typ" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, hexagon

#diagram(
  node-stroke: (paint: rgb("3b82f6"), thickness: 1pt),
  node-fill: rgb("eff6ff"),
  spacing: 4.5em, // ノードの間隔を広げて矢印を十分に長くし、テキストと被らないように調整
  node((0,0), [開始], corner-radius: 4pt),
  // label-sep を設定してエッジの線から少し浮かせ、label-pos で開始ノード寄りにわずかに配置を調整
  edge((0,0), (1,0), "-|>", label: [データ読み込み], label-sep: 6pt, label-pos: 0.45),
  node((1,0), align(center)[条件判定], shape: diamond, fill: rgb("fef9c3"), stroke: (paint: rgb("eab308"), thickness: 1pt)),
  edge((1,0), (2,0), "-|>", label: [適合], label-sep: 5pt),
  node((2,0), [データ処理], shape: hexagon, fill: rgb("dcfce7"), stroke: (paint: rgb("22c55e"), thickness: 1pt)),
  edge((1,0), (1,1), "-|>", label: [不適合], label-sep: 5pt),
  node((1,1), [例外処理], corner-radius: 4pt, fill: rgb("fee2e2"), stroke: (paint: rgb("ef4444"), thickness: 1pt))
)
