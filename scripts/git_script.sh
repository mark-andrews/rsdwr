# Assuming we are inside the directory "myproject"
# Turn "myproject" directory into a repository
git init
# Add the two files
git add analysis.R script.R
# Check the status. This shows that there are two files in the staging area.
git status 
# To commit these files to the repo, we use `git commit`. This opens an editor. There, I enter my log message.
git commit 
# The status now shows that there are untracked files left.
git status 
# We can see the history with `git log`.
git log 
# I now change "analysis.R" by opening the file in the vim editor.
vim analysis.R
# The status will show that "analysis.R" is changed.
git status 
# Now, I commit that change.
git add analysis.R
# The status will show that the repo has no untracked or modified files left.
git status 
# Now, I commit as usual. This will bring up my editor. There, I enter my log message.
git commit 
# I can now view the two log messages.
git log 
# In the meantime, I created an empty repository on Github by the name "justforfun"
# I add that as a remote host for the local "myproject" repo.
git remote add github git@github.com:mark-andrews/justforfun.git
# Now, I can "push" the "myproject" repo to GitHub.
git push -u github master 
# Now I will make a readme.md file with vim.
vim readme.md
# I add that to the (local) "myproject" repo.
git add readme.md
# I commit it as usual. This opens vim, etc.
git commit
# Now, I can push it to GitHub.
git push -u github master 
