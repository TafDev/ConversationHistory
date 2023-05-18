require 'rails_helper'

RSpec.describe ProjectsController do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index

      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:project) { create :project }

    it 'returns a success response' do
      get :show, params: { id: project.id }

      expect(response).to be_successful
    end

    context 'when project is invalid' do
      it 'returns an error', :aggregate_failures do
        get :show, params: { id: 'invalid' }

        expect(response).to have_http_status 302
        expect(flash[:alert]).to eq('Project not found.')
      end
    end
  end
end
