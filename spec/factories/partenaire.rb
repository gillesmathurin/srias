FactoryGirl.define do
	factory :partenaire do
		nom 			"nom du partenaire"
		description		"une description du partenaire"
		category
		link			"http://www.linktopartenaire.com"
		logo_link		"http://www.logolink.com"
		# TODO : add the logo attachment
	end
end