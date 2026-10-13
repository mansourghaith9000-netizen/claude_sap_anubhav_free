argument-hint: optional message

1. run ´git status´ and ´git diff´ to review changes
2. Analyze changes and create a conventional commits formatted message 
3. stage changes with ´git add .´ .
4. show me the commit message and wait for my confirmation
5. after confirmation:
run ´git pull --rebase origin $(git branch --show-current)´ to sync with remote
run ´git commit -m "your message"´
run ´git push origin $(git branch --show-current)´

6. show me the final result with commit hash and push confirmation

generate the complete schema.cds file with proper syntax, indentation, and sap cap best practices.
if there are merge conflicts during pull, STOP ans ask me how to proceeed