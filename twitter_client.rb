class TwitterClient
  def initialize(client, texture)
    @texture = texture
    @client = client
  end

  def tweet
    tweet = @texture.sample
    update(tweet)
  end

  private

  def update(tweet)
    begin
      @client.update(tweet)
    rescue => e
      puts e
    end
  end
end
