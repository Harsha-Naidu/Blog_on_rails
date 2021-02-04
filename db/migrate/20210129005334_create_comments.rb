# one to many
#  rails g model comment body:text post:references

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post,foreign_key: true

      t.timestamps
    end
  end
end
