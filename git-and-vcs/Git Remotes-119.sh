## 1. Introduction to Remote Repositories ##


cd ~
git clone /dataquest/user/git/chatbot

## 2. Making Changes to Cloned Repositories ##


cd /home/dq/chatbot
printf "This project needs no installation" >> README.md
git add .
git commit -m "Updated README.md"
git status

## 3. Overview of the Master Branch ##


cd /home/dq/chatbot
git branch

## 4. Pushing Changes to the Remote ##


cd /home/dq/chatbot
git push origin master

## 5. Viewing Individual Commits ##


cd /home/dq/chatbot
HASH=`git rev-parse HEAD`
git show $HASH -q

## 6. Commits and the Working Directory ##


cd /home/dq/chatbot
HASH=`git rev-parse HEAD`
HASH2=`git rev-parse HEAD~1`
git --no-pager diff $HASH2 $HASH

## 7. Switching to a Specific Commit ##


cd /home/dq/chatbot
HASH=`git rev-list --max-parents=0 HEAD`
git reset --hard $HASH

## 8. Pulling From a Remote Repo ##


cd /home/dq/chatbot
git pull

## 9. Referring to the Most Recent Commit ##


cd /home/dq/chatbot
git reset --hard HEAD~1
git rev-parse HEAD