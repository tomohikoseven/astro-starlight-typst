# Astro + Starlight + Typst Blog

Astro のドキュメントフレームワーク **Starlight** と、モダンは組版システム **Typst** を組み合わせたブログ/ドキュメントサイトです。

## 🚀 特徴

- **Typst 直接統合**: `src/content/docs/` 内の `.typ` ファイルを直接ブログ記事として公開できます。
- **高品質なレンダリング**: Typst の強力な組版機能を活用し、数式やレイアウトを忠実に再現した SVG 出力を行います（テキスト選択も可能）。
- **MDX 数式サポート**: 既存の `.mdx` または `.md` ファイル内で、`$` や `$$` を使った標準的な数式記法を Typst エンジンで描画できます。
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
```

### 2. MDX ファイル (`.mdx`) で書く
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
この環境では、目的に応じて以下の3つのスタイルを自由に選択・併用できます。

1. **純粋なTypst派**: `.typ` ファイルを直接作成。Typst の強力なレイアウト機能や独自スクリプトをフル活用して執筆できます。
2. **MDX派**: 慣れ親しんだ Markdown (`.md`, `.mdx`) で書きつつ、数式部分 (`$`, `$$`) だけを Typst の美しいレンダリングエンジンに任せることができます。
3. **ハイブリッド**: 必要に応じて Astro コンポーネント (`<Typst />`) を使い、Markdown 記事の中に特定の Typst コード断片を埋め込むことができます。

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
