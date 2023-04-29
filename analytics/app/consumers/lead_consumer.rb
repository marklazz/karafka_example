# frozen_string_literal: true

# Example consumer that prints messages payloads
class LeadConsumer < ApplicationConsumer
  def consume
    messages.each { |message| Rails.logger.info message.payload }
  end

  # Run anything upon partition being revoked
  # def revoked
  # end

  # Define here any teardown things you want when Karafka server stops
  # def shutdown
  # end
end
