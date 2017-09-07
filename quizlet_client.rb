require 'net/http'
require 'uri'
require 'json'

class QuizletClient
  def initialize(endpoint, client_id, set_id)
    @uri = URI.parse("#{endpoint}/#{set_id}?client_id=#{client_id}")
  end

  def get
    @response = JSON.parse(Net::HTTP.get(@uri))
    @response['terms']
  end
end
