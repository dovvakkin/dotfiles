This is repo for my dotfiles managed with GNU stow

Apply `zsh` config as example:
```sh
stow -t $HOME zsh
```

Notes on some configs:

* __zsh__ inspired by ChrisAtMachine config. No Oh My Zsh or other plugin manager, just function for cloning plugin repo.
    * This config relies on `ZDOTDIR` set to `$HOME/.config/zsh`. It can be achieved via `$HOME/.zshenv`:

    ```sh
    # uncomment to stop having fun with vi mode :(
    # PLEASE_NO_NO_DONT_ENABLE_VI_MODE=true
    ZDOTDIR=$HOME/.config/zsh
    ```
