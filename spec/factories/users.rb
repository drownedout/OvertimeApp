FactoryGirl.define do 
	factory :user do
		email "test@test.com"
		first_name "Mike"
		last_name "Michaelson"
		password "1234567"
		password_confirmation "1234567"
	end
	factory :admin_user, class: "AdminUser" do
		email "test2@test.com"
		first_name "Sally"
		last_name "Sample"
		password "password"
		password_confirmation "password"
	end
end