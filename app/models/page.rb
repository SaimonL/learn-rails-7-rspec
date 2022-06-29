# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :book, counter_cache: true

  validates :content, presence: true, length: { minimum: 2 }
end
