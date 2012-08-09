# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    nom "MyString"
    prenom "MyString"
    telephone "MyString"
    administration "MyString"
    portable "MyString"
    email "MyString"
    demande "MyText"
  end
end
