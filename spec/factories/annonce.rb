FactoryGirl.define do
	factory :annonce do
		message "Some text for annonce message"
		starts_at { Time.now - 1.day }
		ends_at { Time.now + 1.day }
		# TODO : add the fixtures for the attachment
	end
end