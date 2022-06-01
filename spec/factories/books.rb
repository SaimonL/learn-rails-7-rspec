FactoryBot.define do
  factory :book do
    title     { Faker::Book.title.gsub("'", '') }
    pages     { rand(20..1000) }
    isbn      { Faker::Barcode.isbn }
    in_stock  { true }
  end
end
