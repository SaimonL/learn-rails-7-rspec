require 'rails_helper'

RSpec.describe BooksHelper, type: :helper do
  describe 'render_title' do
    subject { helper.render_title(title) }

    let(:title) { 'saimon' }

    it { is_expected.to eq(title.capitalize) }
  end
end
