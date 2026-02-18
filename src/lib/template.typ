#let project(doc) = {
  set text(font: "Noto Sans CJK JP", size: 11pt)
  // page(height: auto) avoids unnecessary page breaks for web display
  set page(margin: 1cm, height: auto)
  set par(leading: 1em, spacing: 2em, justify: true)
  show heading: set block(above: 1.4em, below: 1em)
  doc
}
