class Comment < ApplicationRecord
  belongs_to :micropost
  validates :content, presence: true
end