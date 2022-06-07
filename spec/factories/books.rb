# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "Book #{n} Title" }
    pages     { rand(20..1000) }
    isbn      { Faker::Barcode.isbn }
    in_stock  { true }
  end
end
