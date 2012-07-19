FactoryGirl.define do
	sequence :email do |n|
		"email_#{n}@mail.com"
	end

	sequence :login do |n|
		"login_#{n}"
	end

	factory :user do
		login									
		email
		role				  "admin"
		password			  "password"
		password_confirmation "password"
	end
end