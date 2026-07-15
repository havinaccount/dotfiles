# Dotfiles

Personal dotfiles for myself and from myself (im lying)

`.bashrc` exists in `$HOME` or `~`

`config.ghostty` exists in `$HOME/.config/ghostty/` and needs the ghostty terminal

`starship.toml` lives in `$HOME/.config/` and needs `starship`

Use this script to install in Linux:

```: bash
cat extensions.txt | xargs -L 1 code --install-extension
```

for Windows:

```: cmd
for /f %i in (extensions.txt) do code --install-extension %i
```

You can check if the VSCode Extensions are installed using `code --list-extensions` or checking in the VSCode itself

Note: The `.bashrc` is only tested in Ubuntu 26.04 LTS and not guaranteed to work in any other distribution
