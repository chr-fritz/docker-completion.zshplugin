# Docker Completion for macOS

This is a ZSH plugin for all [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)-compatible frameworks to easily load the completions for docker and docker-compose directly from the Docker for Mac app.

The Docker for Mac Application provides the tab completion for the `docker` and `docker-compose` commands directly under `/Applications/Docker.app/Contents/Resources/etc`.

## Installing

### [Antibody](https://github.com/getantibody/antibody)

Add `chr-fritz/docker-completion.zshplugin` to your `.zsh_plugins.txt` and execute `antibody update`.

### [Antigen](https://github.com/zsh-users/antigen)

Add `antigen bundle chr-fritz/docker-completion.zshplugin` to your `.zshrc`

### [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)

1. cd to your `oh-my-zsh` plugins directory (~/.oh-my-zsh/custom/plugins)
2. `git clone https://github.com/chr-fritz/docker-completion.zshplugin docker-completion`
3. Add docker-completion to your plugins in your `.zshrc`
```zsh
...
plugins=( ... docker-completion ...)
...
```

### [Zgenom](https://github.com/jandamm/zgenom)

Add `zgenom load chr-fritz/docker-completion.zshplugin` to your `.zshrc` with your other load commands.

### Without using any frameworks

1. Clone this repository, then add its bin directory to your `$PATH`.
2. Add `source /path/to/here/docker-completion.zshplugin` to your `.zshrc` file.

### Run once

It's enough to run this plugin just once, assuming the plugin or Docker Desktop don't change the completion location.
The site-functions directory might not be user-writable, so use elevated permissions.

```shell
git clone https://github.com/chr-fritz/docker-completion.zshplugin docker-completion
cd docker-completion
sudo zsh docker-completion.plugin.zsh
```

## License

Apache License 2.0 © 2020 Christian Fritz
