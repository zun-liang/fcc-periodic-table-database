# freeCodeCamp - Build a Periodic Table Database

This is a solution to the freeCodeCamp project [Build a Periodic Table Database](https://www.freecodecamp.org/learn/relational-database/build-a-periodic-table-database-project/build-a-periodic-table-database).

## What I learned

### Learn Nano by Building a Castle

- Nano is a program for editing files that runs in the terminal. You can open a file with ```nano filename```.
- ```control + o``` to "write-out", or save the file
- Exit Nano by pressing ```control + x```.
- You can "cut" text with ```control + k```.
- Press ```enter``` after ```control + o``` to save the file without changing the name
- The ```^``` in front of all the commands at the bottom means to press control and the letter to run the command. 
- ```control + u``` to "uncut", or paste, a line. 
- The ```M``` at the beginning of the other commands at the bottom stands for "meta". It's a key that doesn't exist on most keyboards. If you're on OSX it means press ```escape``` then the letter. If you are on another system, press ```ALT``` then the letter.  


### Learn Git by Building an SQL Reference Object

- to turn a folder into git repository: ```git init```
- The ```git init``` command created that ```.git``` folder for you. It's what keeps track of all the things in your repository. 
- Use ```git status``` to see the status of where you are.
- A git repository has branches to help keep track of things you are doing with your code. It's common to have a main branch which might be for your production code, and other branches for adding new features or fixing bugs. You can create and go to a new branch with ```git checkout -b new_branch```.
- There's two steps to make git keep track of it for you. First you need to add it to the staging area like this: ```git add file_name```.
- The second step is to commit them, you can use ```git commit -m "Initial commit"```. The -m stands for "message". Often times, the first commit of a repo will have the message "Initial commit". 
- You can see your commit history with ```git log```. You can see the commit you made. It shows the message you gave with the commit, along with your username, email, the date, and a commit hash. The hash is that long string of characters. 
- You can see the changes you made with ```git diff```. The lines with ```+``` in front means that those lines were added. 
- commit new feature example message: feat: add create database reference. Commit messages often start with ```fix:``` or ```feat:```
- Type ```git branch``` to see the current branches in your repo.
- You can create a branch with ```git branch branch_name```. Branches often start with ```fix/``` or ```feat/```, among others, like commit messages, but they use a forward slash and can't contain spaces. 
- You can see your new branch, but you are still on the main branch, as denoted with the ```*```. To switch to a branch use: ```git checkout branch_name```. 
- ```git log --oneline``` to condense the output so it's more readable.
- You can use ```git merge branch_name``` to bring changes from a branch into the branch you are currently on. 
- You can delete a branch with ```git branch -d branch_name```. ```-d``` stands for "delete". Since your changes were added, you can safely delete your feature branch. 
- Create and switch to a new branch with ```git checkout -b branch_name```
- ```git add .``` to add all files to staging
- when you create a branch, it will be a clone of whatever branch you are on when you create it.
- You created this branch and made a commit. Since then, a commit for a bug fix was added to main. This is common with many people working on a codebase simultaneously. You need to update this branch so it has the same commits from main, but you can't just merge that branch into this one. You need that bug fix commit to be in the same order here as it is on main, right after the "drop table" commit. You need to rebase this branch against main to do that: ```git rebase main```
- In conflicts, there are sections, separated by characters (```<```, ```>```, and ```=```), that represent the commit you are on (```HEAD```) and the commit that is trying to be added (feat: add column reference). Fix the conflict by removing those ```<```, ```>```, and ```=``` characters. 
- ```git rebase --continue``` is the command you use to continue the rebase process after resolving those conflicts
- The ```git stash``` command is used in Git to temporarily store changes that are not ready to be committed yet. This is particularly useful when you need to switch branches or perform other operations without committing your changes.
- View the things you have stashed with ```git stash list```.
- Bring the changes back with ```git stash pop```. Popping a stash like that will remove the most recent stash and apply it to your working tree. 
- View a condensed version of the changes in the latest stash with ```git stash show```. You can see what file was changed and how many lines were added and removed from the file. View the full changes of the latest stash with ```git stash show -p```. ```-p``` stands for "patch".
- ```git stash apply``` is a Git command used to reapply the most recently stashed changes to your working directory, while keeping those changes in the stash.
- You can use the name at the front of each stash (```stash@{#}```) with many of the stash commands to select one other than the latest one. The most recent stash is the one at the top, stash@{0}. View the condensed changes of the oldest stash with the git stash show stash@{1} if there are 2 stashes.
- to drop stash: ```git stash drop``` or ```git stash drop stash@{#}```
- a few ways to remove or undo a commit. The first is to simply "travel back in time". You can use the git reset command to travel to any point in your commit history. Your current HEAD is a reference to the last commit you just made. Use ```git reset HEAD~1``` to go back one before HEAD. when you reset to one commit before HEAD, it removed the most recent commit, and put all the changes in the working tree. If you used the ```--hard``` flag with the reset, the changes would have not been added to the working tree and if you used the ```--soft``` flag, the changes would have been added to the working tree and to staging. 
- Reverting is a good way to undo a commit because you don't lose the commit from the history. You can revert the most recent commit (HEAD) with ```git revert HEAD```.
- Enter ```git show``` into the terminal to see the last commit added and its details.
- enter an "interactive" mode to manipulate commits. Type ```git rebase --interactive```, for example, ```git rebase --interactive HEAD~2```, ```HEAD~2``` refers to the commit two steps behind the current HEAD commit.
- At the top of Nano, you can see the two commits with pick next to them. Below them, there's a list of options for working with them. pick means that it will use the commits as they were. At the bottom, it says, ```d```, drop = remove commit. ```r```, reword = use commit, but edit the commit message.
- ```git rebase --interactive --root```, ```--root``` means that the rebase will go back to your very first commit.
- When you rebase interactively it changes all those hashes, so git sees them as different commits. If you were to try and merge this into main, it wouldn't work because they don't share the same history anymore. For this reason, you don't want to do an interactive rebase where you go back passed commits unique to the branch you are on. Fortunately, you can fix this. Enter ```git rebase main``` to realign the history of the two branches.
- Squashing commits means that you will take a bunch of commits and turn them into one. This is helpful to keep your commit history clean and something you want try to do. ```s```, squash <commit> = use commit, but meld into previous commit
- ```git log -1``` to view the last commit, You can view the last x number of commits with any number instead of 1. 
- ```.env``` files are used to store environment variables for running code. Often times, there may be sensitive information in it. 

### Something I learned from This Project

- To capitalize the first letter only, use ```INITCAP```, for example:
    ```
    UPDATE elements SET symbol=INITCAP(symbol);
    ```
- To remove all trailing zeros after the decimals, for example:
    ```
    ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;
    UPDATE properties SET atomic_mass=trim(trailing '00' FROM atomic_mass::TEXT)::DECIMAL;
    ```
    ```trim(trailing '00' FROM atomic_mass::TEXT)```: This part removes trailing '00' characters from the atomic_mass column after casting it to a text type (::TEXT). The trim() function in PostgreSQL removes characters from the beginning or end of a string. Here, we're removing trailing '00' characters.

    ```::DECIMAL```: This part casts the result of the trim() function back to the DECIMAL data type. After trimming trailing '00' characters, the result will be a string, so we cast it back to a decimal data type for consistency with the column's data type.