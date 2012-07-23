FactoryGirl.define do
	factory :fichier do
		manifestation
		offre

		factory :fichier_with_imagefile do
			fichier { File.new(File.join(Rails.root, '/spec/fixtures/Moi.jpg')) }
		end

		factory :fichier_with_file do
			fichier { File.new(File.join(Rails.root, '/spec/fixtures/MaquetteClinLeCoin.pdf'))}
		end
	end
end