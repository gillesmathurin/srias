FactoryGirl.define do
	factory :annonce do
		message "Some text for annonce message"
		starts_at { Time.now - 1.day }
		ends_at { Time.now + 1.day }
		image { File.new(File.join(Rails.root, '/spec/fixtures/Moi.jpg')) }

		factory :annonce_without_image do
			image nil
		end
	end
end