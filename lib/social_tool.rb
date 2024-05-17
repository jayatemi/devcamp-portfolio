module SocialTool
  def self.user_details
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.twitter[:api_key]
      config.consumer_secret     = Rails.application.credentials.twitter[:api_secret_key]
      config.access_token        = Rails.application.credentials.twitter[:access_token]
      config.access_token_secret = Rails.application.credentials.twitter[:access_token_secret]
      config.bearer_token        = Rails.application.credentials.twitter[:bearer_token]
    end

    begin
      user = client.user
      {
        id: user.id,
        name: user.name,
        username: user.screen_name,
        description: user.description,
        profile_image_url: user.profile_image_url_https.to_s,
        followers_count: user.followers_count,
        following_count: user.friends_count,
        tweet_count: user.statuses_count,
        listed_count: user.listed_count
      }
    rescue Twitter::Error => e
      "Twitter API Error: #{e.message}"
    end
  end
end
