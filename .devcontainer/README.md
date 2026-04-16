# VS Code Dev Container — Innovise Site

A pre-configured development environment for the Innovise marketing site.

Key features of this container:

- **Node.js 22**: Pre-installed and version-pinned via devcontainer features.
- **Astro**: Run `npm run dev` to start the dev server at [http://localhost:4321](http://localhost:4321).
- **Extensions**: Astro, Tailwind CSS IntelliSense, and Prettier are pre-installed.
- **Port Forwarding**: Port 4321 (Astro dev server) and 24678 (Vite HMR) are automatically forwarded.
- **Persistent Bash History**: Shell history is preserved across container rebuilds.

## Personalisation

Two files are gitignored and let you layer on personal preferences without touching shared config:

| File | Purpose |
|---|---|
| `.devcontainer/extensions.local` | List your personal VS Code extension IDs, one per line |
| `.devcontainer/setup.local.sh` | Shell script run at container start — install zsh, set git config, add aliases, etc. |

Copy the `.example` files to get started:

```bash
cp .devcontainer/extensions.local.example .devcontainer/extensions.local
cp .devcontainer/setup.local.sh.example   .devcontainer/setup.local.sh
```
