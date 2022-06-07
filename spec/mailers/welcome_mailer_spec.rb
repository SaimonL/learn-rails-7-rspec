# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeMailer, type: :mailer do
  let(:mailer) { described_class }
  let(:name) { 'John Doe' }

  describe '#new_user' do
    let(:new_user_mailer) { mailer.new_user(name) }

    it 'sends an email' do
      expect { new_user_mailer.deliver_now }.to change(ActionMailer::Base.deliveries, :count).by(1)
    end

    it 'has valid subject' do
      expect(new_user_mailer.subject).to eql('Welcome New User')
    end

    it 'has valid to address' do
      expect(new_user_mailer.to).to eql(['new-user@example.com'])
    end

    it 'has valid from address' do
      expect(new_user_mailer.from).to eql(['from@example.com'])
    end

    it 'has valid to address' do
      expect(new_user_mailer.to).to eql(['new-user@example.com'])
    end

    it 'will mention user name' do
      expect(new_user_mailer.body.encoded).to match(name)
    end
  end
end
