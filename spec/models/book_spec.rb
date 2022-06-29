# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { should have_many(:pages) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_length_of(:title).is_at_least(1).is_at_most(255) }

    it { should validate_presence_of(:isbn) }
    it { should validate_uniqueness_of(:isbn) }
    it { should validate_length_of(:isbn).is_at_least(8) }
  end
end
