# frozen_string_literal: true

namespace :books do
  desc 'Imports books from CSV file'
  task :import, [:file_location] => [:environment] do |_task, args|
    file_location = args[:file_location]

    if file_location.blank?
      Rails.logger.error('File location was not specified.')
      exit 1
    end

    unless File.exist?(file_location)
      Rails.logger.error("File was not found: #{file_location}")
      exit 1
    end

    csv_raw_string = File.read(file_location)
    book_import = BookImport.new(csv_raw_string)
    book_import.process

    report_file_name = File.basename(file_location).prepend('report-')
    report_folder = File.dirname(file_location)
    report_file = [report_folder, report_file_name].join('/')
    book_import.save_csv_report(report_file)

    puts 'Process Complete.'
    exit 0
  end
end
