# frozen_string_literal: false

require 'rails_helper'

RSpec.describe CleanBookJob, type: :job do
  let(:job) { described_class }

  describe '#perform' do
    let(:title) { 'H#el|l@o' }
    let(:perform_now) { job.perform_now }

    before(:each) do
      @book = create(:book, title:)
    end

    it 'will filter book title' do
      expect { perform_now }
        .to change { @book.reload.title }
        .from(title)
        .to('Hello')
    end
  end

  describe '#filter' do
    subject { job.new.filter(data) }

    context 'will filter out @' do
      let(:data) { 'Hell@o' }

      it { is_expected.to eq('Hello') }
    end

    context 'will filter out #' do
      let(:data) { 'Hell#o' }

      it { is_expected.to eq('Hello') }
    end

    context 'will filter out |' do
      let(:data) { 'Hell|o' }

      it { is_expected.to eq('Hello') }
    end
  end
end
