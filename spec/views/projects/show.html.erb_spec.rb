require 'rails_helper'

RSpec.describe 'projects/show' do
  let(:project) { create(:project) }

  before do
    assign(:project, project)
    assign(:comment, Comment.new)
    assign(:project_histories, project.project_histories.order(created_at: :desc))
    render
  end

  it 'renders the project details', :aggregate_failures do
    expect(rendered).to have_content(project.title)
    expect(rendered).to have_content(project.status)
  end

  it 'renders the edit status form', :aggregate_failures do
    expect(rendered).to have_select('project_status')
    expect(rendered).to have_button('Update Status')
  end

  it 'renders the add comment form', :aggregate_failures do
    expect(rendered).to have_field('comment_username')
    expect(rendered).to have_field('comment_body')
    expect(rendered).to have_button('Add Comment')
  end

  it 'renders the project history', :aggregate_failures do # rubocop:disable Metrics/ExampleLength
    expect(rendered).to have_content('Project History')

    project.project_histories.each do |history|
      expect(rendered).to have_content(history.event_type)
      expect(rendered).to have_content(history.event_body)
      expect(rendered).to have_content(history.created_at)
    end
  end
end
