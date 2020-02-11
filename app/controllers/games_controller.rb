require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    counter = 0

    while counter < 10
      @letters << ('a'..'z').to_a.sample
      counter += 1
    end

    @letters
  end

  def score
    @word = params[:word]

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = open(url).read
    @word_hash = JSON.parse(word_serialized)

    @word = @word.split("")

    # @word.each do |letter|
    #  @letter = letter
    # end
  end
end
