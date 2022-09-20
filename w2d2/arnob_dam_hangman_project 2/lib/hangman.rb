class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  #PART 1

  def self.random_word
    DICTIONARY.sample
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length,'_') 
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    if attempted_chars.include?(char)
      true
    else
      false
    end
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index {|char2,i| indices << i if char2 == char}
    indices
  end

  def fill_indices(char, arr)
    arr.each {|i| guess_word[i] = char}
  end
  
  #PART 2

  def try_guess(char)
    # if Hangman.already_attempted?(char)
    #   p 'that has already been attempted'
    #   false
    # else
    #   attempted_chars << char
    #   true
    # end

    
  end

  
end
