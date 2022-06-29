require 'rails_helper'

RSpec.describe Page, type: :model do
  describe 'associations' do
    it { should belong_to(:book) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(2) }
  end
end
