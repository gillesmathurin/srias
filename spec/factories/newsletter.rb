FactoryGirl.define do
	sequence :numero do |n|
		"#{n}"
	end

	factory :newsletter do
		titre			"un titre"
		sommaire		"un court sommaire"
		content			"contenu de la newsletter"
		delivered_at 	nil
		numero
	end
end