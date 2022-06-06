# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 1, maximum: 255 }
  validates :isbn, presence: true, uniqueness: true, length: { minimum: 8 }
  validates :pages, presence: true
end
