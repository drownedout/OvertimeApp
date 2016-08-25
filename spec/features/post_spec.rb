require 'rails_helper'

describe 'navigate' do
	let(:user) { FactoryGirl.create(:user) }

	let(:post) do 
		Post.create(date: Date.today, rationale: "Rationale", user_id: user.id)
	end

	before do
		login_as(user, :scope => :user)
	end

	describe 'index' do
		before do 
			visit posts_path
		end
		it 'can be reached succesfully' do
			expect(page.status_code).to eq(200)
		end

		it 'has a title of Posts' do
			expect(page).to have_content(/Posts/)
		end

		it 'has a list of Posts' do
			@post1 = FactoryGirl.build_stubbed(:post)
			@post2 = FactoryGirl.build_stubbed(:second_post)
			visit posts_path
			expect(page).to have_content(/Rationale|other/)
		end

		it 'has a scope so only the creator can see own post' do
			@user2 = User.create(first_name: "Micheale", last_name: "Two", email: "testing@test.com",
				password: "password", password_confirmation: "password")
			@post3 = Post.create(date: Date.today, rationale: "This post shouldn't be here", user_id: @user2.id)

			visit posts_path

			expect(page).to_not have_content(/This post shouldn't be here/)
		end
	end

	describe 'new' do
		it 'has a link from the home page' do
			visit root_path

			click_link("new_post")
			expect(page.status_code).to eq(200)
		end
	end

	describe 'creation' do
		before do
			visit new_post_path
		end

		it 'new form that can reached' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "Some rationale"
			click_on "Save"
			expect(page).to have_content("Some rationale")
		end

		it 'will have a user associate with a post' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "User Association"
			click_on "Save"
			expect(User.last.posts.last.rationale).to eq("User Association")
		end
	end

	describe 'edit' do
		it 'can be edited' do
			visit edit_post_path(post)

			fill_in "post[date]", with: Date.today
			fill_in "post[rationale]", with: "Reasons"
			click_on "Save"

			expect(page).to have_content("Reasons")
		end
		it 'can be edited by a non authorized user' do
			logout(:user)
			@non_authorized_user = FactoryGirl.create(:non_authorized_user)
			login_as(@non_authorized_user, :scope => :user)

			visit edit_post_path(post)
			expect(current_path).to eq(root_path)
		end
	end

	describe 'delete' do

		it 'can be deleted' do
			post.update(user_id: user.id)
			visit posts_path

			click_link("delete_post_#{post.id}_from_index")
			expect(page.status_code).to eq(200)
		end
	end

end