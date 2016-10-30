# The Dotfiles Journey
Welcome to my dotfiles readme. By the end of this readme you will have a better understanding of three things:
* What dotfiles are
* How dotfiles work
* The huge benefit of having your own set of dotfiles

## tl/dr;
Dotfiles will allow you to customize your system, your shell, and help optimize your machine setup workflow. They are best used in a script which is used to automate importing your development settings, shell settings and applications.
## Introduction
Dotfiles are used to customize your system. The word "dotfiles" originates from configuration files in Unix-like systems that start with a dot (think .bash_profile and .git_config). They are hidden by default in directory listings.

The dotfiles community is very large. You can find many repo's on github of people hosting and organizing their dotfiles. As I mentioned, dotfiles originated from Unix-style systems, and thus this readme focuses mainly on OSX and Linux.

## Preparing for the worst
### My personal spiel
If you are like me, then your journey to becoming a proficient developer/technology enthusiast has involved many computer crashes, clean OS installs and computer self diagnosis. I have reinstalled my operating system more times than I can count and I understand how painful and time consuming it can be, especially when you feel like your computer configuration is perfect and really allows you to be productive.
### Automation
Configuring your computer and development environment likely evolves over a long period of time. When you need to move to a new computer this process takes a significant amount of time. Not only this, but if you don't document or save your settings somewhere and your computer crashes, it can be a pain trying to reconfigure your computer all over again. The solution is to **use the Cloud and Automate.** Save your files, configuration settings and documents in the cloud - then you do not ever need to worry about something happening to your computer.

## Getting Started
We are going to use Github to store our dotfiles. This will allow us to keep track of our changes overtime and give us access to our configuration from any computer at any time.
### Structure
Below is the structure example I will use. You can adjust this how you see fit. 
```
.dotfiles
├── git
│ ├── .gitconfig
│ └── .gitignore_global
├── install.sh
├── osxdefaults.sh
├── runcom
│ ├── .bash_profile
│ └── .inputrc
└── system
 ├── .alias
 ├── .env
 ├── .function
 ├── .path
 └── .prompt
```
### The dotfiles
#### Loading and startup files
Before I talk about the files, I will try to link and help you understand what is actually happening in your shell. If you are like me, there was a point where I ignorant to what these files were or what was happenning in the background. I hope that after these brief summaries you have a slightly better understanding of what they do and how they work.
* [Shell startup scripts](http://blog.flowblok.id.au/2013-02/shell-startup-scripts.html)
* [Bash startup files loading order](https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/)

#### *.bash_profile*
In a Bash shell, the .bash_profile dotfile in your home directory is the first file to get loaded. There is a lot of information that can be associated with this file and therefore I will link articles that I find useful to understand the innerworkings of it.
##### Example .bash_profiles's
* Mathias's .bash_profile **LINK HERE**
* 
#### *.inputrc*
The inputrc file handles keyboard mapping for specific situations. This file is the startup file used by Readline — the input-related library — used by Bash and most other shells.
#### *.alias*
Aliases allow us to define shortcuts for certain commands, add default arguments and/or abbreviate longer one-liners. Check out the examples below.
```
alias l="ls -la"       # List in long format, include dotfiles
alias ld="ls -ld */"   # List in long format, only directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# Recursively remove .DS_Store files
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
```
#### *.functions*
This file holds functions. Functions are too complex for an alias and likely too small for a standalone script. They can also take arguments which can make them very powerful. See my example below.
```
# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}
```
#### *.env*
Environment variables are a set of dynamic named values that can affect the way running processes will behave on a computer. They are part of the environment in which a process runs. They exist in all major operating systems (Linux, Windows, MacOS). They answer questions like:
* What is the name of the computer where I am installed?
* What is the name of the user running me?
* What is my current working directory?
* Where is the operating system installed?
* Where are temporary files stored?

Naturally, we are going store our environment variables in another dotfile.
```
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$DOTFILES_DIR/bin"
export EDITOR="subl -w"
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
# Tell grep to highlight matches
export GREP_OPTIONS='—color=auto'
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob 
# Autocorrect typos in path names when using `cd`
shopt -s cdspell
```
##### The PATH Variable
Programs need to know where to find and lookup specific files. The PATH variable states where they can find what they need in order to run. Those programs look for a PATH variable automatically so you don't have to type it in every time you run the program. It has a value consisting from many user directories which are set by different programs installed on the computer.
### Installing the Dotfiles
Finally we want to get these dotfiles up and running. What I suggest, and what many other users typically do, is they symlink them from the home directory. **Symlinking** is the process of storing the path of the target file (in our case, the dotfiles) as text. This means though, that if you move the target file, the symlink will break because it still points to the original location in the link.

Lets assume that you have installed your dotfiles in the directory structure mentioned above. That means that your files lie in ~/.dotfiles. You can create a symlink from here to the directory where they are expected (which is usually the home directory, ~) by running these lines in your terminal.
```
ln -sv “~/.dotfiles/runcom/.bash_profile” ~
ln -sv “~/.dotfiles/runcom/.inputrc” ~
ln -sv “~/.dotfiles/git/.gitconfig” ~
```
#### Automate, again!
Why run these lines each time you have to set up your dotfiles on a new computer? Automation, again, is a great solution. We can write a script to automate symlinking the dotfiles in the repo to our home directory. 

There is more though that we can incorporate into our script that we run once to install a new system. Many users will also use Homebrew-cask to install applications (think google chrome, firefox, sublime, VLC, etc). This allows users to install all of these core programs with one script! Convenient huh?
### Credit
I have to give credit to a bunch of helpful articles and links that have allowed to me understand more about dotfiles, shells, and the command line. Thanks to:
* [Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.hqrpjbc7r) by Lars Kappert
* [Shell startup scripts](http://blog.flowblok.id.au/2013-02/shell-startup-scripts.html) by Peter Ward
* [Zsh/Bash startup files loading order](https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/) by The Lumber Room
* [Dotfiles](https://dotfiles.github.io/) by GitHub!