# frozen_string_literal: true

# Makes sure that all the book titles are clean
class CleanBookJob < ApplicationJob
  queue_as :default

  def perform
    Book.find_in_batches(batch_size: 100) do |books|
      books.each do |book|
        book.update(title: filter(book.title))
      end
    end
  end

  def filter(title)
    title.gsub!('`', '')
    title.gsub!('~', '')
    title.gsub!('@', '')
    title.gsub!('#', '')
    title.gsub!('^', '')
    title.gsub!('|', '')
    title
  end
end
