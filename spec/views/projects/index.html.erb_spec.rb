require 'rails_helper'

RSpec.describe 'projects/index' do
  before do
    assign(:projects, [
             create(:project, title: 'Project 1', status: 'in_progress'),
             create(:project, title: 'Project 2', status: 'completed')
           ])
  end

  it 'displays the list of projects', :aggregate_failures do # rubocop:disable Metrics/ExampleLength
    render

    expect(rendered).to have_selector('h1', text: 'Projects')

    expect(rendered).to have_table(class: 'table') do |table|
      expect(table).to have_selector('thead') do |thead|
        expect(thead).to have_selector('th', text: 'Title')
        expect(thead).to have_selector('th', text: 'Status')
      end

      expect(table).to have_selector('tbody') do |tbody|
        expect(tbody).to have_selector('tr', count: 2)
      end
    end
  end
end
