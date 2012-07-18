FactoryGirl.define do
	factory :manifestation do
		nom			"manifestation"
		lieu		"qqpart"
		date_debut	Date.today
		date_fin	Date.today + 2.days
		description	"une description"
		# type		"un type"
		mission		
		as_annonce	false
		validate	true
		# TODO add attachments attributes

		factory :future_manif do
			date_fin Date.today + 2.days
			date_debut Date.today + 1.day
		end

		factory :past_manif do
			date_debut 	Date.today - 2.days
			date_fin	Date.today - 1.day
		end

		factory :notended_manif do
			date_debut	Date.today - 1.day
			date_fin	Date.today + 2.days
		end

		factory :not_validated do
			validate false
		end
	end
end