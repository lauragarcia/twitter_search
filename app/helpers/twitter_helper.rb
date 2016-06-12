require 'twitter-text'
module TwitterHelper

  include Twitter::Autolink
 
  def twitter_text(tweet)
    text = tweet['text']
    text = auto_link(text)
    text ? text.html_safe : ''
  end

  def profile_url(screen_name)
    "https://twitter.com/#{screen_name}"
  end
end
