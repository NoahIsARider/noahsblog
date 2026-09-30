# Noah's Blog

A writing-first personal site — research notes, engineering, and the kind of thoughts worth keeping. Authored and maintained by [@NoahIsARider](https://github.com/NoahIsARider).

**Live:** <https://noahisarider.github.io/noahsblog/>

Built with [Hugo](https://gohugo.io/): plain Markdown in, static HTML out. The visual direction is adapted from the minimal [Shibui](https://github.com/ntk148v/shibui) theme (MIT).

## Structure

```text
.
├── archetypes/          # Front-matter defaults for new posts
├── assets/css/          # Styles — main.css plus custom overrides
├── content/             # Site content
│   ├── _index.md        # Home page
│   ├── about.md         # About page
│   └── posts/           # Posts
├── layouts/             # Templates and partials
├── static/              # Static assets (favicon, images)
├── .github/workflows/   # GitHub Pages deployment
├── hugo.toml            # Site configuration
├── build.sh             # Vercel build entry point
└── vercel.json          # Vercel configuration
```

## Writing

Create a post from the repository root:

```bash
hugo new posts/my-new-post.md
```

New posts start from [archetypes/default.md](./archetypes/default.md), with `title`, `date`, `draft`, `description`, `tags`, `toc`, and `showreadingtime` pre-filled. The body goes under `content/posts/`.

## Local preview

With Hugo installed:

```bash
hugo server -D
```

`-D` includes drafts. Without a local Hugo, [build.sh](./build.sh) downloads a pinned release and builds once.

## Deployment

### GitHub Pages

[.github/workflows/gh-page.yml](./.github/workflows/gh-page.yml) builds and publishes on every push to `master` (or `main`), and can also be run manually from the Actions tab. Keep `Settings → Pages → Build and deployment → Source` on **GitHub Actions**.

The workflow pins Hugo and passes the Pages base URL at build time, so `baseURL` in `hugo.toml` only matters for local builds.

### Vercel

[vercel.json](./vercel.json) runs [build.sh](./build.sh) and serves `public/`. Set `HUGO_VERSION` in the project environment variables if you need to override the pinned version.

## Configuration

[`hugo.toml`](./hugo.toml) holds the site settings: `baseURL`, `title`, `params.description`, `params.author`, `params.footerText`, and the `menu.main` entries.

For visual tweaks, start in [assets/css/custom.css](./assets/css/custom.css).

## Credits

Design adapted from the [Shibui](https://github.com/ntk148v/shibui) Hugo theme by [Kien Nguyen-Tuan](https://github.com/ntk148v), MIT licensed — see [LICENSE](./LICENSE).
