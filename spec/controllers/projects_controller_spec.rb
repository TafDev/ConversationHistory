require 'rails_helper'

RSpec.describe ProjectsController do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index

      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:project) { create(:project) }

    it 'returns a success response' do
      get :show, params: { id: project.id }

      expect(response).to be_successful
    end

    context 'when project is invalid' do
      it 'returns an error', :aggregate_failures do
        get :show, params: { id: 'invalid' }

        expect(response).to have_http_status :found
        expect(flash[:alert]).to eq('Project not found.')
      end
    end
  end

  describe 'PATCH #update' do
    subject(:update_project) do
      patch :update, params: { id: project.id, project: { status: new_status } }
    end

    let!(:project) { create(:project) }
    let(:new_status) { 'in_progress' }

    context 'with valid parameters' do
      it 'updates the project status' do
        update_project

        expect(project.reload.status).to eq('in_progress')
      end

      it 'creates a project history entry for status change', :aggregate_failures do
        update_project

        expect(project.project_histories.last.event_type).to eq('status_change')
        expect(project.project_histories.last.event_body).to eq('status changed to in_progress')
      end

      it 'redirects to the updated project' do
        update_project

        expect(response).to redirect_to(project)
      end

      it 'sets a success flash message' do
        update_project

        expect(flash[:success]).to eq(I18n.t('projects.updated'))
      end
    end

    context 'with invalid parameters' do
      let(:new_status) { '' }

      it 'does not update the project' do
        update_project

        expect(project.reload.status).not_to eq('')
      end

      it 'does not create a project history entry' do
        expect { update_project }.not_to change(ProjectHistory, :count)
      end

      it 'sets an error flash message' do
        update_project

        expect(flash[:error]).to eq(I18n.t('projects.failed'))
      end
    end
  end
end
