require 'sinatra'
require 'sinatra/contrib/all'
require 'json'

require_relative './models/word_formatter'

get('/') do
  @output = "Hello, David, bio:- Student at CodeClan"
  erb(:result)
end 

get('/info') do
  @output = "Made by David McKenzie"
  erb(:result)
end

get('/address') do
  content_type(:json)
  result = {
    address: '3 ARGYLE HOUSE',
    building: 'CODEBASE',
    postcode: 'e13 zqf',
    phone: '0131558030',
    institution: 'code clan'
  }
  result.to_json()

  postcode_formatter = WordFormatter.new(result[:postcode])
  institution_formatter = WordFormatter.new(result[:institution])
  address_formatter = WordFormatter.new(result[:address])

  postcode = postcode_formatter.postcode_to_caps
  institution = institution_formatter.camel_case_word
  address = address_formatter.change_to_capitals

  content_type(:html)
  @output = "You are residing at #{institution}, #{address} with a postcode of #{postcode}"
  erb(:result)

end

get('/edit_word/:word1/:word2') do
  word_to_be_edited = "#{params[:word1]} #{params[:word2]}"

  word_formatter = WordFormatter.new(word_to_be_edited)

  word = word_formatter.camel_case_word

  content_type(:json)
  result = {
    word: word
  }
  result.to_json
end