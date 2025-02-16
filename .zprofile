export ZDOTDIR="$HOME/.config/zsh"
export LIBVIRT_DEFAULT_URI='qemu:///system'

export ANDROID_HOME=$HOME/projects/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

# Go
export PATH=$PATH:$(go env GOPATH)/bin
# Rust
export PATH=$PATH:$HOME/.cargo/bin
# Ruby
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

export PATH=$HOME/.local/bin:$PATH

export PNPM_HOME="/home/tox/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

EDITOR="nvim"
BROWSER="firefox"
