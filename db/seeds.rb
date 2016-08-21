@user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "John", last_name: "Example")
puts "User created"

AdminUser.create(email: "test1@test.com", password: "password", password_confirmation: "password", first_name: "Admin", last_name: "Example")
puts "AdminUser created"

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"