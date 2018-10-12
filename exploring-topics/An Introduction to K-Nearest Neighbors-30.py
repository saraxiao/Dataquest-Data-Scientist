## 3. Finding Similar Rows With Euclidean Distance ##

selected_player = nba[nba["player"] == "LeBron James"].iloc[0]
distance_columns = ['age', 'g', 'gs', 'mp', 'fg', 'fga', 'fg.', 'x3p', 'x3pa', 'x3p.', 'x2p', 'x2pa', 'x2p.', 'efg.', 'ft', 'fta', 'ft.', 'orb', 'drb', 'trb', 'ast', 'stl', 'blk', 'tov', 'pf', 'pts']
import math
def euclidean_distance(s1,s2):
    return math.sqrt(((s1-s2)**2).sum())
lebron_distance = nba[distance_columns].apply(lambda x:euclidean_distance(x,selected_player[distance_columns]),axis=1)


## 4. Normalizing Columns ##

nba_numeric = nba[distance_columns]
column_mean = nba_numeric.mean()
column_std = nba_numeric.std()
nba_normalized = (nba_numeric-column_mean)/column_std

## 5. Finding the Nearest Neighbor ##

from scipy.spatial import distance

# Fill in the NA values in nba_normalized
nba_normalized.fillna(0, inplace=True)

# Find the normalized vector for Lebron James
lebron_normalized = nba_normalized[nba["player"] == "LeBron James"]

# Find the distance between Lebron James and everyone else.
euclidean_distances = nba_normalized.apply(lambda row: distance.euclidean(row, lebron_normalized), axis=1)
idx = euclidean_distances.sort_values().index[1]
most_similar_to_lebron = nba['player'].loc[idx]


## 6. Generating Training and Testing Sets ##

import random
from numpy.random import permutation

# Randomly shuffle the index of nba
random_indices = permutation(nba.index)
# Set a cutoff for how many items we want in the test set (in this case 1/3 of the items)
test_cutoff = math.floor(len(nba)/3)
# Generate the test set by taking the first 1/3 of the randomly shuffled indices
test = nba.loc[random_indices[1:test_cutoff]]
# Generate the train set with the rest of the data
train = nba.loc[random_indices[test_cutoff:]]

## 8. Computing Error ##

actual = test[y_column]
mse = ((actual-predictions)**2).sum()/len(actual)