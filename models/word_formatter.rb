class WordFormatter

  def initialize(word)
    @word = word
  end

  def postcode_to_caps
    capital_postcode = @word.upcase
    return capital_postcode
  end

  def camel_case_word
    @word.split(' ').collect! {|word| word.capitalize}.join
  end

  def change_to_capitals
    @word.split(' ').collect! {|word| word.capitalize}.join(' ')
  end  

end