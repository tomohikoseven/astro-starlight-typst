#set page(width: auto, height: auto, margin: 0pt)
#import "../../../libs/fletcher/src/exports.typ" as fletcher: diagram, node, edge
#import "../../../libs/physica/physica.typ": *

#diagram(
  cell-size: 26mm,
  
  // 初期状態ベクトル（Physicaのketを使用）
  node((0,0), ket($psi_i$), name: <state_i>, fill: rgb("eff6ff"), stroke: (paint: rgb("3b82f6"), thickness: 1.5pt)),
  
  // 最終状態ベクトル
  node((2,0), ket($psi_f$), name: <state_f>, fill: rgb("f0fdf4"), stroke: (paint: rgb("22c55e"), thickness: 1.5pt)),
  
  // 順方向：ハミルトニアンによる遷移（Physicaのexpvalを使用）
  edge(<state_i>, <state_f>, "-|>", label: expval($hat(H)_"int"$), label-pos: 0.5, bend: 30deg, stroke: (paint: rgb("2563eb"), thickness: 1.2pt)),
  
  // 逆方向：摂動による遷移（Physicaのbraketを使用）
  edge(<state_f>, <state_i>, "-|>", label: braket($psi_i$, $hat(V)$, $psi_f$), label-pos: 0.5, bend: 30deg, stroke: (paint: rgb("dc2626"), thickness: 1.2pt, dash: "dashed"))
)
