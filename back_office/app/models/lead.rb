class Lead < ApplicationRecord
  belongs_to :user
  after_create :produce_event_to_karafka

  def produce_event_to_karafka
    Karafka.producer.produce_sync(topic: 'lead', payload: payload.to_json)
  end

  def payload
    {
      user: user.attributes.slice('email', 'first_name', 'last_name', 'active'),
      lead: attributes
    }
  end
end
