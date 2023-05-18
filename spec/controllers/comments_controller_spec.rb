require 'rails_helper'

RSpec.describe CommentsController do
  describe 'POST #create' do
    let(:project) { create :project }
    let(:comment) { Faker::Fantasy::Tolkien.poem }

    context 'with valid parameters' do
      let(:create_comment) do
        post :create, params: {
          project_id: project.id,
          comment: { body: comment, username: Faker::Fantasy::Tolkien.character }
        }
      end

      it 'creates a new comment' do
        expect { create_comment }.to change(Comment, :count).by(1)
      end

      it 'redirects to the project show page' do
        create_comment

        expect(response).to redirect_to(project)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new comment' do
        expect do
          post :create, params: { project_id: project.id, comment: { body: '' } }
        end.not_to change(Comment, :count)
      end

      it 'redirects to the project show page with an alert', :aggregate_failures do
        post :create, params: { project_id: project.id, comment: { body: '' } }

        expect(response).to redirect_to(project)
        expect(flash[:alert]).to eq 'Failed to add comment.'
      end
    end
  end
end
