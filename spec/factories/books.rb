# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "#{Faker::Book.title} - Edition #{n}" }
    isbn      { [:isbn, Faker::Barcode.isbn].join }
    in_stock  { true }
  end
end
