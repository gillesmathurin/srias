module PartenairesHelper
  def image_present?(partenaire)
    partenaire.logo.url(:thumb) != "/logos/thumb/missing.png"
  end
end
