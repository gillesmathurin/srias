FactoryGirl.define do
	factory :offre do
		nom 			"nom de l'offre"
		partenaire		
		date_debut		Date.today - 1.day
		date_fin		Date.today + 2.days
		description		"une description de l'offre"
		# TODO : add the document attachment
	end
end