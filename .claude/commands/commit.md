---
description: Review changes, commit with a conventional message, and push
argument-hint: optional message
---

1. run `git status` and `git diff` to review changes
2. Analyze changes and create a conventional commits formatted message (use $ARGUMENTS as a hint if given)
3. stage changes with `git add .`
4. show me the commit message and wait for my confirmation
5. after confirmation:
   - run `git commit -m "your message"`
   - if the branch already exists on the remote, run `git pull --rebase origin $(git branch --show-current)` to sync with remote
   - run `git push -u origin $(git branch --show-current)`
6. show me the final result with commit hash and push confirmation

If there are merge conflicts during pull, STOP and ask me how to proceed.
