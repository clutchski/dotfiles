# dotfiles

Managed with [dottie](https://github.com/clutchski/dottie).

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/clutchski/dotfiles/main/scripts/bootstrap.sh | bash
```

## Manual Setup

```bash
git clone https://github.com/clutchski/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
dottie run
```

## Commands

- `dottie status` - Show linked/unlinked files
- `dottie link` - Create symlinks
- `dottie link -n` - Dry-run preview
- `dottie install` - Install dependencies from Brewfile
