module MissionsHelper
  def lieu(action)
    if action.lieu != "" || !action.lieu.nil?
      @content = " à " + "#{action.lieu}"
    else
      @content = ""
    end
  end
end
