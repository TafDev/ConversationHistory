require 'rails_helper'

RSpec.describe Comment do
  it { should belong_to(:project) }

  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:username) }
  end
end
