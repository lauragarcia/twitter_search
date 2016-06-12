class TwitterClient

  attr_reader :tweets, :next_query

  BASE_URL = "https://api.twitter.com/1.1/search/tweets.json"

  def initialize(api_key, api_secret, token, token_secret)
    @consumer_key ||= OAuth::Consumer.new api_key, api_secret
    @access_token ||= OAuth::Token.new token, token_secret
  end

  def search(q = nil)
    address = URI("#{BASE_URL}#{q}")
  
    request(address)
  end

  private 
  
  def request(address)
    request = Net::HTTP::Get.new address.request_uri
    http             = Net::HTTP.new address.host, address.port
    http.use_ssl     = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request.oauth! http, @consumer_key, @access_token
    http.start
    response = http.request request
    
    case response.code
      when '200'
        resp = JSON.parse(response.body)
        @tweets = resp['statuses'].map{ |tweet| Tweet.new(tweet)}
        @next_query = resp['search_metadata']['next_results']
      else
        @tweets = []
    end
    @tweets
  end

end