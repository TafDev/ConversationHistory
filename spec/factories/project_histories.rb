FactoryBot.define do
  factory :project_history do
    event_type { 'comment' }
    event_body { Faker::Quotes::Shakespeare.hamlet_quote }

    project

    trait :status_change do
      event_type { 'status_change' }
      event_body { 'Status changed to In Progress.' }
    end
  end
end
