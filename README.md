A little tool I created to display the Dark Souls font and sound effect upon committing. Currently written for git bash on Windows for reasons I don't care to explain but I may expand on this in the future to ensure it works across other environments. 

For global installation, clone this repo, then run:

`git config --global core.hooksPath "/c/Users/file/to/victory/hooks/"`
Ensure the path ends at the folder containing the post-commit script

`chmod +x "/c/Users/crmgu/repos/victory/hooks/post-commit"`
Allow execution