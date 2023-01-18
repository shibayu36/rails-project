require 'rails_helper'

RSpec.describe User, type: :model do
  context 'factory bot test' do
    let(:user) { create(:user) }

    it 'creates record' do
      expect(user.id).to be_present
    end
  end
end
