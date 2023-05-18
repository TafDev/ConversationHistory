require 'rails_helper'

RSpec.describe Comment do
  it { is_expected.to belong_to(:project) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:username) }
  end
end
