## 1. Appending ##


echo '99 bottles of beer on the wall...' > beer.txt
echo 'Take one down, pass it around, 98 bottles of beer on the wall...' >> beer.txt

## 2. Redirecting from a file ##


sort -r < beer.txt

## 3. The grep command ##


echo 'Coffee is almost as good as beer,\nBut I could never drink 99 bottles of it' > coffee.txt
grep "bottles of" beer.txt coffee.txt

## 4. Special characters ##


touch beer1.txt
touch beer2.txt
grep "beer" beer?.txt

## 5. The star wildcard ##


grep "beer" *.txt

## 6. Piping output ##


echo -e "import random\nfor i in range(10000):\n    print(random.randint(1,10))\n" > rand.py
python rand.py | grep 9

## 7. Chaining commands ##


echo "All the beers are gone" >> beer.txt && cat beer.txt

## 8. Escaping characters ##


echo "\"Get out of here,\" said Neil Armstrong to the moon people." >> famous_quotes.txt