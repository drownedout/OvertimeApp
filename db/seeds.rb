@user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "John", last_name: "Example")
puts "User created"

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"