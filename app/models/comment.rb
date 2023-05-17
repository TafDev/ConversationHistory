class Comment < ApplicationRecord
  belongs_to :project

  validates :username, :body, presence: true
end
