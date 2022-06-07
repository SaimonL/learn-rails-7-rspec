# frozen_string_literal: true

# Sends welcome email to new users
class WelcomeMailer < ApplicationMailer
  def new_user(name)
    @name = name

    mail(
      to: 'new-user@example.com',
      subject: 'Welcome New User'
    )
  end
end
