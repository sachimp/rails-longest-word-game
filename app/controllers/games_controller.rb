require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
  @letters = params[:letters]
  @word = params[:word]
  response = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}")
  json = JSON.parse(response.read)


  if @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) } && json["found"] == true
    @result = "valid"
  elsif @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) } && json["found"] == false
    @result = "in grid but not a word"
  else
    @result = "invalid"
  end
  end
end
