## 1. Introduction ##


cd ~
git clone /dataquest/user/git/chatbot
cd chatbot
git checkout -b feature/king-bot
printf "\nprint('I am the king')" >> bot.py
git add .
git commit -m "Make more kinglike"
git checkout master
git checkout -b feature/queen-bot
printf "\nprint('I am the queen)" >> bot.py
git add .
git commit -m "Make more queenlike"
git checkout master
git merge feature/king-bot
git merge feature/queen-bot

## 2. Aborting a Merge ##


cd /home/dq/chatbot
git merge --abort

## 3. Resolving Conflicts ##


cd /home/dq/chatbot
git merge feature/queen-bot
echo "print('I am the queen')" > bot.py
git add .
git commit -m "Fixed conflicts"
git push origin master

## 4. Resolving Multi-Line Conflicts ##


cd ~
cd chatbot
git checkout -b feature/random-printing
printf "\nmessages=['I am great', 'You are great', 'I need more outside time']\nimport random\nmsg=random.choice(messages)\nprint(msg)" >> bot.py
git add .
git commit -m "Add random printing"
git checkout master
git checkout -b feature/dice-roller
printf "\nimport random\nd1=random.randint(1,6)\nd2=random.randint(1,6)\nprint('D1: {0} D2: {1}'.format(d1, d2)" >> bot.py
git add .
git commit -m "Add dice rolling"
git checkout master
git merge feature/random-printing
git merge feature/dice-roller
printf "\nimport random\nd1=random.randint(1,6)\nd2=random.randint(1,6)\nprint('D1: {0} D2: {1}'.format(d1, d2)" > bot.py
git add .
git commit -m "Resolved multi-line conflict"
git push origin master

## 5. Resolving Multiple Conflicts ##


cd ~
cd chatbot
git checkout -b feature/more-printing
printf "\nmessages=['I am great', 'You are great', 'I need more outside time']\nimport random\nmsg=random.choice(messages)\nprint(msg)" >> bot.py
git add .
git commit -m "Add more printing"
git checkout master
git checkout -b feature/more-printing-2
printf "\nimport random\nd1=random.randint(1,6)\nd2=random.randint(1,6)\nprint('D1: {0} D2: {1}'.format(d1, d2))" >> bot.py
git add .
git commit -m "Add even more printing"
git checkout master
git merge feature/more-printing
git merge feature/more-printing-2
printf "\nimport random\nd1=random.randint(1,6)\nd2=random.randint(1,6)\nprint('D1: {0} D2: {1}'.format(d1, d2))" > bot.py
git add .
git commit -m "Resolved multiple conflicts"
git push origin master

## 6. Accepting Changes From Only One Branch ##


cd ~
cd chatbot
git checkout -b feature/remove-bot
git rm bot.py
git commit -m "Remove bot"
git checkout master
git checkout -b feature/keep-bot
printf "\nprint('I want to live')" >> bot.py
git add .
git commit -m "Keep the bot around"
git checkout master
git merge feature/remove-bot
git merge feature/keep-bot
git checkout --theirs .
git add .
git commit -m "Keeping bot.py"
git push origin master

## 7. Ignoring Files ##


cd ~
cd chatbot
git checkout master
printf ".DS_Store\n*.pyc" > .gitignore
git add .
git commit -m "Added gitignore"
git push origin master

## 8. Removing Cached Files ##


cd ~
cd chatbot
git checkout master
git rm --cached bot.py
git commit -m "Removed bot.py"
git push origin master