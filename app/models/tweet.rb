class Tweet < OpenStruct

  def media
    entities['media'].present? ? entities['media'] : []
  end

  def screen_name
    user['screen_name']
  end

  def profile_image
    user['profile_image_url']
  end

end