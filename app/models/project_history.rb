class ProjectHistory < ApplicationRecord
  belongs_to :project

  enum event_type: {
    comment: 0,
    status_change: 1
  }

  validates :event_type, presence: true, inclusion: { in: event_types.keys }
  validates :event_body, presence: true

  scope :comments, -> { where(event_type: :comment) }
  scope :status_changes, -> { where(event_type: :status_change) }
end
