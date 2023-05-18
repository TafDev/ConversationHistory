# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times { Project.create!(title: Faker::ProgrammingLanguage.name, status: 'not_started') }
Project.all.each do |project|
  comment1 = Comment.create!(username: Faker::Movies::HarryPotter.character, body: Faker::Movies::HarryPotter.quote,
                             project:)
  ProjectHistory.create!(event_type: 'comment', event_body: comment1.body, project:)

  project.update!(status: 'in_progress')
  ProjectHistory.create!(event_type: 'status_change', event_body: 'in_progress', project:)

  comment2 = Comment.create!(username: Faker::Movies::HarryPotter.character, body: Faker::Movies::HarryPotter.quote,
                             project:)
  ProjectHistory.create!(event_type: 'comment', event_body: comment2.body, project:)
end
