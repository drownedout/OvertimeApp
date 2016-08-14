FactoryGirl.define do 
	factory :post do
		date Date.today
		rationale "Some rationale"
		user_id
	end
	factory :second_post, class: "Post" do
		date Date.yesterday
		rationale "Some other rationale"
		user_id
	end
end