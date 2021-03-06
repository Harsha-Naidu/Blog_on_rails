# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.delete_all
Comment.delete_all
User.delete_all

NUM_POSTS=50
NUM_USER=10

PASSWORD='supersecret'
super_user= User.create(
    name: 'Jon Smith',  
    email: 'js@winterfell.gov',
    password: PASSWORD,
    is_admin: true
)


NUM_USER.times do
    name= Faker::Name.name  
    User.create(
        name:name,
        email: "#{name}@example.com",
        password: PASSWORD
    )
    end
    users=User.all


NUM_POSTS.times do
    created_at=Faker::Date.backward(days: 365*5)
   p=Post.create(
       title: Faker::Verb.base,
       body: Faker::ChuckNorris.fact,
       created_at: created_at,
       updated_at: created_at,
       user: users.sample
   )

   if p.valid?
    p.comments = rand(0..15).times.map do 
        Comment.new(
            body: Faker::GreekPhilosophers.quote,
            user: users.sample  )
        end
    
    end
end

post=Post.all
comment=Comment.all

puts Cowsay.say("Generated #{post.count} posts.",:frogs)
puts Cowsay.say("Generated #{comment.count} comments.",:beavis)
puts Cowsay.say("Generated #{users.count} users.",:dragon)
puts Cowsay.say("Login with  #{super_user.email} and password:#{PASSWORD}.",:koala)