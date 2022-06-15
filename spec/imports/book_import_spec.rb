# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookImport do
  let(:csv_raw_data) { '' }
  let(:book_import) { described_class.new(csv_raw_data) }
  let(:invalid_book) { Book.create(title: nil) }

  describe '#add_book_report' do
    subject { book_import.add_book_report(book) }

    before(:each) do
      book_import.instance_variable_set(:@report, [])
    end

    context 'with a valid book' do
      let(:book) { create(:book) }

      it { is_expected.to be_kind_of(Array) }
    end

    context 'with a in-valid book' do
      let(:book) { invalid_book }

      it { is_expected.to be_kind_of(Array) }
    end

    describe 'with success generated report' do
      subject { book_import.add_book_report(book).first }

      let(:book) { create(:book) }

      its(['title'])    { is_expected.to eq(book.title) }
      its(['pages'])    { is_expected.to eq(book.pages) }
      its(['isbn'])     { is_expected.to eq(book.isbn) }
      its(['status'])   { is_expected.to eq('successful') }
      its(['error'])    { is_expected.to eq('') }
    end

    describe 'with failed generated report' do
      subject { book_import.add_book_report(invalid_book).first }

      its(['title'])    { is_expected.to eq(invalid_book.title) }
      its(['pages'])    { is_expected.to eq(invalid_book.pages) }
      its(['isbn'])     { is_expected.to eq(invalid_book.isbn) }
      its(['status'])   { is_expected.to eq('failed') }
      its(['error'])    { is_expected.to eq(JSON.pretty_generate(invalid_book.errors.messages)) }
    end
  end

  describe '#str_to_boolean' do
    subject { book_import.str_to_boolean(value) }

    context 'with value being nil' do
      let(:value) { nil }

      it { is_expected.to be_falsy }
    end
    %w[y yes Y YES Yes].each do |value|
      context "with value being: #{value}" do
        let(:value) { value }

        it { is_expected.to be_truthy }
      end
    end

    %w[n No NO].each do |value|
      context "with value being: #{value}" do
        let(:value) { value }

        it { is_expected.to be_falsy }
      end
    end
  end
end
