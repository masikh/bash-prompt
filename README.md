# Prompt

[![Language](https://img.shields.io/github/languages/top/masikh/bash-prompt)](https://github.com/masikh/bash-prompt) [![Last commit](https://img.shields.io/github/last-commit/masikh/bash-prompt)](https://github.com/masikh/bash-prompt/commits) [![Repo size](https://img.shields.io/github/repo-size/masikh/bash-prompt)](https://github.com/masikh/bash-prompt) [![Stars](https://img.shields.io/github/stars/masikh/bash-prompt?style=flat)](https://github.com/masikh/bash-prompt/stargazers)

.zshrc is for the zsh shell
.bash_profile is for the bash shell

An shell environment file that shows:

- username and hostname
- your path (truncated) 
- number of jobs running in this shell
- integrate venv python prompt (if python venv is sourced)
- repeated dots when no new command yielding a history entry is given
- multi-line commands get a green dot
 

The shell prompt has a blueish dot if the return code of the last command was 0 otherwise it will notify you that the last command existed erroneously with a subtle red dot (see screenshot).

![Example](https://github.com/masikh/bash-prompt/blob/master/example1.png)
![Example](https://github.com/masikh/bash-prompt/blob/master/example6.png)
![Example](https://github.com/masikh/bash-prompt/blob/master/example2.png)
![Example](https://github.com/masikh/bash-prompt/blob/master/example3.png)
![Example](https://github.com/masikh/bash-prompt/blob/master/example4.png)
![Example](https://github.com/masikh/bash-prompt/blob/master/example5.png)
