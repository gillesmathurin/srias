module ManifestationsHelper
  def fiche_presente?(partenaire)
    partenaire.fiche.url() != "/logos/thumb/missing.png"
  end
end
