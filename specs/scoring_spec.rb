require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/scoring'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Scoring' do
  describe 'score' do
    it 'correctly scores simple words' do
      expect(Scrabble::Scoring.score('dog')).must_equal 5
      expect(Scrabble::Scoring.score('cat')).must_equal 5
      expect(Scrabble::Scoring.score('pig')).must_equal 6
    end

    it 'adds 50 points for a 7-letter word' do
      expect(Scrabble::Scoring.score('academy')).must_equal 65
    end

    it 'handles all upper- and lower-case letters' do
      expect(Scrabble::Scoring.score('dog')).must_equal 5
      expect(Scrabble::Scoring.score('DOG')).must_equal 5
      expect(Scrabble::Scoring.score('DoG')).must_equal 5
    end

    it 'returns nil for strings containing bad characters' do
      expect(Scrabble::Scoring.score('#$%^')).must_be_nil
      expect(Scrabble::Scoring.score('char^')).must_be_nil
      expect(Scrabble::Scoring.score(' ')).must_be_nil
    end

    it 'returns nil for words > 7 letters' do
      expect(Scrabble::Scoring.score('abcdefgh')).must_be_nil
    end

    it 'returns nil for empty words' do
      expect(Scrabble::Scoring.score('')).must_be_nil
    end
  end

  describe 'highest_score_from' do
    it 'returns nil if no words were passed' do
    end

    it 'returns the only word in a length-1 array' do
    end

    it 'returns the highest word if there are two words' do
    end

    it 'if tied, prefer a word with 7 letters' do
    end

    it 'if tied and no word has 7 letters, prefers the word with fewer letters' do
    end

    it 'returns the first word of a tie with same letter count' do
    end
  end
end
