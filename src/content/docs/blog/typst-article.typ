#import "../../../libs/template.typ": project
#show: project

#metadata((
  title: "Typstで書くブログ記事（直接レンダリング）",
  description: "Typstファイルを直接Starlightの記事として使用する検証です"
))<frontmatter>

// 以下、コンテンツ

= Typstで書くブログ記事

== はじめに

このファイルは `.typ` 拡張子ですが、Starlightのサイドバーに自動的に表示されるように設定しました。

== 埋め込まれた数式

ここに数式を表示します：

$ x^2 + y^2 = r^2 $

さらに、その下にもう一つ数式を追加します：

$ integral_a^b f(x) dif x $

== メタデータ設定

Typstファイル内でStarlightのフロントマター（タイトルなど）を設定するには、以下のように `metadata` と `<frontmatter>` ラベルを使用します：

```typst
#metadata((
  title: "記事のタイトル",
  description: "説明文"
))<frontmatter>
```

== CeTZの利用例

#import "../../../../libs/cetz/src/lib.typ" as cetz

#cetz.canvas({
  import cetz.draw: *
  circle((0,0), radius: 1, fill: blue.lighten(80%), stroke: blue)
  line((-1,0), (1,0), stroke: gray)
  line((0,-1), (0,1), stroke: gray)
  content((0.8, 0.8), [CeTZ])
})

== まとめ
これで、Markdownを介さずに直接Typstで執筆できるようになりました。
