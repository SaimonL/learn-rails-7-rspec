FactoryBot.define do
  factory :page do
    book
    content { Faker::Lorem.paragraph }
    position { 1 }
    is_published { [true, false].sample }
  end
end
