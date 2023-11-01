# Main Readme
This is a brief documentation of my dotfiles cleanup and organization. Also it should have all info needed to easily install and configure all my stuff in freshly installed Arcolinux.

## Storyline
My Linux journey have started many years ago, and it quickly turned over to i3 and terminal-based workflow. Some of my configs are copied from Luke Smith's LARBS project, some from Distrotube's dotfiles, and some of changes are mine. However it's all a bit messy and not as quick to append to fresh linux installation. So by the way of another Arcolinux installation I've decided to install my stuff step-by-step, document it and store as a bare repository. This repo should contain all my dotfiles and installation scripts along with some necessary documentation.

## How this repo has begun
I've used tutorial from [Atlassian](https://atlassian.com/git/tutorials/dotfiles).

On the machine that I've installed ArcolinuxB i3 I've done below steps to create bare repository:

```bash
git init --bare $HOME/.dotfiles
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME
config config --local status.showUntrackedFiles no
echo "alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> $HOME/.bashrc-personal
```

At this point it's worth to mention that **I've put alias to .bashrc-personal file because this is proper place to keep personal bash configuration in Arcolinux**.

Next I've created repository in [GitHub](https://github.com) and added it as remote reference to the bare repo.

```bash
config remote add origin https://github.com/Norbiox/dotfiles.git
config push --set-upstream origin dev
```

## How to use this repo on machine with freshly installed Arcolinux

### Setup GitHub CLI

```bash
sudo pacman -S github-cli
gh auth login
```

### Clone this repo as bare repo to get all dotfiles

```bash
echo ".dotfiles" >> .gitignore
git clone --bare <PUT_REPO_URL_HERE> $HOME/.dotfiles
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME
config checkout
```

Now you may had some errors due to already exsited files. Just remove those files and repeat checkout command.

```bash
config config --local status.showUntrackedFiles no
```

### Run installation script

After successfull setup run `.scripts/install.sh` to install all packages that are needed and has not been installed with Arcolinux by default and setup some settings.
