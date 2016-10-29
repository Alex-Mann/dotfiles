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
.
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
####