# Astro + Starlight + Typst Blog

Astro のドキュメントフレームワーク **Starlight** と、モダンは組版システム **Typst** を組み合わせたブログ/ドキュメントサイトです。

## 🚀 特徴

- **Typst 直接統合**: `src/content/docs/` 内の `.typ` ファイルを直接ブログ記事として公開できます。
- **高品質なレンダリング**: Typst の強力な組版機能を活用し、数式やレイアウトを忠実に再現した SVG 出力を行います（テキスト選択も可能）。
- **MDX 数式サポート**: 既存の `.mdx` または `.md` ファイル内で、`$` や `$$` を使った標準的な数式記法を Typst エンジンで描画できます。
- **CeTZ による図式描画**: Typst の強力な描画ライブラリ **CeTZ 0.3.2** を標準サポート。複雑な幾何学図形やグラフ、ダイアグラムをコードで美しく描画できます。
- **自動サイドバー**: フォルダにファイルを追加するだけで、Starlight のサイドバーに自動的に反映されます。

## 🛠 セットアップ

```bash
# 依存関係のインストール
npm install

# 開発サーバーの起動
npm run dev
```

## 📝 記事の書き方

### 1. Typst ファイル (`.typ`) で書く
`src/content/docs/blog/` 内に `.typ` ファイルを作成します。

```typst
#metadata((
  title: "記事のタイトル",
  description: "記事の説明文"
)) <frontmatter>

#set text(font: "Noto Sans CJK JP", size: 11pt)
#set par(leading: 1em, spacing: 2em, justify: true)

= 見出し
Typst の数式記法がそのまま使えます。
$ integral_a^b f(x) dif x $

== CeTZ による図式の例
#import "../../../../libs/cetz/src/lib.typ" as cetz
#cetz.canvas({
  import cetz.draw: *
  circle((0,0), radius: 1, fill: blue.lighten(80%), stroke: blue)
})
```

### 2. MDX ファイル (`.mdx`) で書く
`.mdx` ファイル内でも、`$$` で囲むことで Typst 記法や CeTZ を使用できます。

```mdx
## 数式
$$
E = m c^2
$$

## CeTZ 図形
$$
#import "/libs/cetz/src/lib.typ" as cetz
#cetz.canvas({
  import cetz.draw: *
  line((0,0), (2,2), stroke: red)
  circle((1,1), radius: 0.5)
})
$$
```
標準的な Markdown 記法に加え、Typst レンダリングによる数式が使えます。

```mdx
---
title: MDXでの数式
description: 標準的な数式記法のテスト
---

インライン数式: $E = mc^2$

ブロック数式:
$$
integral_0^infinity e^(-x^2) dif x = sqrt(pi)/2
$$
```

### 3. 🔄 現在の開発ワークフロー
この環境では、目的に応じて以下の2つのスタイルを自由に選択・併用できます。

1. **純粋なTypst派 (`.typ`)**: Typst の強力なレイアウト機能や独自スクリプトをフル活用して、一貫した組版のドキュメントを作成できます。
2. **MDX派 (`.mdx`, `.md`)**: 慣れ親しんだ Markdown で書きつつ、数式や図式を記述したい場所で `$$` ブロックを使用します。この環境では `$$` 内に直接 Typst コードや CeTZ の描画コードを記述でき、最も安定して柔軟な執筆が可能です。

---

## ⚙️ 開発環境の設定詳細

### 主なパッケージ
- `astro-typst`: Astro で Typst を扱うための統合ツール。
- `remark-math`: Markdown 内の数式記法を解析。
- `@myriaddreamin/rehype-typst`: 解析された数式を Typst エンジンで描画。

### カスタマイズ内容
- **`src/content.config.ts`**: Starlight の `docsLoader` をカスタマイズし、`.typ` 拡張子をコンテンツコレクションとして認識するように変更。
- **`astro.config.mjs`**: 
    - `target: (id) => "svg"` 設定により、数式を確実に描画しつつアクセシビリティを維持。
    - `markdown.rehypePlugins` に `rehypeTypst` を導入し、MDX と Typst の数式表示を統一。

## 👀 詳細ドキュメント
- [Starlight Docs](https://starlight.astro.build/)
- [Typst Documentation](https://typst.app/docs/)
- [astro-typst GitHub](https://github.com/OverflowCat/astro-typst)
