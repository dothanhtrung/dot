# .bash_profile

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

# User specific environment and startup programs

export PATH="$HOME/.cargo/bin:$PATH"
export DOCKER_HOST=”unix://$XDG_RUNTIME_DIR/podman/podman.sock”