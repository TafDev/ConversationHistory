require 'rails_helper'

RSpec.describe ProjectHistory do
  describe 'validations' do
    it { should validate_presence_of(:event_type) }
    it { should validate_presence_of(:event_body) }
  end

  describe 'associations' do
    it { should belong_to(:project) }
  end

  describe 'enums' do
    it { should define_enum_for(:event_type).with_values(comment: 0, status_change: 1) }
  end

  describe 'scopes' do
    let!(:project) { create(:project) }
    let!(:comment_history) { create(:project_history, project: project, event_type: 'comment') }
    let!(:status_change_history) { create(:project_history, project: project, event_type: 'status_change') }

    describe '.comments' do
      it 'returns project history records with event type of comment' do
        expect(project.project_histories.comments).to contain_exactly(comment_history)
      end
    end

    describe '.status_changes' do
      it 'returns project history records with event type of status_change' do
        expect(project.project_histories.status_changes).to contain_exactly(status_change_history)
      end
    end
  end
end
