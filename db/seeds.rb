# frozen_string_literal: true

book = Book.create!(
  title: 'Alice In Wonder Land',
  isbn: SecureRandom.uuid,
  in_stock: true
)

book.pages.create!(
  content: 'Alice was sleeping....',
  position: 1
)

book.pages.create!(
  content: 'Alice woke up....',
  position: 2
)
