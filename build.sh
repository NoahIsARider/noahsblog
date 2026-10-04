#!/usr/bin/env bash
set -euo pipefail

HUGO_VERSION="${HUGO_VERSION:-0.161.0}"
HUGO_FLAVOR="${HUGO_FLAVOR:-extended}"
HUGO_BIN_DIR="${HUGO_BIN_DIR:-/tmp/hugo-bin}"

if ! command -v hugo >/dev/null 2>&1; then
  mkdir -p "${HUGO_BIN_DIR}"
  ARCHIVE="hugo_${HUGO_FLAVOR}_${HUGO_VERSION}_linux-amd64.tar.gz"
  URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${ARCHIVE}"

  echo "Installing Hugo ${HUGO_VERSION} (${HUGO_FLAVOR})"
  curl -fsSL "${URL}" -o "/tmp/${ARCHIVE}"
  tar -xzf "/tmp/${ARCHIVE}" -C "${HUGO_BIN_DIR}"
  export PATH="${HUGO_BIN_DIR}:$PATH"
fi

echo "Using $(hugo version)"

# Every host serves the same tree, so give each one its own absolute URLs — otherwise
# the feed, sitemap and canonical links point at another host (or at the placeholder
# baseURL in hugo.toml). Cloudflare Pages exposes CF_PAGES_URL, Vercel exposes
# VERCEL_URL; anything else falls back to hugo.toml.
BASE_URL="${BASE_URL:-}"
if [ -n "${CF_PAGES_URL:-}" ]; then
  BASE_URL="${CF_PAGES_URL%/}/"
fi
if [ -n "${VERCEL_URL:-}" ]; then
  BASE_URL="https://${VERCEL_URL%/}/"
fi

if [ -n "$BASE_URL" ]; then
  echo "baseURL: $BASE_URL"
  hugo --gc --minify --baseURL "$BASE_URL"
else
  hugo --gc --minify
fi
