intents = Stripe::PaymentIntent.list
intents.auto_paging_each do |pi|
  break unless Time.at(pi.created) >= 24.hours.ago
  next unless pi.status == 'requires_payment_method'
  next unless pi.metadata['user_id'].present?
  next if pi.metadata['emailed'].present?
  user = User.find(pi.metadata['user_id'])
  symbol = { 'GBP' => '£', 'USD' => '$', 'EUR' => '€' }[pi.currency]
  amount = pi.amount / 100
  DonationMailer.with(symbol: symbol, amount: amount, email: user.email, name: user.username, intent: pi)
                .donation_uncaptured.deliver_now
  Stripe::PaymentIntent.update(pi.id, { metadata: { emailed: true } })
  puts "Mailed ##{user.id} for PaymentIntent #{pi.id}"
end
