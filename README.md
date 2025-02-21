## LAZY VIM 

Personal vim configuration. 

## Use ghostty or kitty for all features

### Installation

1. Clone the repository to your home directory:

```bash
git clone <url> ~/.config/nvim/
```


2. Install lua 
```
sudo apt-get install liblua5.1.0-dev lua5.1 
```
and luarock (follow instructions at luarocks.org) 

3. LSP Stuff
```
sudo apt install clangd python3-pip python3-venv
python3 -m pip install isort black pyright

# Copilot
sudo apt install npm 
npm install -g n

```

Configure the lsps you want using the :Mason command inside nvim.

Not Copilot requires a github token to work and nodejs (>18) installed.
