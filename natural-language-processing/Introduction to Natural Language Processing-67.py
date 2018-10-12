## 3. Tokenizing the Headlines ##

tokenized_headlines = []
tokenized_headlines_my = [s.split(" ") for s in submissions['headline'].values]
print(tokenized_headlines_my)
for item in submissions["headline"]:
    tokenized_headlines.append(item.split())

## 4. Preprocessing Tokens to Increase Accuracy ##

punctuation = [",", ":", ";", ".", "'", '"', "’", "?", "/", "-", "+", "&", "(", ")"]
clean_tokenized = []
for item in tokenized_headlines:
    tokens = []
    for s in item:
        s = s.lower()
        for punc in punctuation:
            s = s.replace(punc,"")
        tokens.append(s)
    clean_tokenized.append(tokens)

## 5. Assembling a Matrix of Unique Words ##

import numpy as np
unique_tokens = []
single_tokens = []
from collections import Counter
import pandas as pd
import numpy as np
cnt = Counter()
for item in clean_tokenized:
    for token in item:
        cnt[token]+=1
for word, freq in cnt.items():
    if freq == 1:
        single_tokens.append(word)
    else:
        unique_tokens.append(word)
        
counts = pd.DataFrame(0, index=np.arange(len(clean_tokenized)),columns=unique_tokens)

## 6. Counting Token Occurrences ##

# We've already loaded in clean_tokenized and counts
for idx,item in enumerate(clean_tokenized):
    for token in item:
        if token in unique_tokens:
            counts.loc[idx,token]+=1
        
        

## 7. Removing Columns to Increase Accuracy ##

# We've already loaded in clean_tokenized and counts
word_counts = counts.sum()
word = word_counts[(word_counts>=5) & (word_counts<=100)]
counts=counts.loc[:,word.index]

## 8. Splitting the Data Into Train and Test Sets ##

from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(counts, submissions["upvotes"], test_size=0.2, random_state=1)

## 9. Making Predictions With fit() ##

from sklearn.linear_model import LinearRegression

clf = LinearRegression()
clf.fit(X_train, y_train)
predictions = clf.predict(X_test)


## 10. Calculating Prediction Error ##

mse = ((predictions-y_test)**2).sum()/len(y_test)