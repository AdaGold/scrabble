# Scrabble
Use __Test Driven Development (TDD)__ to create a collection of Ruby classes that would provide the foundation for creating a scrabble game.  **In this project we will NOT create a full Scrabble game.**

### Learning Goals
- Use __Test Driven Development (TDD)__ to write tests and code in parallel
- Create class and instance methods according to requirements
- Utilize Single Responsibility Principle to reduce code dependencies
- Utilize composition between classes, where appropriate

## Getting Started
This is [Stage 2](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/rule-of-three.md) pair project.

From the project root, you should be able to execute all of your specs by running `rake`. Each Ruby class should be in its own file in `lib/`, and the entire project should be in a `module` called `Scrabble`. You will need to use `require`, `require_relative`, `include` and/or `extend` to tell Ruby how to work with classes in multiple files.

### Tests
We will use [minitest](https://github.com/seattlerb/minitest) for this project. This is the same test framework that we've used for your previous project. Your spec descriptions should be meaningful and organized into `describe` blocks that reflect your intent on how to use the code.

To set up tests for your project, you will need to create a `Rakefile` and a `specs` directory. Use a Rakefile from an older project to create this Rakefile. It may be helpful to create a `spec_helper.rb` file. For reference, look back at our lecture on [using SimpleCov and creating spec helpers](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/00-programming-fundamentals/code-coverage-and-simplecov.md).

Do not move onto a new tier of requirements until the minimum requirements of the previous tier are complete and your specs are green across the board. Use __TDD__ to drive your development and document your edge cases.

### What We Provide
We have provided some boilerplate code for your Scrabble game, in `wave-1-game.rb`, `wave-2-game.rb`, and `wave-3-game.rb`. Running `$ ruby wave-1-game.rb` will begin a command-line game that uses your Scrabble code. The boilerplate code will break the first time you run it: working through the waves specified below should create a running version of the game. **Implementing code to make this game run is not a substitute for TDD or writing tests**. It is simply there for you and your pair to reference how the Game may run during each wave, to have better perspective of what your program can do, and to have exposure to legacy code. We fully expect you to create the specified classes below strictly through TDD.

### Pair Programming
Utilize good pair programming practices. Refer to articles from the [Agile Alliance](http://guide.agilealliance.org/guide/pairing.html) and the [Agile Institute](http://powersoftwo.agileinstitute.com/2015/02/benefits-of-pair-programming-revisited.html) if you need a refresher for some best practices. Switch _driver_ and _navigator_ roles often. When there is uncertainity or confusion, step away from the keyboard and discuss, plan, and document on paper or whiteboard before continuing.

## Baseline
### Setup
1. You'll be working with an assigned pair. High-five your pair.
1. Choose **one person** to fork the project repo.
1. Add the other person in the pair (who didn't fork) to the forked repo as a _collaborator_. Instructions [here](https://help.github.com/articles/inviting-collaborators-to-a-personal-repository/).
1. Both individuals will clone the forked repo: `$ git clone [YOUR FORKED REPO URL]`
1. Both individuals `cd` into the dir created.
1. Both individuals install needed tools via Terminal: `$ gem install simplecov`

### Requirements
#### Pair Plan
First, come up with a "plan of action" for how you want to work as a pair. Discuss your learning style, how you prefer to receive feedback, and one team communication skill you want to improve with this experience. Second, review the requirements for Wave 1 and come up with a "plan of action" for your implementation.

#### Implementation
- Create a `Scrabble` module at the project root.
- Create a `Scrabble::Scoring` **class** which contains some sort of data structure to store the **individual letter scores** listed below.
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
Create a `Scrabble::Scoring` class with __full unit testing/specs__. You should have a spec that tests all pieces of functionality and logic. The class should have the following **class methods**:

- `self.score(word)`: returns the total score for the given word. The word is input as a string (case insensitive). The chart in the baseline requirements shows the point value for a given letter.
  - A seven letter word means that a player used all the tiles. Seven letter words receive a __50__ point bonus.
- `self.highest_score_from(array_of_words)`: returns **the word in the array with the highest score**. In the case of tie, use these tiebreaking rules:
    - It’s better to use fewer tiles, in the case of a tie, prefer the word with the fewest letters.
    - There is a bonus for words that are seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
    - If the there are multiple words that are the same score and same length, pick the first one in the supplied list.

## Wave 2
### Primary Requirements
Create a `Scrabble::Player` class with __full unit testing/specs__. You should have a spec that tests all pieces of functionality and logic. The only required parameter for instances of the class is the player's `name`. Instances of the class should repond to the following messages (note, this does not necessarily mean that each of these need to be written as _new methods_):

- `#name`: returns the value of the `@name` instance variable
- `#plays`: returns an Array of the words played by the player
- `#play(word)`: Adds the input word to the `plays` Array
    - Returns `false` if player has already won
    - Returns the score of the `word`
- `#total_score`: Returns the sum of scores of played words
- `#won?`: If the player has over 100 points, returns `true`, otherwise returns `false`
    - This should be a private method
- `#highest_scoring_word`: Returns the highest scoring played word
- `#highest_word_score`: Returns the `highest_scoring_word` score

For example,
```ruby
player = Scrabble::Player.new("Ada")
player.name #=> "Ada"
```

## Wave 3
### Primary Requirements
#### `TileBag`
Create a `Scrabble::TileBag` class with __full unit testing/specs__. You should have a spec that tests all pieces of functionality and logic. It should have the following class and instance methods:

- `#initialize` Should set up the instance with a collection of all default tiles
- `#draw_tiles(num)` returns a collection of random tiles, removes the tiles from the default set
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
Create specs for and add to the `Player` class the following instance methods:

- `#tiles` a collection of letters that the player can play (max 7)
- `#draw_tiles(tile_bag)` fills tiles array until it has 7 letters from the given tile bag
    - It is not in the primary requirements to modify the existing `#play(word)` to use `#tiles` or check against the player's tiles

### Optional Enhancements
- Modify in `Player` the `#play(word)` method to only allow the player to play words using letters that the player has tiles for.
- Create a `Scrabble::Dictionary` class that includes a method (class or instance) for searching a list of words to determine if a given word is valid (__must have tests__).
- Create a `Scrabble::Board` class (__must have tests__) that has a matrix (array of arrays) of tile places. Check if a word can be played on a given tile place in a certain direction (up/down or left/right).
