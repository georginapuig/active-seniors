Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_51GzzOaJduBMelWdwiya2dyRP3PzlViGviSJ9WuzSQQVQLqdYInzHAprF56mdo1vIyFB1vC7MUWqsSEbpGcRKItGz000wS80bmS'],
  secret_key:      ENV['sk_test_51GzzOaJduBMelWdwrIhIU9GXbJInh8htNrKy9reaz0mCtoUOzHjaHvERBcDQti46pifEYuJy1xrKQgESOjas3iun009oaC1iRO']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
