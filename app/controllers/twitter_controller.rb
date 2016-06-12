class TwitterController < ApplicationController
  def index
  end

  def search
    query = params[:query].present? ? params[:query] : "?q=#{params[:q]}&count=10"
    @tweets = twitter_client.search(query)
    @next_query = twitter_client.next_query
    if params[:q].present?
      recent << params[:q].to_s unless recent.include?(params[:q])
    end
  end

  private

  def recent
    session[:recent] ||= []
  end

  def twitter_client
    @twitter_client ||= TwitterClient.new(API_KEY, API_SECRET, TOKEN, TOKEN_SECRET)
  end

end
