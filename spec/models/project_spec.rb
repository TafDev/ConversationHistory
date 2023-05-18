require 'rails_helper'

RSpec.describe Project do
  it { is_expected.to have_many(:comments) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe 'when status is updated' do
    let(:project) { create(:project) }

    context 'when status is valid' do
      %w[not_started in_progress completed].each do |new_status|
        it "updates the status to #{new_status}" do
          project.update!(status: new_status)
          expect(project.reload.status).to eq new_status
        end
      end
    end

    context 'when status is not valid' do
      it 'does not update the status' do
        expect(project.reload.status).to eq 'not_started'
      end
    end
  end
end
