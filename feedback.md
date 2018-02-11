# Scrabble
## What We're Looking For

Feature | Feedback
--- | ---
**General** | 
Answered comprehension questions | 
Both Teammates contributed to the codebase | 
Regular Commits with meaningful commit messages | 
**Scoring class** | 
`score` method | 
Uses appropriate data structure to store the letter score | 
Appropriately handles edge cases | 
Tests `score` edge cases (one-letter word, 7 letter word) | 
`highest_scoring_word` method | 
Appropriately handles edge cases | 
Tests `highest_scoring_word` edge cases (ties, no words, no array) | 
**Player class** | 
Uses an array to keep track of words played | 
Uses existing code to create `highest_scoring_word` and `highest_word_score` | 
Returns `true` or `false` from `won?` method | 
Tests edge cases on the `play(word)` method for words that cannot be scored | 
**TileBag class** | 
Uses a data structure to keep the set of default tiles in the bag | 
`draw_tiles` method uses the parameter to draw a set of random tiles | 
`tiles_remaining` method returns a count | 
Tests `draw_tiles` edge cases for different parameter inputs | 
