# bash-prompt

An shell environment file that shows:

- username and hostname
- your path (truncated) 
- number of jobs running in this shell
- integrate venv python prompt (if python venv is sourced)
- repeated dots when no new command yielding a history entry is given
- multi-line commands get a green dot
 

The shell prompt has a blueish dot if the return code of the last command was 0 otherwise it will notify you that the last command existed erroneously with a subtle red dot (see screenshot).

![Example](https://github.com/masikh/bash-prompt/blob/master/example1.png)
![Example](https://github.com/masikh/bash-prompt/blob/master/example2.png)
![Example](https://github.com/masikh/bash-prompt/blob/master/example3.png)
![Example](https://github.com/masikh/bash-prompt/blob/master/example4.png)
![Example](https://github.com/masikh/bash-prompt/blob/master/example5.png)
