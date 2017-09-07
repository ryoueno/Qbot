require 'bundler/setup'
require 'sinatra'
require 'twitter'
require 'dotenv'
require_relative 'twitter_client'
require_relative 'quizlet_client'
require_relative 'formatter'

get '/' do
  # Load envirionment variables.
  Dotenv.load

  # Get terms and definitions from Quizlet.
  quizlet = QuizletClient.new(ENV['QUIZLET_SET_URL'], ENV['QUIZLET_CLIENT_ID'], ENV['QUIZLET_SET_ID'])
  texture = quizlet.get.map {|term| Formatter.format(term)}

  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
  end

  # Tweet sample of texture.
  twitter = TwitterClient.new(client, texture)
  twitter.tweet
end
