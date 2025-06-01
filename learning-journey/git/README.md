# Git & Version Control

This directory contains learning materials and exercises for Git version control system.

## Learning Path

### 1. Git Basics
- Installation and setup
- Basic commands: cd into Repo, git add README.md, git status, git commit -m "Update git lessons 1-5 with common commands",git status, git push, git pull
- Repository creation
- Staging and committing
- Viewing history: history

### 2. Branching & Merging
- Branch creation: master baranch Devops-journey
git branch Update/README
git status (still will be in the main branch)
- Branch switching: 
git checkout Update/README
git status (it will be on branch Update/README)
make changes to the README.md file
git status
git add README.md
git status
git commit -m "Update lessons 6-10 notes with commands"
git status
git push
git push --set-upstream origin Update/README


github - Manual merger into master branch: 
git pull origin master
git checkout master
git merge Update/README
git push -u origin master

git status (you'll be still on branch Update/Readme)
git checkout master
git pull 

- Merge operations
- Conflict resolution
- Branch management

### 3. Remote Operations
- Remote repositories
- Push and pull
- Fetch and merge
- Remote tracking
- Collaboration

### 4. Advanced Git
- Rebasing
- Stashing
- Tagging
- Git hooks
- Git workflows

### 5. Best Practices
- Commit messages
- Branch naming
- Workflow strategies
- Code review
- Git configuration

## Practice Exercises
- Repository setup
- Branch management
- Merge conflicts
- Collaborative workflows
- Git hooks implementation

## Resources
- Git documentation
- Interactive tutorials
- Cheat sheets
- Workflow guides

*"Git is not just a version control system, it's a collaboration tool."* 