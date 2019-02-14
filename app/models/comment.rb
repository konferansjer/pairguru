class Comment < ApplicationRecord
  default_scope { order(created_at: :desc) }  

  belongs_to :user
  belongs_to :movie

  validates :user_id, uniqueness: { scope: :movie_id, message: 'Movie aready commented' }
  validates :content, :user_id, :movie_id, presence: true
end
