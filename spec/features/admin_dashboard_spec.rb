require 'rails_helper'

describe 'admin dashboard' do
	it 'cannot be accessed without signing in' do
		visit admin_root_path
		expect(current_path).to eq(new_user_session_path)
	end

	it 'does not allow users to access without being an AdminUser' do
		@user = FactoryGirl.create(:user)
		login_as(@user, :scope => :user)

		visit admin_root_path
		expect(current_path).to eq(root_path)
	end

	it 'can be reach by AdminUser' do
		@admin_user = FactoryGirl.create(:admin_user)
		login_as(@admin_user, :scope => :user)

		visit admin_root_path
		expect(page.status_code).to eq(200)
	end

end