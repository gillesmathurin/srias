FactoryGirl.define do
	factory :partenaire do
		nom 			"nom du partenaire"
		description		"une description du partenaire"
		category
		link			"http://www.linktopartenaire.com"
		logo_link		"http://www.logolink.com"
		# TODO : add the logo attachment

		factory :partenaire_with_logo_attachment do
			logo { File.new(File.join(Rails.root, '/spec/fixtures/Moi.jpg')) }
		end
	end
end