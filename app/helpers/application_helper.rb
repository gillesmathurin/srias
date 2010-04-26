# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_datetime(datetime)
    datetime.strftime("%d/%m/%Y %H:%M")
  end
end
