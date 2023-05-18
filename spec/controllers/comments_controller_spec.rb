require 'rails_helper'

RSpec.describe CommentsController do
  describe 'POST #create' do
    let(:project) { create(:project) }
    let(:comment) { Faker::Fantasy::Tolkien.poem }
    let(:project_id) { project.id }
    let(:create_comment) do
      post :create, params: {
        project_id:,
        comment: { body: comment, username: Faker::Fantasy::Tolkien.character }
      }
    end

    context 'with valid parameters' do
      it 'creates a new comment and project history entry' do
        expect do
          post :create, params: { project_id: project.id, comment: { body: 'Test comment', username: 'JohnDoe' } }
        end.to change(Comment, :count).by(1).and change(ProjectHistory, :count).by(1)
      end

      it 'redirects to the project show page' do
        create_comment

        expect(response).to redirect_to(project)
      end
    end

    context 'with invalid project_id' do
      let(:project_id) { 'invalid' }

      it 'returns an error', :aggregate_failures do
        create_comment

        expect(response).to have_http_status :found
        expect(flash[:alert]).to eq('Project not found.')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new comment' do
        expect do
          post :create, params: { project_id:, comment: { body: '' } }
        end.not_to change(Comment, :count)
      end

      it 'redirects to the project show page with an alert', :aggregate_failures do
        post :create, params: { project_id:, comment: { body: '' } }

        expect(response).to redirect_to(project)
        expect(flash[:alert]).to eq 'Failed to add comment.'
      end
    end
  end
end
