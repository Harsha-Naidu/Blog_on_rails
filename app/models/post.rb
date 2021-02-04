# rails g model post title:string body:text

class Post < ApplicationRecord
    validates :title, presence: {message: 'must be provided'},uniqueness: true
    validates :body , presence: true, length:{minimum: 50}

    has_many :comments, dependent: :destroy

     # ASSOCIATION WITH USER MODEL
     belongs_to :user
end
