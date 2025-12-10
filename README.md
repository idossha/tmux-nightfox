<div align="center">
    <img src="https://raw.githubusercontent.com/edeneast/nightfox.nvim/main/assets/vscode_logo.png" width="200px" referrerpolicy="no-referrer">
    <h1>Nightfox theme for Tmux</h1>
</div>

Theme with 'fox' flavor for [Tmux][github-tmux], based on [EdenEast's nightfox color scheme][github-nightfox].

<div align="center">
  <a href="https://raw.githubusercontent.com/edeneast/nightfox.nvim/main/assets/carbonfox.png" target="_blank" title="Nightfox themes for Tmux">
    <img src="https://raw.githubusercontent.com/edeneast/nightfox.nvim/main/assets/carbonfox.png"
      title="Nightfox themes for Tmux"
      width="100%"
      height="auto"
      style="max-width: 800px; text-align: center; border-radius: 12px; overflow:hidden;"
      referrerpolicy="no-referrer"
    />
  </a>
</div>

> Screenshot shows carbonfox theme. All 7 nightfox variants are supported.

## Installation

### Install via [TPM][github-tpm] (recommended)

Add plugin at the top list of TPM plugins list in `.tmux.conf` and select desired theme.

```bash
# ~/.tmux.conf

set -g @plugin 'tmux-plugins/tpm' # mandatory
set -g @plugin 'tmux-plugins/tmux-sensible' # optional recommended

set -g @plugin 'tmux-nightfox'
# set desired theme options...
set -g @tmux-nightfox 'nightfox' # or 'carbonfox', 'dawnfox', 'dayfox', 'duskfox', 'nordfox', 'terafox'

# other plugins
...
```

Hit `prefix + I` to fetch the plugin and source it. Your Tmux should be updated with the theme at this point.

## Configuration options

### Theme

- default value: `nightfox`

| Theme name | Description |
| :--------- | :---------- |
| `carbonfox` | Dark theme with carbon colors |
| `dawnfox` | Light theme with dawn colors |
| `dayfox` | Light theme with day colors |
| `duskfox` | Dark theme with dusk colors |
| `nightfox` | Dark theme with night colors |
| `nordfox` | Dark theme with nord colors |
| `terafox` | Dark theme with terra colors |

```bash
set -g @tmux-nightfox 'nightfox' # carbonfox, dawnfox, dayfox, duskfox, nordfox, terafox
```

### Transparent status-bar

- default value: `'false'`
- tmux >= 3.2 (experimental)

```bash
set -g @tmux-nightfox-statusbar-alpha 'true'
```

### Left Status (Section A)

- default value: `'#S'` (session name)

```bash
set -g @tmux-nightfox-left-status-a '#S' # tmux's session name
```

### Right Status (Section X)

- default value: `'%Y-%m-%d'`

This section is customizable for user, and by default contains current date.

```bash
# set date in US notation
set -g @tmux-nightfox-right-status-x '%m/%d/%Y' # e.g.: 01/31/2024
```

```bash
# or set date in EU notation
set -g @tmux-nightfox-right-status-x '%d.%m.%Y' # e.g.: 30.01.2024
```

> [!TIP]
> Some user may have problem with displaying dates in desired format, if this
> case for you try using double percent `%%`

### Right Status (Section Y)

- default value: `'%H:%M'`

This section is customizable for user, and by default contains current time.

```bash
# set US time format
set -g @tmux-nightfox-right-status-y '%I:%M %p' # 09:54 PM
```

### Right Status (Section Z)

- default value: `'#h'` (hostname)

This section is customizable for user, and by default contains hostname.

```bash
# display hostname and enhance section with other plugin
set -g @tmux-nightfox-right-status-z '#h #{tmux_mode_indicator}'
```

> [!TIP]
> Make sure the themes' settings are defined before all other plugins,
> otherwise content from external plugins may not be displayed correctly by
> the theme.

## Development

To run project locally:

1.  clone the repository to desired place

    ```bash
    cd $HOME/projects/
    git clone https://github.com/idossha/tmux-nightfox.git
    ```

1.  create a symlink to the cloned repository (best in the standard [TPM][github-tpm] plugin directory):

    ```bash
    # cd to tmux plugin directory
    cd ~/.tmux/plugins/

    # create symlink to cloned repo
    ln -sf $HOME/projects/tmux-nightfox/ tmux-nightfox
    ```

1.  and in `~/.tmux.conf` set

    ```bash
    # ~/.tmux.conf
    set -g @plugin 'tmux-nightfox'
    # set desired options...
    set -g @tmux-nightfox 'nightfox'
    ```

### Linters & formatters

To keep the files clean we use few program to help us achieve it:

1.  Editorconfig (make sure your editor have it)
2.  Markdown (prettier/prettierd)
3.  Shell (shellcheck, shfmt)

## License

MIT

[github-nightfox]: https://github.com/edeneast/nightfox.nvim
[github-tmux]: https://github.com/tmux/tmux
[github-tpm]: https://github.com/tmux-plugins/tpm
[github-tmux-gruvbox]: https://github.com/egel/tmux-gruvbox
