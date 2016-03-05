# Scrabble
Use __Test Driven Development (TDD)__ to create a collection of Ruby classes that would provide the foundation for creating a scrabble game. Don't actually build an interactive game (yet)!

## Project Expectations
From the project root, you should be able to execute all of your specs by running `rake`. Each Ruby class should be in its own file in `lib/`, and the entire project should be in a `module` called `Scrabble`. You will need to research using `require`, `require_relative`, `include` and/or `extend` to tell Ruby how to work with classes in multiple files.

### Tests
We will use [minitest](https://github.com/seattlerb/minitest) for this project. This is the same test framework that we've used for the Weekend Warrior exercises. However, unlike Weekend Warrior, we will write our own tests using [minitest specs format](https://github.com/seattlerb/minitest#specs). Your spec descriptions should be meaningful and organized into `describe` blocks that reflect your intent on how to use the code.

Do not move onto a new tier of requirements until the minimum requirements of the previous tier are complete and your specs are green across the board. Use __TDD__ to drive your development and document your edge cases.

### Pair Programming
Utilize good pair programming practices. Refer back to the articles from the [Agile Alliance](http://guide.agilealliance.org/guide/pairing.html) and the [Agile Institute](http://powersoftwo.agileinstitute.com/2015/02/benefits-of-pair-programming-revisited.html) for best practices. Switch _driver_ and _navigator_ roles often. When there is uncertainity or confusion, step away from the keyboard and discuss, plan, and document on paper or whiteboard before continuing.

## Baseline
### Setup
1. You'll be working with an assigned pair. High-five your pair.
1. Choose one person to fork the project repo.
1. Add the other person in the pair to the forked repo as a _collaborator_.
1. Add the second individual as a collaborator to the forked repo.
1. Both individuals will clone the forked repo: `$ git clone [YOUR FORKED REPO URL]`
1. Both individuals `cd` into the dir create:d `$ cd scrabble`
1. Both individuals install needed tools via Terminal: `$ gem install simplecov`

### Requirements
#### Pair Plan
First, come up with a "plan of action" for how you want to work as a pair. Discuss your learning style, how you prefer to recive feedback, and one team communication skill you want to improve with this experience. Second, review the requirements for Wave 1 and come up with a "plan of action" for your implementation.

#### Implementation
- Create a `Scrabble` module at the project root.
- Create a `Scrabble::Scoring` class which contains some sort of data structure to store the **individual letter scores** listed below.
- Create a Spec file which corresponds to your `Scrabble::Scoring` class. This spec should contain one __red__ test as a starting point (this test can be modified as your get further through the requirements).
- Be able to execute your one test using `rake` from the project root.

#### Score chart
|Letter                        | Value|
|:----------------------------:|:----:|
|A, E, I, O, U, L, N, R, S, T  |   1  |
|D, G                          |   2  |
|B, C, M, P                    |   3  |
|F, H, V, W, Y                 |   4  |
|K                             |   5  |
|J, X                          |   8  |
|Q, Z                          |   10 |

## Wave 1
### Primary Requirements
Create a `Scrabble::Scoring` class with a __minimum of 8 specs__. The class should have the following **class methods**:

- `self.score(word)`: returns the total score value for the given word. The word is input as a string (case insensitive). The chart in the baseline requirements shows the point value for a given letter.
  - A seven letter word means that a player used all the tiles. Seven letter words receive a __50__ point bonus.
- `self.highest_score_from(array_of_words)`: returns **the word in the array with the highest score**. In the case of tie, use these tiebreaking rules:
    - It’s better to use fewer tiles, in the case of a tie, prefer the work with the fewest letters.
    - There is a bonus for words that are seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
    - If the there are multiple words that are the same score and same length, pick the first one in the supplied list.

## Wave 2
### Primary Requirements
Create a `Scrabble::Player` class with a __minimum of 11 specs__. The only required paramter for instances of the class is the player's `name`. Instances of the class should repond to the following messages:

- `#name`: returns the value of the `@name` instance variable
- `#plays`: returns an Array of the words played by the player
- `#play(word)`: Adds the input word to the `plays` Array
    - Returns `false` if player has already won
    - Returns the score of the `word`
- `#total_score`: Returns the sum of scores of played words
- `#won?`: If the player has over 100 points, returns `true`, otherwise returns `false`
- `#highest_scoring_word`: Returns the highest scoring played word
- `#highest_word_score`: Returns the `highest_scoring_word` score

## Wave 3
### Primary Requirements
#### `TileBag`
Create a `Scrabble::TileBag` class with a __minimum of 5 specs__. It should have the following class and instance methods:

- `#initialize` Called when you use `TileBag.new`, sets up an instance with a collection of default tiles
- `#draw_tiles(num)` returns `num` number of random tiles, removes the tiles from the default set.
- `#tiles_remaining` returns the number of tiles remaining in the bag

##### Initial Distribution of Letters
| Letter : Qty. | Letter : Qty. |
|:------:|:-----:|
| A : 9  | N : 6 |
| B : 2  | O : 8 |
| C : 2  | P : 2 |
| D : 4  | Q : 1 |
| E : 12 | R : 6 |
| F : 2  | S : 4 |
| G : 3  | T : 6 |
| H : 2  | U : 4 |
| I : 9  | V : 2 |
| J : 1  | W : 2 |
| K : 1  | X : 1 |
| L : 4  | Y : 2 |
| M : 2  | Z : 1 |

#### Modifications to `Player`
Create specs for (__minimum 2__) and add to the `Player` class the following instance methods:

- `#tiles` a collection of letters that the player can play (max 7)
- `#draw_tiles(tile_bag)` fills tiles array until it has 7 letters from the given tile bag

### Optional Enhancements
- Create a `Scrabble::Dictionary` class that includes a method (class or instance) for searching a list of words to determine if a given word is valid (__minimum of 5 specs__).
- Create a `Scrabble::Board` class (__minimum of 15 specs__) that has a matrix (array of arrays) of tile places. Check if a word can be played on a given tile place in a certain direction (up/down or left/right).
