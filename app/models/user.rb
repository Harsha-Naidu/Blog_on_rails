# rails g model user name email password_digest

class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :email,presence: {message: " should be present."},uniqueness: true
    validates :name,presence: {message: "field shouldn't be blank"}
    
    
    has_secure_password
end
