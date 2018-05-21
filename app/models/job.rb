class Job < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }

  scope :search, -> search {where("jobs.title LIKE '%#{search}%' OR jobs.description LIKE '%#{search}%'")}

  paginates_per 15

  belongs_to :user
end
