module MissionsHelper
  def lieu(action)
    if action.lieu != "" || !action.lieu.nil?
      @content = " Lieu : " + "#{action.lieu}"
    else
      @content = ""
    end
  end
end
