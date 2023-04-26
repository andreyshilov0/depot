class SupportMailbox < ApplicationMailbox
  def process
    binding.pry
    recent_order = Order.where(email: mail.from.to_s).
                         order('created_at desc').
                         first
                         

    SupportRequest.create!(
      email:   mail.from.to_s,
      subject: mail.subject,
      body:    mail.body.to_s,
      order:   recent_order
    )
  end
end
