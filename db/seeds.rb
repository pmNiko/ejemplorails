joeUser = User.new(
  :email                 => "joe@example.com",
  :password              => "12345678",
  :password_confirmation => "12345678"
)
joeUser.add_role :admin
joeUser.save!

janeUser = User.new(
  :email                 => "jane@example.com",
  :password              => "12345678",
  :password_confirmation => "12345678"
)
janeUser.save!

Category.create!(name: 'OOP')
Category.create!(name: 'Programing')
Category.create!(name: 'Smalltalk')

for i in 0..15
  Article.create!({
    title: "Post number #{i}",
    text: "My #{i} post!",
    author: joeUser,
    :categories => Category.where(:name =>['OOP', 'Programing'])
  });
end

Article.create!(title: 'Hi everybody!',  text: "This is Jane's first post", author: janeUser,
                :categories => Category.where(:name =>['OOP', 'Smalltalk']));
