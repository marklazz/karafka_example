# frozen_string_literal: true

# Example consumer that prints messages payloads
class LeadConsumer < ApplicationConsumer
  def consume
    Rails.logger.info "[LeadConsumer]: started"
    messages.each do |message|
      payload = message.payload
      user = payload['user']
      lead = payload['lead']
      record = Opportunity.create(
        user_first_name: user['first_name'],
        user_last_name: user['last_name'],
        user_age: (1..40).to_a.sample,
        user_gender: 'M',
        client_company: lead['company'],
        client_location: lead['location'],
        client_role: lead['role']
      )
      Rails.logger.info "[LeadConsumer]: Opportunitiy created: #{record.inspect}"
    end
    Rails.logger.info "[LeadConsumer]: finished"
  end

  # Run anything upon partition being revoked
  # def revoked
  # end

  # Define here any teardown things you want when Karafka server stops
  # def shutdown
  # end
end
