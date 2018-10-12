## 1. Data munging ##


ls -l

## 2. Data exploration ##


head Hud_2005.csv
head Hud_2007.csv
head Hud_2013.csv

## 3. Filtering ##


head -1 Hud_2005.csv > combined_hud.csv
wc -l Hud_2005.csv
tail -46853 Hud_2005.csv >> combined_hud.csv
head combined_hud.csv

## 4. Consolidating datasets ##


wc -l Hud_2007.csv
tail -42729 Hud_2007.csv >> combined_hud.csv
wc -l Hud_2013.csv
tail -64535 Hud_2013.csv >> combined_hud.csv

## 5. Counting ##


grep '1980-1989' combined_hud.csv | wc -l