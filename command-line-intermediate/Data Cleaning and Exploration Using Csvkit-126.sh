## 2. Csvstack ##


ls -l
csvstack -n year -g 2005,2007,2013 Hud_2005.csv Hud_2007.csv Hud_2013.csv > Combined_hud.csv
head -5 Combined_hud.csv

## 3. Csvlook ##


head -10 Combined_hud.csv | csvlook

## 4. Csvcut ##


csvcut -n Combined_hud.csv
csvcut -c 2 Combined_hud.csv | head -10

## 5. Csvstat ##


csvstat --mean Combined_hud.csv

## 6. Csvcut | csvstat ##


csvcut -n Combined_hud.csv
csvcut -c 2 Combined_hud.csv | csvstat

## 7. Csvgrep ##


csvgrep -c 2 -m -9 Combined_hud.csv | head -10 | csvlook

## 8. Filtering out problematic rows ##


csvgrep -c 2 -m -9 -i Combined_hud.csv > positive_ages_only.csv