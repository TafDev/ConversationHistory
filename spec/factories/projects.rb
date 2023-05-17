FactoryBot.define do
  factory :project do
    title { Faker::Superhero.name }
    status { :not_started }
  end
end
