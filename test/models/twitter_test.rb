require 'test_helper'
 
class TwitterTest < ActiveSupport::TestCase
  
  test "method search should return array of tweets" do
    tweet_client = TwitterClient.new("api_key", "api_secret", "token", "token_secret")
    tweet_client.stubs(:request).returns([Tweet.new, Tweet.new])
    assert_equal 2, tweet_client.search("love").count
  end
end