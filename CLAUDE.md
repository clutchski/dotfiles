# Dotfiles

Dotfiles repo managed with [dottie](https://github.com/clutchski/dottie). Should generally work on macOS and Linux.

## Adding Config

Put dotfiles in `home/` (without the dot). They get symlinked to `~` with `.` prefix (e.g., `home/vimrc` -> `~/.vimrc`).

## Adding Hooks

Add numbered scripts to `hooks/` (e.g., `07-mytool.sh`). Use hook functions: `pre-link`, `post-link`, `status`. See existing hooks for examples.

## Running

- `dottie run` - run hooks and create symlinks
- `dottie status` - check installation state
- `dottie help` - show all commands
