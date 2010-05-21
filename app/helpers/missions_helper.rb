module MissionsHelper
  def lieu(action)
    if action.lieu != ""
      @content = "à" + "#{action.lieu}"
    else
      @content = ""
    end
  end
end
