#set page(width: auto, height: auto, margin: 0pt)
#import "@preview/cetz:0.5.2" as cetz

#cetz.canvas({
  import cetz.draw: *
  
  // グリッド
  grid((-2,-2), (2,2), step: 0.5, stroke: rgb("e5e7eb"))
  
  // 座標軸
  line((-2.2, 0), (2.2, 0), mark: (end: ">"), stroke: 0.75pt + rgb("4b5563"))
  line((0, -2.2), (0, 2.2), mark: (end: ">"), stroke: 0.75pt + rgb("4b5563"))
  
  // 軸ラベル
  content((2.4, 0), [x], anchor: "west")
  content((0, 2.4), [y], anchor: "south")
  
  // 単位円
  circle((0,0), radius: 1, fill: rgb("eff6ff").lighten(30%), stroke: 1.5pt + rgb("3b82f6"))
  
  // ベクトル
  line((0,0), (0.707, 0.707), stroke: 1.5pt + rgb("ef4444"), mark: (end: ">"))
  
  // 角度を示す弧
  arc((0,0), start: 0deg, delta: 45deg, radius: 0.3, stroke: 1pt + rgb("10b981"))
  
  // テキストラベル
  content((0.4, 0.25), [#text(fill: rgb("10b981"))[theta]], anchor: "south")
  content((0.9, 0.9), [#text(fill: rgb("ef4444"))[bold(v) = (cos theta, sin theta)]], anchor: "south-west")
})
