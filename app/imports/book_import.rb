# frozen_string_literal: false

require 'csv'

# Takes in CSV string containing book details and imports them
class BookImport
  attr_reader :report

  def initialize(csv_string)
    @csv_string = csv_string
  end

  def process
    @report = []
    csv = to_csv

    csv.each do |csv_book|
      create_book(csv_book)
    end
  end

  def create_book(csv_book)
    csv_book['in_stock'] = str_to_boolean(csv_book['in_stock'])

    book = Book.create(csv_book.to_h)

    add_book_report(book)
  end

  def add_book_report(book)
    book_hash = book.as_json

    if book.valid?
      book_hash['status'] = 'successful'
      book_hash['error'] = ''
    else
      book_hash['status'] = 'failed'
      book_hash['error'] = JSON.pretty_generate(book.errors.messages)
    end

    @report << book_hash
  end

  def str_to_boolean(value)
    return false if value.nil?
    return true if value[0].downcase == 'y'

    false
  end

  def to_csv
    CSV.parse(@csv_string, headers: true)
  end

  def save_csv_report(report_location)
    csv_string = "ID,Title,Pages,ISBN,In Stock,Status,Errors\n"

    @report.each do |book|
      book_values = book.except('created_at', 'updated_at').values

      csv_string.concat("#{book_values.to_csv}\n")
    end

    File.write(report_location, csv_string)
  end
end
