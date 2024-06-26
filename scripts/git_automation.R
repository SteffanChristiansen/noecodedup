# Save this code in git_automation.R
commit_message <- paste("Automated commit", date())

# Stage all changes
system("git add .")

# Commit the changes with the provided commit message
system(paste("git commit -m", shQuote(commit_message)))

# Push the changes to the remote repository
system("git push origin main")
