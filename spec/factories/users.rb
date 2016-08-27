FactoryGirl.define do 
	sequence :email do |n|
		"test#{n}@example.com"
	end
	factory :user do
		email { generate :email }
		first_name "John"
		last_name "Example"
		password "1234567"
		password_confirmation "1234567"
		phone "555555555"
	end
	factory :admin_user, class: "AdminUser" do
		email { generate :email }
		first_name "Sally"
		last_name "Sample"
		password "password"
		password_confirmation "password"
		phone "5555555555"
	end

	factory :non_authorized_user, class: "User" do
		email { generate :email }
		first_name "Non"
		last_name "Authorized"
		password "password"
		password_confirmation "password"
		phone "5555555555"
	end
	
end