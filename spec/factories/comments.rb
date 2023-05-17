FactoryBot.define do
  factory :comment do
    body { Faker::Quotes::Shakespeare.hamlet_quote }
    username { Faker::Superhero.name }

    project
  end
end
