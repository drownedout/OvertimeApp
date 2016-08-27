@user = User.create(email: "test@test.com", 
	password: "password", 
	password_confirmation: "password", 
	first_name: "John", 
	last_name: "Example",
	phone: "8317264639")
puts "User created"

AdminUser.create(email: "test1@test.com", 
	password: "password", 
	password_confirmation: "password", 
	first_name: "Admin", 
	last_name: "Example",
	phone: "8317264639")
puts "AdminUser created"

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"

100.times do |audit_log|
	AuditLog.create!(user_id: User.last.id, status: 0, start_date: (Date.today - 6.days))
end

puts "100 Audit Logs have been created"