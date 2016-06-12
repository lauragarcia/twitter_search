require 'test_helper'

class TwitterControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "index should render correct template" do
    get :index
    assert_template :index
  end

  test "search should assign array of tweets" do
    xhr :get, :search, format: :js

    tweet_client = TwitterClient.new("api_key", "api_secret", "token", "token_secret")
    tweet_client.stubs(:request).returns([Tweet.new, Tweet.new])
    
    assert_not_nil assigns(:tweets)
    
  end
  
end
