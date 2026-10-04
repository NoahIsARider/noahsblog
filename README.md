# Noah's Blog

A writing-first personal site — research notes, engineering, and the kind of thoughts worth keeping. Authored and maintained by [@NoahIsARider](https://github.com/NoahIsARider).

**Live:** <https://noahisarider.github.io/noahsblog/>

**Feed:** <https://noahsblog.pages.dev/feed.xml> (RSS 2.0 — subscribe in any reader; `/posts/feed.xml` and `/tags/<tag>/feed.xml` exist too)

Every page carries the `<link rel="alternate" type="application/rss+xml">` declaration, so pasting the site URL into a reader works as well.

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

The workflow pins Hugo and passes the Pages base URL at build time, so the Pages build always gets its own absolute URLs.

### Cloudflare Pages

Connected to the same `master` branch; builds `hugo --gc --minify` and serves `public/` at <https://noahsblog.pages.dev>. [build.sh](./build.sh) picks up `CF_PAGES_URL` for the base URL, so its feed and sitemap point at `pages.dev` instead of another host.

### Vercel

[vercel.json](./vercel.json) runs [build.sh](./build.sh) and serves `public/`. Set `HUGO_VERSION` in the project environment variables if you need to override the pinned version. `build.sh` reads `VERCEL_URL` so the Vercel build's absolute URLs stay on `*.vercel.app`.

## Configuration

[`hugo.toml`](./hugo.toml) holds the site settings: `baseURL`, `title`, `params.description`, `params.author`, `params.footerText`, and the `menu.main` entries.

For visual tweaks, start in [assets/css/custom.css](./assets/css/custom.css).

## Credits

Design adapted from the [Shibui](https://github.com/ntk148v/shibui) Hugo theme by [Kien Nguyen-Tuan](https://github.com/ntk148v), MIT licensed — see [LICENSE](./LICENSE).
