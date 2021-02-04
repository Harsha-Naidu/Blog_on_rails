# rails g migration add_user_references_to_posts user:references

class AddUserReferencesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :user, foreign_key: true
  end
end
