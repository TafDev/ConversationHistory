class Project < ApplicationRecord
  has_many :comments, dependent: :destroy

  enum status: {
    not_started: 'not_started',
    in_progress: 'in_progress',
    completed: 'completed'
  }

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
end
