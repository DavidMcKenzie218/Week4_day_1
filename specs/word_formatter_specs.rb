require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/word_formatter'

class TestWordFormatter < MiniTest::Test

  def setup
    @new_postcode = WordFormatter.new('ka13 7pt')
    @new_word = WordFormatter.new('right left')
    @new_name = WordFormatter.new('DAVID MCKENZIE')
  end

  def test_postcode_to_caps
    assert_equal("KA13 7PT", @new_postcode.postcode_to_caps)
  end

  def test_camel_case_word
    assert_equal("RightLeft", @new_word.camel_case_word)
  end

  def test_change_to_capitials
    assert_equal("David Mckenzie", @new_name.change_to_capitals)
  end

end