class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    #Tweet was already published
    return if tweet.published?
    
    #Tweet was updated to publish later
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end
