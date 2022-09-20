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

    fill_indices(char, get_matching_indices(char))

    if get_matching_indices(char).length == 0
      @remaining_incorrect_guesses -= 1
    end

    if already_attempted?(char)
      p 'that has already been attempted'
      return false
    else
      attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    p 'Enter a char:'
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @secret_word == guess_word.join("")
      p 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if remaining_incorrect_guesses == 0
      p 'LOSE'
      true
    else
      false
    end
  end
  
  def game_over?
    if win? || lose?
      p @secret_word
      true
    else
      false
    end
  end
end
