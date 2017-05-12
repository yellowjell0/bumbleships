# This method gets the amount of ppl connected
# Redis.new.pubsub("channels", "action_cable/*")

Redis = Redis.new(Rails.application.config_for("cable"))



