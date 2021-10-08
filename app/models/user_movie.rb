class UserMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  enum status: [:to_watch, :watched]
end
