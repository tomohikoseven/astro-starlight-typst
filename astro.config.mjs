// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import { typst } from 'astro-typst';
import remarkMath from 'remark-math';
import rehypeTypst from '@myriaddreamin/rehype-typst';

// https://astro.build/config
export default defineConfig({
	site: 'https://astrotypst.ifdef.jp/',
	markdown: {
		remarkPlugins: [remarkMath],
		rehypePlugins: [rehypeTypst],
	},
	integrations: [
		typst({
			root: ".",
			target: (id) => "svg"
		}),
		starlight({
			title: 'Typst Blog',
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
