# GIT

## CONFIGURATION
#### 1. GLOBAL
```bash
git config --global user.name "Hasanujjaman Gazi"
git config --global user.email "hasanujjamangazi2005@gmail.com"
```
#### 2. PROJECT
```bash
git config user.name "Hasanujjaman Gazi"
git config user.email "hasanujjamangazi2005@gmail.com"
```

## INITIALIZATION
```bash
git init
```

## STATUS
```bash
git status
# OR
git status --short
```

## STAGING
#### 1. Staging One File / Folder
```bash
git add # File / Folder Name
```

#### 2. Staging All Files / Folders
```bash
git add --all
# OR
git add -A
# OR 
git add .
```

## COMMIT
```bash
git commit -m "commit message"
```
#### Git Commit without staging
> Only works when the file is already tracked.
```bash
git commit -am "Small Update"
```
#### Commit Log
```bash
git log
```
## BRANCH
#### Create Branch
```bash
git branch # new-branch-name
```
#### Check Branch/es
```bash
git branch
```
#### Switch Branch
```bash
git checkout # branch-name
# OR
git switch # branch-name
```
#### Emergency Branch
> It Create a new branch and switch to it.
```bash
git checkout -b # branch-name
```
### MERGE BRANCH
> Navigate to the Main Branch.
```bash
git merge # branch-name
```
### DELETE BRANCH
```bash
git branch -d # branch-name
```
