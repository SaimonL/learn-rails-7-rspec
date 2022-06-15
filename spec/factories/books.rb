# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "#{Faker::Book.title} - Edition #{n}" }
    pages     { rand(20..1_000) }
    isbn      { Faker::Barcode.isbn }
    in_stock  { true }
  end
end
