FactoryGirl.define do 
	factory :post do
		date Date.today
		rationale "Some rationale"
		overtime_request 2.5
		user
	end
	factory :second_post, class: "Post" do
		date Date.yesterday
		rationale "Some other rationale"
		overtime_request 3.5
		user
	end

	factory :post_from_another_user, class: "Post" do
		date Date.today
		rationale "I didn't do it"
		overtime_request 2.7
		non_authorized_user
	end

end