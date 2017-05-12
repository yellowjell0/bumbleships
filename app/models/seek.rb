class Seek < ApplicationRecord

  def self.number_of_subcribers
    Redis.new.pubsub("channels", "action_cable/*").count
  end

end
