module MissionsHelper
  def lieu(evenement)
    if evenement.lieu != ""
      @content = "à" + "#{evenement.lieu}"
    else
      @content = ""
    end
  end
end
