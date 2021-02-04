class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, presence: {message: " should be present."}
end
