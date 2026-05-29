// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import { typst } from 'astro-typst';
import remarkMath from 'remark-math';
import remarkGfm from 'remark-gfm';
import remarkSmartypants from 'remark-smartypants';
// @ts-ignore
import rehypeTypst from '@myriaddreamin/rehype-typst';

// https://astro.build/config
export default defineConfig({
	site: 'https://astrotypst.ifdef.jp/',
	markdown: {
		remarkPlugins: [remarkGfm, remarkSmartypants, remarkMath],
		rehypePlugins: [rehypeTypst],
	},
	integrations: [
		typst({
			// @ts-expect-error
			root: ".",
			target: () => "svg"
		}),
		starlight({
			title: 'Typst Blog',
			customCss: ['./src/styles/custom.css'],
			social: [{ icon: 'github', label: 'GitHub', href: 'https://github.com/withastro/starlight' }],
			sidebar: [
				{
					label: 'ブログ',
					items: [{ autogenerate: { directory: 'blog' } }],
				},
				{
					label: 'Guides',
					items: [
						{ label: 'Example Guide', slug: 'guides/example' },
					],
				},
				{
					label: 'Reference',
					items: [{ autogenerate: { directory: 'reference' } }],
				},
			],
		}),
	],
});
