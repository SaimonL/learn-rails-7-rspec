class CleanBookJob < ApplicationJob
  queue_as :default

  def perform(*args)
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
